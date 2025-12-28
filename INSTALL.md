# Installation Guide

## Prerequisites

Before installing the Extension Mapper & Recommender module, ensure you have:

- OpenCart 3.0 or higher installed
- Admin access to your OpenCart store
- FTP/SSH access to your server (for file uploads)
- MySQL database access (optional, for manual installation)

## Installation Methods

### Method 1: Extension Installer (Recommended)

1. **Prepare the Extension Package**
   ```bash
   cd /path/to/ocmarkext
   zip -r ext_mapper.ocmod.zip upload/ install/ extension.xml
   ```

2. **Upload via OpenCart Admin**
   - Log in to OpenCart Admin
   - Navigate to `Extensions` → `Installer`
   - Click "Upload" and select `ext_mapper.ocmod.zip`
   - Wait for the upload to complete

3. **Install the Extension**
   - Go to `Extensions` → `Extensions`
   - Select "Modules" from the dropdown
   - Find "Extension Mapper & Recommender"
   - Click the green "Install" button (+ icon)

4. **Enable the Module**
   - After installation, click the blue "Edit" button (pencil icon)
   - Set Status to "Enabled"
   - Click "Save"

### Method 2: Manual FTP Upload

1. **Connect via FTP/SFTP**
   - Use FileZilla, WinSCP, or command-line SFTP
   - Connect to your server
   - Navigate to your OpenCart installation directory

2. **Upload Files**
   ```
   Local: upload/admin/controller/extension/module/ext_mapper.php
   Remote: /admin/controller/extension/module/ext_mapper.php
   
   Local: upload/admin/model/extension/module/ext_mapper.php
   Remote: /admin/model/extension/module/ext_mapper.php
   
   Local: upload/admin/language/en-gb/extension/module/ext_mapper.php
   Remote: /admin/language/en-gb/extension/module/ext_mapper.php
   
   Local: upload/admin/view/template/extension/module/ext_mapper.tpl
   Remote: /admin/view/template/extension/module/ext_mapper.tpl
   ```

3. **Set Permissions**
   ```bash
   chmod 644 admin/controller/extension/module/ext_mapper.php
   chmod 644 admin/model/extension/module/ext_mapper.php
   chmod 644 admin/language/en-gb/extension/module/ext_mapper.php
   chmod 644 admin/view/template/extension/module/ext_mapper.tpl
   ```

4. **Run Database Installation**
   - Option A: Use the module's install function (automatic when you click Install)
   - Option B: Manually import `install/install.sql` via phpMyAdmin or command line

5. **Install via Admin Panel**
   - Go to `Extensions` → `Extensions` → "Modules"
   - Find "Extension Mapper & Recommender"
   - Click "Install" then "Edit"

### Method 3: Command Line (Advanced)

1. **Clone Repository**
   ```bash
   cd /var/www/html/opencart
   git clone https://github.com/orgitcog/ocmarkext.git temp_ext_mapper
   ```

2. **Copy Files to OpenCart Directory**
   ```bash
   cp -R temp_ext_mapper/upload/* .
   ```

3. **Import Database**
   ```bash
   mysql -u username -p database_name < temp_ext_mapper/install/install.sql
   ```
   
   Replace:
   - `username` with your MySQL username
   - `database_name` with your OpenCart database name
   - Update `oc_` prefix if your installation uses different prefix

4. **Clean Up**
   ```bash
   rm -rf temp_ext_mapper
   ```

5. **Complete Installation in Admin Panel**

## Post-Installation Steps

### 1. Verify Installation

- Log in to OpenCart Admin
- Navigate to `Extensions` → `Extensions` → "Modules"
- Confirm "Extension Mapper & Recommender" is listed
- Status should show as "Installed"

### 2. Import Sample Data (Optional)

To populate the module with example extensions:

```bash
mysql -u username -p database_name < install/sample_data.sql
```

This adds:
- 11 sample extensions
- Functionality mappings
- Use case recommendations

### 3. Configure Module Settings

1. Click "Edit" on the Extension Mapper module
2. Set Status to "Enabled"
3. Click "Save"

### 4. Access the Module

Navigate to: `Extensions` → `Extensions` → "Modules" → "Extension Mapper & Recommender" → "Edit"

## Verification Checklist

- [ ] Module appears in Extensions list
- [ ] Can access module configuration page
- [ ] Database tables created successfully
- [ ] Categories display correctly (10 categories)
- [ ] Functionalities are populated (15 items)
- [ ] Use cases are listed (8 use cases)
- [ ] No PHP errors in error log
- [ ] Module can be enabled/disabled

## Database Table Verification

Check if all tables were created:

```sql
SHOW TABLES LIKE '%ext_mapper%';
```

Expected tables:
- `oc_ext_mapper_extensions`
- `oc_ext_mapper_categories`
- `oc_ext_mapper_functionalities`
- `oc_ext_mapper_extension_functionality`
- `oc_ext_mapper_use_cases`
- `oc_ext_mapper_recommendations`

## Troubleshooting

### Problem: Module doesn't appear in Extensions list

**Solution:**
1. Clear OpenCart cache:
   - System → Settings → "Edit" store → Server tab → Clear cache
2. Verify all files uploaded to correct locations
3. Check file permissions (should be readable by web server)

### Problem: Database errors during installation

**Solution:**
1. Verify database credentials in `config.php`
2. Check MySQL user has CREATE TABLE privileges
3. Confirm database prefix matches (`DB_PREFIX`)
4. Manually run installation SQL with correct prefix

### Problem: Blank page after installation

**Solution:**
1. Enable PHP error display:
   ```php
   error_reporting(E_ALL);
   ini_set('display_errors', 1);
   ```
2. Check `system/storage/logs/error.log`
3. Verify PHP version (7.2+)
4. Check for syntax errors in PHP files

### Problem: Permission denied errors

**Solution:**
```bash
# Set correct ownership
chown -R www-data:www-data /path/to/opencart

# Set correct permissions
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
```

### Problem: "Table already exists" error

**Solution:**
1. Check if tables exist from previous installation
2. Either drop existing tables or skip installation SQL
3. Use uninstall.sql to clean up:
   ```bash
   mysql -u username -p database_name < install/uninstall.sql
   ```

## Uninstallation

### Via Admin Panel

1. Navigate to `Extensions` → `Extensions` → "Modules"
2. Find "Extension Mapper & Recommender"
3. Click the red "Uninstall" button (- icon)
4. Confirm uninstallation

### Manual Database Cleanup

If you need to remove database tables:

```bash
mysql -u username -p database_name < install/uninstall.sql
```

Or via phpMyAdmin:
1. Select your OpenCart database
2. Find tables starting with `oc_ext_mapper_`
3. Select all matching tables
4. Choose "Drop" from the dropdown menu

## Upgrade Instructions

When a new version is released:

1. **Backup First**
   - Backup database
   - Backup extension files

2. **Uninstall Old Version**
   - Via Admin Panel or manually

3. **Upload New Files**
   - Replace old files with new ones

4. **Run Update Script** (if provided)
   ```bash
   mysql -u username -p database_name < install/update.sql
   ```

5. **Reinstall**
   - Install module via Admin Panel

## Support

If you encounter issues not covered in this guide:

1. Check the [GitHub Issues](https://github.com/orgitcog/ocmarkext/issues)
2. Review OpenCart error logs
3. Verify system requirements
4. Create a new issue with:
   - OpenCart version
   - PHP version
   - MySQL version
   - Error messages
   - Steps to reproduce

---

**Next Steps:** After successful installation, read the [README.md](README.md) for usage instructions and feature documentation.
