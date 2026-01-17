# Quick Start Guide

Get the Extension Mapper & Recommender up and running in 5 minutes!

## Prerequisites

✅ OpenCart 3.x or 4.x installed  
✅ Admin access to your OpenCart store  
✅ FTP or file manager access

## Installation (3 Steps)

### Step 1: Upload Files (2 minutes)

Download and upload the extension files:

```bash
# Clone or download repository
git clone https://github.com/orgitcog/ocmarkext.git

# Upload files via FTP
cd ocmarkext
# Upload everything in 'upload/' to your OpenCart root directory
```

**File locations:**
```
Your OpenCart Root/
├── admin/
│   ├── controller/extension/module/ext_mapper.php
│   ├── model/extension/module/ext_mapper.php
│   ├── language/en-gb/extension/module/ext_mapper.php
│   └── view/template/extension/module/ext_mapper.tpl
```

### Step 2: Install Module (1 minute)

1. Log in to **OpenCart Admin Panel**
2. Navigate to: **Extensions** → **Extensions**
3. Select **"Modules"** from dropdown
4. Find **"Extension Mapper & Recommender"**
5. Click the **green Install button** (+ icon)
6. Click the **blue Edit button** (pencil icon)
7. Set **Status** to **"Enabled"**
8. Click **"Save"**

✅ **Done!** Module is now active.

### Step 3: Import Sample Data (Optional, 1 minute)

Want to see it in action with sample data?

```bash
# Via command line
mysql -u your_username -p your_database < install/sample_data.sql

# Or via phpMyAdmin
# 1. Select your OpenCart database
# 2. Click "Import" tab
# 3. Choose install/sample_data.sql
# 4. Click "Go"
```

This adds 11 sample extensions with recommendations!

## First Use (2 minutes)

### View Extension Categories

1. Go to: **Extensions** → **Extensions** → **Modules**
2. Click **"Edit"** on **"Extension Mapper & Recommender"**
3. Click **"Extensions"** tab
4. Browse 10 pre-configured categories:
   - 💳 Payment Gateways
   - 🚚 Shipping Methods
   - 📢 Marketing & SEO
   - And 7 more!

### Explore Functionality Mapping

1. Click **"Functionality Mapping"** tab
2. See 15 key functionalities:
   - Payment Processing
   - SEO Optimization
   - Email Marketing
   - Multi-currency support
   - And more!

### Get Recommendations

1. Click **"Recommendations"** tab
2. Browse 8 use cases:
   - 🏪 Basic Online Store
   - 👕 Fashion & Apparel Store
   - 💾 Digital Downloads Store
   - 🛍️ Marketplace
   - 🏭 B2B Wholesale
   - 📦 Dropshipping Business
   - 🔄 Subscription Service
   - 🌍 International Store
3. View recommended extensions for each!

## Common Tasks

### Add Your First Extension

```php
// Via Admin Interface:
1. Go to Extensions tab
2. Click "Add Extension" (if available)
3. Fill in details
4. Save

// Via SQL:
INSERT INTO oc_ext_mapper_extensions 
(name, description, category_id, version, author, price, rating, downloads, date_added, status) 
VALUES 
('My Payment Gateway', 'Secure payment processing', 1, '1.0', 'Me', 29.99, 4.5, 1000, NOW(), 1);
```

### Find Extensions by Category

**Payment Gateways (category_id = 1):**
- Navigate to Extensions tab
- Look for Payment Gateways section
- View all payment-related extensions

**SEO Tools (category_id = 3):**
- Browse Marketing & SEO category
- Find optimization extensions

### Get Recommendations for Your Store Type

**Fashion Store:**
- Go to Recommendations tab
- Find "Fashion & Apparel Store"
- Review suggested extensions:
  - Modern payment solutions
  - Social media integration
  - Image galleries
  - Product filters

**B2B Store:**
- Find "B2B Wholesale"
- See recommendations:
  - Tiered pricing
  - Quote system
  - Bulk orders
  - Customer groups

## Quick Reference

### Database Tables (with prefix oc_)

| Table | Purpose |
|-------|---------|
| `ext_mapper_extensions` | Extension details |
| `ext_mapper_categories` | Extension categories |
| `ext_mapper_functionalities` | Feature definitions |
| `ext_mapper_extension_functionality` | Extension-feature mapping |
| `ext_mapper_use_cases` | Business scenarios |
| `ext_mapper_recommendations` | Use case suggestions |

### Category IDs

| ID | Category |
|----|----------|
| 1 | Payment Gateways |
| 2 | Shipping Methods |
| 3 | Marketing & SEO |
| 4 | Social Media |
| 5 | Reporting & Analytics |
| 6 | Product Management |
| 7 | Customer Management |
| 8 | Design & Layout |
| 9 | Security |
| 10 | Performance |

### Use Case IDs

| ID | Use Case |
|----|----------|
| 1 | Basic Online Store |
| 2 | Fashion & Apparel Store |
| 3 | Digital Downloads Store |
| 4 | Marketplace |
| 5 | B2B Wholesale |
| 6 | Dropshipping Business |
| 7 | Subscription Service |
| 8 | International Store |

## Troubleshooting (30 seconds)

**Module not showing?**
```
1. Clear OpenCart cache
2. Verify files uploaded correctly
3. Check file permissions (644 for files, 755 for folders)
```

**Database errors?**
```
1. Check database prefix in config.php
2. Verify MySQL user has CREATE permissions
3. Manually run install/install.sql
```

**Blank page?**
```
1. Check system/storage/logs/error.log
2. Enable PHP error display
3. Verify PHP version (7.2+)
```

**Extensions not displaying?**
```
1. Import sample_data.sql
2. Check extension status = 1
3. Verify database tables exist
```

## What's Next?

### Learn More
- 📖 [Full Documentation](README.md)
- 🏗️ [Architecture Guide](ARCHITECTURE.md)
- ⚙️ [Detailed Installation](INSTALL.md)
- ✨ [All Features](FEATURES.md)

### Customize
- Add your own extensions
- Create custom use cases
- Map functionalities to extensions
- Build recommendations

### Contribute
- Report bugs on GitHub
- Suggest features
- Submit pull requests
- Improve documentation

## Need Help?

1. **Check Documentation:**
   - README.md - Overview and features
   - INSTALL.md - Detailed installation
   - FEATURES.md - Feature guide
   - ARCHITECTURE.md - Technical details

2. **GitHub Issues:**
   - Search existing issues
   - Create new issue with details
   - Tag appropriately

3. **Community:**
   - OpenCart forums
   - GitHub discussions
   - Stack Overflow

## Success! 🎉

You now have a working Extension Mapper & Recommender!

**You can:**
- ✅ Browse extensions by category
- ✅ Map extensions to functionalities
- ✅ Get use case recommendations
- ✅ Organize extension information
- ✅ Make informed extension choices

**Next steps:**
1. Add your favorite extensions
2. Create custom recommendations
3. Share with the community

---

**Time to complete:** ~5 minutes  
**Difficulty:** Easy  
**Support:** GitHub Issues

**Happy organizing! 🚀**
