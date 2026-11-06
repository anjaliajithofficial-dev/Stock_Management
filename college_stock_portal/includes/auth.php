<?php
require_once __DIR__ . '/functions.php';

if (session_status() !== PHP_SESSION_ACTIVE) {
    session_set_cookie_params([
        'httponly' => true,
        'samesite' => 'Lax',
        'secure' => !empty($_SERVER['HTTPS']),
    ]);
    session_start();
}

function current_user(): ?array
{
    static $verified = false;
    if (empty($_SESSION['user'])) {
        return null;
    }
    if (!$verified) {
        $verified = true;
        $row = one('SELECT status, role, department_id FROM users WHERE id = ?', [$_SESSION['user']['id']]);
        if (!$row || $row['status'] !== 'ACTIVE') {
            $_SESSION = [];
            session_destroy();
            return null;
        }
        $_SESSION['user']['role'] = $row['role'];
        $_SESSION['user']['department_id'] = $row['department_id'];
    }
    return $_SESSION['user'];
}

function require_login(): void
{
    if (!current_user()) {
        redirect('/login.php');
    }
}

function require_role(array $roles): void
{
    require_login();
    if (!in_array(current_user()['role'], $roles, true)) {
        http_response_code(403);
        exit('Access denied.');
    }
}

function login_blocked(string $email): bool
{
    $byEmail = one(
        'SELECT COUNT(*) c FROM login_history
         WHERE success = 0 AND email = ? AND created_at > (NOW() - INTERVAL 15 MINUTE)',
        [$email]
    );
    $byIp = one(
        'SELECT COUNT(*) c FROM login_history
         WHERE success = 0 AND ip_address = ? AND created_at > (NOW() - INTERVAL 15 MINUTE)',
        [$_SERVER['REMOTE_ADDR'] ?? '']
    );
    return (int)$byEmail['c'] >= 5 || (int)$byIp['c'] >= 20;
}

function login_user(string $email, string $password): bool
{
    if (login_blocked($email)) {
        flash('danger', 'Too many failed attempts. Try again in 15 minutes.');
        return false;
    }

    $stmt = Database::conn()->prepare('SELECT u.*, d.name AS department_name FROM users u LEFT JOIN departments d ON d.id = u.department_id WHERE u.email = ? AND u.status = "ACTIVE"');
    $stmt->execute([$email]);
    $user = $stmt->fetch();
    $ok = $user && password_verify($password, $user['password_hash']);
    Database::conn()->prepare('INSERT INTO login_history (user_id, email, success, ip_address) VALUES (?, ?, ?, ?)')
        ->execute([$user['id'] ?? null, $email, $ok ? 1 : 0, $_SERVER['REMOTE_ADDR'] ?? 'CLI']);
    if (!$ok) {
        flash('danger', 'Invalid email or password.');
        return false;
    }
    if (!in_array($user['role'], ['GSSSR', 'IETW', 'DEPARTMENT'], true)) {
        return false;
    }
    session_regenerate_id(true);
    $_SESSION['user'] = [
        'id'              => (int)$user['id'],
        'name'            => $user['name'],
        'email'           => $user['email'],
        'role'            => $user['role'],
        'department_id'   => $user['department_id'],
        'department_name' => $user['department_name'],
    ];
    log_activity('Logged in');
    return true;
}