# Frequently Asked Questions (FAQ)

## General Questions

### What is the Extension Mapper & Recommender?

The Extension Mapper & Recommender is an OpenCart module that helps store owners discover, organize, and select the right extensions for their e-commerce needs. It provides:

- **Extension Listing** - Browse extensions by category
- **Functionality Mapping** - Find extensions by what they do
- **Use Case Recommendations** - Get curated extension combinations for specific business models

### Why do I need this module?

OpenCart has thousands of extensions available. This module helps you:
- **Save time** - Quickly find relevant extensions
- **Make better decisions** - Compare options side-by-side
- **Avoid mistakes** - Get recommendations based on proven combinations
- **Stay organized** - Keep track of extension information
- **Learn best practices** - See what works for similar stores

### Is this module free?

Yes! The Extension Mapper & Recommender is open-source and released under the MIT License. You can use, modify, and distribute it freely.

---

## Compatibility Questions

### Which OpenCart versions are supported?

The module supports:
- OpenCart 3.0.x ✓
- OpenCart 3.1.x ✓
- OpenCart 3.2.x ✓
- OpenCart 4.0.x ✓

For OpenCart 2.x, modifications may be required.

### What are the system requirements?

**Minimum requirements:**
- PHP 7.2 or higher
- MySQL 5.6 or higher
- OpenCart 3.0.0 or higher

**Recommended:**
- PHP 8.0+
- MySQL 8.0+
- 256MB PHP memory limit

### Will it work with other extensions?

Yes! This module:
- Does not modify core OpenCart files
- Follows OpenCart's MVC architecture
- Uses separate database tables
- Should not conflict with other extensions

---

## Installation Questions

### How do I install the module?

**Quick method:**
1. Upload files from `upload/` directory to OpenCart root
2. Go to Extensions → Extensions → Modules
3. Find "Extension Mapper & Recommender"
4. Click Install, then Edit
5. Enable and Save

See [INSTALL.md](INSTALL.md) for detailed instructions.

### Do I need to modify any core files?

No! The module is fully self-contained and follows OpenCart's extension structure. No core modifications required.

### What database changes does it make?

The module creates 6 new tables:
- `oc_ext_mapper_extensions`
- `oc_ext_mapper_categories`
- `oc_ext_mapper_functionalities`
- `oc_ext_mapper_extension_functionality`
- `oc_ext_mapper_use_cases`
- `oc_ext_mapper_recommendations`

All tables use the `ext_mapper_` prefix for easy identification.

### Can I install it on a live site?

Yes, but we recommend:
1. **Backup first** - Database and files
2. **Test on staging** - If possible
3. **Install during low traffic** - To minimize impact

The installation is safe and non-destructive.

---

## Usage Questions

### Where do I access the module?

After installation:
1. Log in to OpenCart Admin
2. Go to **Extensions** → **Extensions**
3. Select **"Modules"** from dropdown
4. Click **"Edit"** on "Extension Mapper & Recommender"

### How do I add my own extensions?

**Method 1: Via Admin Interface** (planned feature)
- Go to Extensions tab
- Click "Add Extension"
- Fill in details
- Save

**Method 2: Via SQL**
```sql
INSERT INTO oc_ext_mapper_extensions 
(name, description, category_id, version, author, price, rating, downloads, date_added, status) 
VALUES 
('Extension Name', 'Description', 1, '1.0', 'Author', 29.99, 4.5, 1000, NOW(), 1);
```

### How do recommendations work?

Recommendations are based on:
1. **Use case analysis** - What type of store you're running
2. **Essential features** - Must-have extensions (priority 10+)
3. **Recommended features** - Strongly suggested (priority 5-9)
4. **Optional features** - Nice to have (priority 1-4)
5. **Community feedback** - Popular combinations

### Can I create custom use cases?

Yes! Add to the database:

```sql
INSERT INTO oc_ext_mapper_use_cases 
(name, description, icon) 
VALUES 
('My Custom Store Type', 'Description of store type', 'fa-icon-name');
```

Then add recommendations for your use case.

### How do I update extension information?

Update via SQL:

```sql
UPDATE oc_ext_mapper_extensions 
SET rating = 4.8, downloads = 100000 
WHERE extension_id = 1;
```

---

## Data Questions

### Does it include real extension data?

The module includes:
- **Pre-configured categories** (10) - Yes
- **Pre-configured functionalities** (15) - Yes
- **Pre-configured use cases** (8) - Yes
- **Sample extensions** - Optional (via sample_data.sql)

You can add your own extensions or import the sample data.

### Where does extension data come from?

Currently, you manually add extension data. Future versions may include:
- OpenCart marketplace API integration
- Automatic data updates
- Community-contributed data
- Web scraping (with permission)

### How often should I update data?

It depends on your needs:
- **Ratings/downloads** - Monthly or quarterly
- **New extensions** - As discovered
- **Prices** - When they change
- **Versions** - When updated

Automated updates are planned for future versions.

### Can I import data in bulk?

Yes! Use SQL:

```sql
-- Import from CSV or SQL dump
LOAD DATA INFILE '/path/to/extensions.csv'
INTO TABLE oc_ext_mapper_extensions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(name, description, category_id, ...);
```

Or use phpMyAdmin's import feature.

---

## Technical Questions

### Is it secure?

Yes! The module:
- Uses OpenCart's built-in security
- Validates all user input
- Escapes SQL queries
- Requires admin permissions
- Follows OWASP guidelines

### Does it affect performance?

Minimal impact:
- Lightweight queries with indexes
- No frontend load (admin only)
- Efficient database design
- Caching recommended for large datasets (future)

### Can I extend the module?

Absolutely! The module is:
- Open source (MIT License)
- Well-documented
- Follows MVC pattern
- Easy to modify

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Is there an API?

Currently provides AJAX endpoints:
- `getRecommendations` - Get use case recommendations
- `addExtension` - Add new extension

Full REST API planned for future versions.

---

## Troubleshooting Questions

### Module doesn't appear after installation

**Solutions:**
1. Clear OpenCart cache (System → Settings)
2. Refresh extensions list
3. Check file permissions (644 files, 755 directories)
4. Verify all files uploaded correctly
5. Check error logs

### Database tables not created

**Solutions:**
1. Check MySQL user has CREATE TABLE permission
2. Manually run `install/install.sql`
3. Verify database prefix matches config
4. Check for conflicting table names

### Extensions not displaying in list

**Solutions:**
1. Import sample data: `install/sample_data.sql`
2. Check extension status = 1
3. Verify database connection
4. Add extensions manually

### Permission errors

**Solutions:**
1. Verify user has module permissions
2. Check admin user group settings
3. Re-install module
4. Review error logs

### Blank page or white screen

**Solutions:**
1. Enable PHP error display
2. Check `system/storage/logs/error.log`
3. Verify PHP version (7.2+)
4. Check for syntax errors
5. Increase PHP memory limit

---

## Feature Requests

### Can you add feature X?

We welcome feature requests! Please:
1. Check [CHANGELOG.md](CHANGELOG.md) for planned features
2. Search GitHub Issues for similar requests
3. Create new issue with detailed description
4. Consider contributing via pull request

### Will you integrate with the OpenCart marketplace?

Yes! This is a planned feature:
- Real-time extension data
- Automatic updates
- Rating sync
- Download counts

### Can it recommend based on my existing extensions?

Great idea! Planned features include:
- Scan installed extensions
- Suggest complementary extensions
- Detect conflicts
- Identify gaps

### Will there be a frontend version?

Possible future enhancement:
- Customer-facing recommendations
- "Others also bought" feature
- Extension reviews
- Comparison tool

---

## Licensing Questions

### What license is it under?

MIT License - very permissive:
- ✓ Commercial use
- ✓ Modification
- ✓ Distribution
- ✓ Private use
- ⚠️ Provided "as is" without warranty

### Can I use it commercially?

Yes! You can:
- Use on unlimited stores
- Modify for clients
- Include in hosting packages
- Sell customized versions (with attribution)

### Do I need to give credit?

Attribution is appreciated but not required under MIT License. If you find it helpful, consider:
- ⭐ Star the GitHub repository
- 🔗 Link to the project
- 📝 Mention in documentation
- 🤝 Contribute improvements

---

## Support Questions

### Where can I get help?

**Free support:**
- 📖 Documentation (README, INSTALL, FEATURES)
- 🐛 GitHub Issues for bugs
- 💬 GitHub Discussions for questions
- 📚 Architecture guide for developers

**Community support:**
- OpenCart forums
- Stack Overflow (tag: opencart)
- Reddit r/opencart

### How do I report a bug?

1. Check if already reported on GitHub Issues
2. Gather information:
   - OpenCart version
   - PHP version
   - MySQL version
   - Error messages
   - Steps to reproduce
3. Create detailed issue on GitHub

### Can I hire someone for customization?

Yes! Options:
- Post job on Upwork, Freelancer
- Contact OpenCart developers
- Check OpenCart partner directory
- Fork and customize yourself

---

## Contribution Questions

### How can I contribute?

Many ways to help:
- 🐛 Report bugs
- 💡 Suggest features  
- 📝 Improve documentation
- 🔧 Submit code fixes
- 🌍 Translate to other languages
- ⭐ Star the repository
- 📢 Share with others

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### What skills do I need?

Depends on contribution type:
- **Bug reports** - Basic testing
- **Documentation** - Writing skills
- **Code** - PHP, SQL, HTML/CSS
- **Translation** - Language skills

### Will my contribution be accepted?

We review all contributions! More likely to accept if:
- Follows coding standards
- Includes tests
- Has clear documentation
- Solves real problem
- Maintains backwards compatibility

---

## Future Plans

### What's next for this module?

Planned features (see [CHANGELOG.md](CHANGELOG.md)):
- OpenCart marketplace API integration
- Advanced search and filtering
- Extension conflict detection
- Compatibility matrix
- Cost calculator
- Multi-language support
- REST API
- Performance optimizations

### When will version 2.0 be released?

No fixed timeline. Following features for major releases:
- v1.x - Core functionality (current)
- v2.x - API integration, advanced features
- v3.x - AI recommendations, analytics

Follow GitHub for updates!

---

## Still Have Questions?

- 📧 Open an issue on GitHub
- 💬 Start a discussion
- 📖 Read the documentation
- 🔍 Search existing issues

We're here to help! 🚀
