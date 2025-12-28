# Contributing to OpenCart Extension Mapper & Recommender

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Submitting Changes](#submitting-changes)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)

## Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inspiring community for all. Please be respectful and constructive in your interactions.

### Expected Behavior

- Be respectful of differing viewpoints and experiences
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other community members

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

**When submitting a bug report, include:**

- Clear, descriptive title
- Detailed steps to reproduce
- Expected behavior vs. actual behavior
- OpenCart version
- PHP version
- MySQL version
- Screenshots (if applicable)
- Error messages from logs

**Example Bug Report:**

```markdown
**Title:** Extensions not displaying in list view

**Description:**
When I navigate to the Extensions tab, the table shows "No extensions added yet" 
even though I've imported the sample data.

**Steps to Reproduce:**
1. Install module following INSTALL.md
2. Import sample_data.sql
3. Navigate to Extensions → Extensions → Modules → Extension Mapper
4. Click Extensions tab

**Expected Behavior:**
Should display 11 sample extensions in table

**Actual Behavior:**
Shows empty state message

**Environment:**
- OpenCart: 3.0.3.8
- PHP: 7.4.33
- MySQL: 5.7.42
- Browser: Chrome 120

**Error Logs:**
[Paste any relevant error messages]
```

### Suggesting Enhancements

Enhancement suggestions are welcome! Please include:

- Clear use case description
- Why this enhancement would be useful
- Possible implementation approach
- Examples from other systems (if applicable)

### Pull Requests

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make your changes**
4. **Test thoroughly**
5. **Commit with clear messages**
6. **Push to your fork**
7. **Open a Pull Request**

## Development Setup

### Prerequisites

- OpenCart 3.x or 4.x installation
- PHP 7.2 or higher
- MySQL 5.6 or higher
- Git
- Text editor or IDE

### Local Development Environment

1. **Clone the repository**
   ```bash
   git clone https://github.com/orgitcog/ocmarkext.git
   cd ocmarkext
   ```

2. **Set up test OpenCart instance**
   ```bash
   # Download OpenCart
   wget https://github.com/opencart/opencart/releases/download/3.0.3.8/opencart-3.0.3.8.zip
   unzip opencart-3.0.3.8.zip
   ```

3. **Install the extension**
   ```bash
   cp -R upload/* /path/to/opencart/
   ```

4. **Import database**
   ```bash
   mysql -u user -p opencart_db < install/install.sql
   mysql -u user -p opencart_db < install/sample_data.sql
   ```

### File Structure

```
ocmarkext/
├── upload/                          # Extension files
│   └── admin/
│       ├── controller/
│       │   └── extension/module/
│       │       └── ext_mapper.php   # Main controller
│       ├── model/
│       │   └── extension/module/
│       │       └── ext_mapper.php   # Data model
│       ├── language/
│       │   └── en-gb/extension/module/
│       │       └── ext_mapper.php   # Language strings
│       └── view/
│           └── template/extension/module/
│               └── ext_mapper.tpl   # HTML template
├── install/                         # Database scripts
│   ├── install.sql                  # Installation schema
│   ├── uninstall.sql               # Cleanup script
│   └── sample_data.sql             # Demo data
├── docs/                           # Additional documentation
├── ARCHITECTURE.md                 # Architecture documentation
├── CHANGELOG.md                    # Version history
├── CONTRIBUTING.md                 # This file
├── INSTALL.md                      # Installation guide
├── LICENSE                         # MIT License
└── README.md                       # Main documentation
```

## Coding Standards

### PHP Code Style

Follow OpenCart's coding conventions:

```php
<?php
// Class names: UpperCamelCase
class ControllerExtensionModuleExtMapper extends Controller {
    
    // Method names: camelCase
    public function getExtensions() {
        // Code here
    }
    
    // Private properties: snake_case with $ prefix
    private $error = array();
    
    // Constants: UPPER_SNAKE_CASE
    const MAX_RESULTS = 100;
}
```

### SQL Style

```sql
-- Use uppercase for SQL keywords
SELECT e.extension_id, e.name 
FROM oc_ext_mapper_extensions e
WHERE e.status = 1
ORDER BY e.rating DESC;

-- Proper indentation
INSERT INTO oc_ext_mapper_extensions 
    (name, description, category_id) 
VALUES 
    ('Extension Name', 'Description', 1);
```

### Template Style

```html
<!-- Use proper indentation -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3><?php echo $heading; ?></h3>
    </div>
    <div class="panel-body">
        <?php foreach ($items as $item) { ?>
            <p><?php echo $item['name']; ?></p>
        <?php } ?>
    </div>
</div>
```

### Documentation

- Add PHPDoc blocks for all classes and methods
- Include parameter types and return types
- Provide usage examples for complex functions

```php
<?php
/**
 * Get extension recommendations for a specific use case
 * 
 * @param int $use_case_id The use case identifier
 * @return array List of recommended extensions with priority and reasoning
 * 
 * @example
 * $recommendations = $this->model->getRecommendations(1);
 * foreach ($recommendations as $rec) {
 *     echo $rec['name'] . ' - ' . $rec['reason'];
 * }
 */
public function getRecommendations($use_case_id) {
    // Implementation
}
```

## Submitting Changes

### Commit Messages

Use clear, descriptive commit messages:

```
Add functionality for filtering extensions by rating

- Add rating filter parameter to getExtensions()
- Update view to include rating dropdown
- Add language strings for rating labels
- Update documentation

Fixes #123
```

**Format:**
- First line: Brief summary (50 chars or less)
- Blank line
- Detailed description (wrap at 72 chars)
- Reference issues/PRs

### Pull Request Process

1. **Update documentation** if needed
2. **Add/update tests** for new features
3. **Ensure backwards compatibility**
4. **Test on multiple OpenCart versions**
5. **Update CHANGELOG.md**
6. **Submit PR with clear description**

**PR Template:**

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tested on OpenCart 3.x
- [ ] Tested on OpenCart 4.x
- [ ] Added/updated unit tests
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings
- [ ] CHANGELOG.md updated

## Related Issues
Fixes #(issue number)

## Screenshots
[If applicable]
```

## Testing

### Manual Testing Checklist

- [ ] Installation works on clean OpenCart
- [ ] All tabs display correctly
- [ ] Extension listing shows data
- [ ] Filtering/sorting works
- [ ] Recommendations display properly
- [ ] AJAX endpoints return correct data
- [ ] Uninstallation cleans up properly
- [ ] No PHP errors in error log
- [ ] No JavaScript console errors
- [ ] Cross-browser compatibility
- [ ] Responsive design works

### Test Data

Use the sample_data.sql for consistent testing:

```bash
mysql -u user -p database < install/sample_data.sql
```

## Areas for Contribution

### High Priority

- [ ] Advanced search and filtering
- [ ] Integration with OpenCart marketplace API
- [ ] Extension conflict detection
- [ ] Performance optimizations
- [ ] Unit tests
- [ ] Additional language translations

### Medium Priority

- [ ] Enhanced UI/UX
- [ ] Export/import functionality
- [ ] Extension comparison tool
- [ ] User ratings system
- [ ] Documentation improvements

### Low Priority

- [ ] Advanced analytics
- [ ] Email notifications
- [ ] Mobile app integration
- [ ] REST API
- [ ] GraphQL interface

## Getting Help

- **Documentation:** Check README.md, INSTALL.md, and ARCHITECTURE.md
- **Issues:** Search existing GitHub issues
- **Discussions:** Use GitHub Discussions for questions
- **Email:** Contact maintainers for sensitive issues

## Recognition

Contributors will be:
- Listed in CHANGELOG.md
- Acknowledged in release notes
- Added to CONTRIBUTORS.md (if created)

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to OpenCart Extension Mapper & Recommender!
