<?php
session_start();
date_default_timezone_set('Asia/Kolkata');

// ---- Paths ----
define('BASE_PATH', dirname(__DIR__));
define('BASE_URL', '/New%20folder/college_stock_portal');
define('UPLOAD_PATH', BASE_PATH . '/uploads/');

// ---- DB credentials ----
define('DB_HOST', 'localhost');
define('DB_NAME', 'college_stock_db');
define('DB_USER', 'root');
define('DB_PASS', '');

// ---- App constants ----
define('APP_NAME', 'GSSS Institute of Engineering and Technology for Women - Stock Management System');
define('APP_SHORT_NAME', 'GSSSIETW - Stock');
define('APP_LOGO', BASE_URL . '/assets/images/gsss.png');
define('EDIT_LOCK_MINUTES', 10);

// ---- Core includes ----
require_once BASE_PATH . '/includes/db.php';         // defines the Database class
require_once BASE_PATH . '/includes/functions.php';  // helpers: rows(), one(), e(), etc.
require_once BASE_PATH . '/includes/auth.php';       // session and role checks

// ---- Optional modules ----
require_once BASE_PATH . '/includes/BackupManager.php';

