<?php
// 1. Load the layout (this gives us render_header, e(), etc.)
require_once __DIR__ . '/includes/layout.php';
require_login();
verify_csrf();

$user = current_user();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $current = $_POST['current'] ?? '';
    $new     = $_POST['new'] ?? '';
    $confirm = $_POST['confirm'] ?? '';
    $dbUser  = one('SELECT password_hash FROM users WHERE id = ?', [$user['id']]);

    if (!password_verify($current, $dbUser['password_hash'])) {
        flash('danger', 'Current password is incorrect.');
    } elseif (strlen($new) < 8) {
        flash('danger', 'New password must be at least 8 characters.');
    } elseif ($new !== $confirm) {
        flash('danger', 'New passwords do not match.');
    } elseif ($new === $current) {
        flash('danger', 'New password must differ from the current one.');
    } else {
        Database::conn()->prepare('UPDATE users SET password_hash = ? WHERE id = ?')
            ->execute([password_hash($new, PASSWORD_DEFAULT), $user['id']]);
        log_activity('Changed own password');
        flash('success', 'Password changed successfully.');
    }
    redirect('/profile.php');
}

// 2. Render the page header
render_header('My Account');
?>

<!-- 3. The Centered Form -->
<div class="row justify-content-center mt-5">
    <div class="col-md-6 col-lg-5">
        
        <h2 class="h4 mb-4 text-center">Change Password</h2>
        
        <div class="card metric-card shadow-sm">
            <div class="card-body p-4">
                <form method="post">
                    <?php csrf_field(); ?>
                    
                    <div class="mb-3">
                        <label class="form-label">Current password</label>
                        <input type="password" name="current" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">New password (min 8)</label>
                        <input type="password" name="new" class="form-control" minlength="8" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Confirm new password</label>
                        <input type="password" name="confirm" class="form-control" required>
                    </div>
                    
                    <div class="d-grid mt-4">
                        <button class="btn btn-primary">Update Password</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<?php render_footer(); ?>