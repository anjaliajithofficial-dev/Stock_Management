<?php
require_once __DIR__ . '/includes/layout.php';
require_login();
$uid = current_user()['id'];

// If the user clicks "Mark all as read", update the DB and redirect
if (isset($_GET['mark_all']) && $_GET['mark_all'] == '1') {
    Database::conn()->prepare('UPDATE notifications SET is_read = 1 WHERE user_id = ?')->execute([$uid]);
    flash('success', 'All notifications marked as read.');
    redirect('/notifications.php');
}

$list = rows('SELECT * FROM notifications WHERE user_id = ? ORDER BY id DESC LIMIT 100', [$uid]);
render_header('Notifications');
?>
<div class="d-flex justify-content-between align-items-center mb-3">
  <h1 class="h3 mb-0">Notifications</h1>
  
  <?php 
  // Only show the button if there is at least one unread notification
  $hasUnread = false;
  foreach ($list as $n) { if (!$n['is_read']) { $hasUnread = true; break; } }
  if ($hasUnread): 
  ?>
    <a href="?mark_all=1" class="btn btn-outline-secondary btn-sm">
        <i class="bi bi-check2-all me-1"></i>Mark all as read
    </a>
  <?php endif; ?>
</div>

<div class="list-group shadow-sm">
<?php foreach ($list as $n): ?>
  <div class="list-group-item <?= $n['is_read'] ? '' : 'list-group-item-warning' ?>">
    <div class="fw-semibold">
        <?= e($n['title']) ?> 
        <small class="text-muted ms-2"><?= date('d-m-Y H:i', strtotime($n['created_at'])) ?></small>
    </div>
    <?= e($n['message']) ?>
  </div>
<?php endforeach; ?>

<?php if (!$list): ?>
  <div class="list-group-item text-center text-muted py-5">
    <i class="bi bi-bell-slash fs-1 mb-3 d-block"></i>
    You have no notifications right now.
  </div>
<?php endif; ?>
</div>
<?php render_footer(); ?>