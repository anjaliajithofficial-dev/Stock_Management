# College Stock & Inventory Management System

A production-style PHP/MySQL web application that digitises the entire
stationery and stock-request workflow of an engineering college. Built for
deployment on a WAMP server with no external PHP dependencies.

---

## Overview

The system replaces paper indents and manual registers with a role-based
online portal. Departments raise requests, a middle admin (IETW) consolidates
them, and a super admin (GSSSR) approves or rejects. Approved stock is
distributed back to each department and tracked as departmental inventory.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | HTML5, CSS3, Bootstrap 5, Bootstrap Icons, vanilla JavaScript, AJAX |
| Backend  | Core PHP (PDO for database access) |
| Database | MySQL (utf8mb4, InnoDB) |
| Reports  | Custom `SimplePdf` (PDF) and `SimpleExcel` (XLSX/CSV) — no Composer needed |
| Server   | WAMP (Apache + MySQL + PHP) |

---

## User Roles

| Role | Description |
|------|-------------|
| **DEPARTMENT** | Raises stock requests, tracks request history, and views the stock issued to their department |
| **IETW** | Consolidates all pending department requests into one, then distributes approved stock to individual departments |
| **GSSSR** | Super admin — manages items, categories, users; approves / partially approves / rejects consolidated requests; generates reports |

---

## Request Workflow

1. **Department** creates a request (`PENDING_IETW`).
2. **IETW** consolidates all pending requests into one (`CONSOLIDATED_BY_IETW`).
   Original requests become `CONSOLIDATED` and are hidden from GSSSR.
3. **GSSSR** approves fully, partially approves, or rejects (`APPROVED_BY_GSSSR`,
   `PARTIALLY_APPROVED_BY_GSSSR`, `REJECTED_BY_GSSSR`).
   Rejected requests remain visible to departments as "Pending" (hidden rejection).
4. **IETW** distributes the approved quantities to each original department
   and issues stock (`ISSUED`).
5. **Department** sees its own stock via *My Stock* and its issue history.

---

## Key Features

- **Two-admin workflow** – IETW prepares, GSSSR approves. No single point of failure.
- **Consolidate All** – one-click merge of all pending department requests into a single request, with aggregated quantities.
- **Proportional integer distribution** – approved quantities are split across departments using the largest-remainder method.
- **Department-specific inventory** – each department has its own stock, tracked separately from the central warehouse.
- **Hidden rejection** – departments never see a "Rejected" status; they only see "Pending".
- **Auto-generated item codes** – based on the category prefix (e.g., `STAT-101`, `COMP-202`).
- **Integer quantities everywhere** – no fractional units.
- **Professional PDF reports** – grouped by category, tight headings, spaced between categories.
- **Descriptive file names** – `Request_DepartmentName_2026-06-07.pdf`, `StockBook_College_Current_month_2026-06-07.pdf`.
- **Custom date-range dashboard** – filter graphs by any date range with monthly breakdown.
- **Excel import/export** – bulk import items, export stock and request reports.
- **Activity logging** – every important action is recorded with user + IP + timestamp.
- **Notifications** – stakeholders are notified on approvals and rejections.
- **CSRF protection** – every POST form includes a token.
- **File upload validation** – only safe extensions allowed; files renamed with random strings.
- **Low-stock alerts** – dashboard shows count, item lists flag low-stock rows in red.

---

## Folder Structure

```
college_stock_portal/
├── admin/                → GSSSR pages
│   ├── items.php
│   ├── categories.php
│   ├── requests.php      (Approval Desk)
│   ├── reports.php
│   ├── users.php
│   ├── logs.php
│   ├── transactions.php
│   └── settings.php
│
├── IETW/                 → IETW pages
│   ├── items.php         (read-only view)
│   ├── categories.php
│   ├── transactions.php
│   ├── consolidate.php   (Consolidation Desk)
│   ├── allocate.php      (Distribution Desk)
│   └── reports.php
│
├── department/           → Department pages
│   ├── request.php
│   ├── history.php
│   └── inventory.php     (My Stock)
│
├── api/                  → AJAX endpoints
│   ├── get_next_item_code.php
│   ├── get_dashboard_stats.php
│   ├── get_low_stock.php
│   └── ...
│
├── assets/
│   ├── css/app.css
│   ├── js/app.js
│   └── images/
│
├── uploads/
│   ├── invoices/
│   ├── pdfs/
│   └── excel/
│
├── config/
│   ├── config.php
│   └── database.php
│
├── includes/
│   ├── auth.php
│   ├── layout.php
│   ├── functions.php
│   ├── db.php
│   ├── item_form.php
│   ├── SimplePdf.php
│   ├── SimpleExcel.php
│   └── ...
│
├── database/
│   ├── college_stock_db.sql
│   ├── add_department_inventory.sql
│   ├── seed_departments_dashboard.sql
│   ├── import_stationery_printing_items.sql
│   └── migrations/
│
├── dashboard.php
├── download_pdf.php
├── login.php
├── logout.php
├── index.php
└── README.md
```

---

## WAMP Setup

1. Copy the project folder to `C:\wamp64\www\college_stock_portal`.
2. Start WAMP (Apache and MySQL indicators must be green).
3. Open phpMyAdmin at `http://localhost/phpmyadmin`.
4. Create the database and import the schema:
   - `database/college_stock_db.sql`
   - `database/add_department_inventory.sql`
   - `database/seed_departments_dashboard.sql`
   - Optional: `database/import_stationery_printing_items.sql`
5. Verify database credentials in `config/config.php`.
6. Confirm that `BASE_URL` matches your folder name.
7. Visit `http://localhost/college_stock_portal/login.php`.

---

## Demo Accounts

Password for all demo accounts: **password**

| Role | Email |
|------|-------|
| GSSSR | `gsssr@college.test` |
| IETW  | `ietw@college.test` |
| CSE   | `cse@college.test` |
| ECE   | `ece@college.test` |
| EEE   | `eee@college.test` |
| AIML  | `aiml@college.test` |
| AIDS  | `aids@college.test` |
| ISE   | `ise@college.test` |
| CAC   | `cac@college.test` |

To reset all passwords to `password`, run:

```sql
UPDATE users SET password_hash = '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi';
```

---

## Database Schema (Summary)

| Table | Purpose |
|-------|---------|
| `departments` | Departments (CSE, ECE, AIML, etc.) |
| `users` | Users with role (GSSSR / IETW / DEPARTMENT) |
| `categories` | Item categories with `cat_code` prefix |
| `items` | Central stock (quantity, min stock, price) |
| `stock_transactions` | Every INWARD / OUTWARD / RETURN / ADJUSTMENT |
| `stock_book` | Daily balance snapshot |
| `requests` | Request header (status, remarks, source IDs) |
| `request_items` | Line items (requested, recommended, approved, issued) |
| `department_inventory` | Per-department stock |
| `invoices` | Uploaded invoices linked to items |
| `activity_logs` | All user actions |
| `login_history` | Login attempts |
| `notifications` | User notifications |
| `excel_import_logs` | Excel import audit |
| `pdf_export_logs` | PDF export audit |

### Important columns added during development

```sql
ALTER TABLE requests ADD COLUMN is_consolidated TINYINT(1) DEFAULT 0;
ALTER TABLE requests ADD COLUMN source_request_ids TEXT NULL;
ALTER TABLE requests ADD COLUMN consolidated_by INT NULL;
ALTER TABLE requests ADD COLUMN consolidated_at DATETIME NULL;
```

---

## Reports

### PDF Reports

- **Request PDF** – item code, department, justification, remarks.
- **Stock Book PDF** – grouped by category, tight headings, extra spacing between categories.
- **Monthly Report** – monthly stock movements.
- **Import/Export Logs** – Excel import and PDF export audit.

### Excel Reports

- Stock report
- Category report
- Request report

### File Naming Convention

- `Request_DepartmentName_YYYY-MM-DD.pdf`
- `StockBook_College_Current_month_YYYY-MM-DD.pdf`
- `MonthlyReport_Last_3_months_YYYY-MM-DD.pdf`
- `LogReport_College_All_dates_YYYY-MM-DD.pdf`

---

## Security

- Passwords hashed with `password_hash()`.
- `password_verify()` on login.
- `session_regenerate_id(true)` on login.
- `require_role()` on every protected page.
- Prepared statements (PDO) throughout.
- CSRF tokens on all POST forms.
- File uploads restricted and renamed.
- `.htaccess` protection on upload folders.
- Full activity and login logs.

---

## Testing the Workflow

1. Log in as a department user (e.g., `aiml@college.test`).
2. Create a request with a few items.
3. Log out and log in as `ietw@college.test`.
4. Go to **Consolidate** and click **Consolidate All Pending Requests**.
5. Log out and log in as `gsssr@college.test`.
6. Go to **Approval Desk** and approve (full or partial).
7. Log back in as IETW, go to **Distribution**, allocate, and click **Distribute & Issue Stock**.
8. Log back in as the department. **My Stock** shows the issued items.
9. GSSSR: go to **Reports** and download the Stock Book PDF and Excel exports.

---

## Dependencies

None. The project ships with:

- `includes/SimplePdf.php` – custom PDF writer.
- `includes/SimpleExcel.php` – native XLSX/CSV reader and writer.

No Composer, no PhpSpreadsheet, no TCPDF required.

---

## Troubleshooting

| Problem | Cause | Fix |
|---------|-------|-----|
| `Unknown column 'source_request_ids'` | Column missing in `requests` | Run the `ALTER` statements from the schema section |
| `Table 'college_stock_db.department_inventory' doesn't exist` | Table not created | Import `add_department_inventory.sql` |
| `Column 'quantity' in field list is ambiguous` | Unqualified `quantity` across joined tables | Qualify with the table name |
| Login fails for demo users | Password hash mismatch | Run the reset SQL above |
| PDF shows empty page | Missing `SimplePdf` method or invalid path | Ensure `includes/SimplePdf.php` is the latest version |

---

## License

This project was built for academic use in a college environment. You may
modify and extend it freely.

---

## Credits

Developed as part of the College Stock & Inventory Management System
initiative. Special thanks to the GSSSIETW staff for guiding the workflow
design.
