<?php
require_once __DIR__ . '/../includes/auth.php';
require_login();
header('Content-Type: application/json');

$catId = (int)($_GET['category_id'] ?? 0);
if (!$catId) { echo json_encode(['code' => '']); exit; }

$cat = one('SELECT name FROM categories WHERE id=?', [$catId]);
if (!$cat) { echo json_encode(['code' => '']); exit; }

// Build prefix from category name words (max 6 chars)
$words = preg_split('/[\s&\/\-]+/', trim($cat['name']));
$prefix = '';
foreach ($words as $w) {
    $prefix .= strtoupper(substr(preg_replace('/[^a-zA-Z0-9]/', '', $w), 0, 3));
    if (strlen($prefix) >= 4) break;
}
$prefix = substr($prefix, 0, 6);

// Find highest existing number for this prefix
$row  = one(
    "SELECT MAX(CAST(SUBSTRING_INDEX(item_code, '-', -1) AS UNSIGNED)) AS mx
     FROM items WHERE item_code LIKE ?",
    [$prefix . '-%']
);
$next = (int)($row['mx'] ?? 0) + 1;
echo json_encode(['code' => $prefix . '-' . str_pad((string)$next, 3, '0', STR_PAD_LEFT)]);