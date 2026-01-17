# OpenCart Extension Mapper & Recommender

An intelligent OpenCart extension that helps you discover, organize, and select the right extensions for your e-commerce store. This module provides a comprehensive system for listing extensions by functionality, mapping their capabilities, and recommending optimal combinations for specific use cases.

## 🌟 Features

### 1. **Extension Listing & Organization**
- Browse extensions organized by categories (Payment Gateways, Shipping, Marketing, etc.)
- View detailed extension information including ratings, downloads, and pricing
- Filter and search extensions based on your needs

### 2. **Functionality Mapping**
- Map extensions to specific functionalities (Payment Processing, SEO, Email Marketing, etc.)
- Discover which extensions provide the features you need
- Find alternative extensions with similar capabilities

### 3. **Use Case Recommendations**
- Get tailored extension recommendations for common business scenarios:
  - Basic Online Store
  - Fashion & Apparel Store
  - Digital Downloads Store
  - Multi-vendor Marketplace
  - B2B Wholesale
  - Dropshipping Business
  - Subscription Service
  - International Store
- Smart combination recommendations to avoid conflicts
- Priority-based suggestions for essential vs. optional extensions

## 📋 Requirements

- OpenCart 3.x or 4.x
- PHP 7.2 or higher
- MySQL 5.6 or higher

## 🚀 Installation

### Method 1: Manual Installation

1. **Download and Extract**
   ```bash
   git clone https://github.com/orgitcog/ocmarkext.git
   cd ocmarkext
   ```

2. **Upload Files**
   - Upload all files from the `upload` directory to your OpenCart root directory
   - Ensure file permissions are set correctly (typically 644 for files, 755 for directories)

3. **Install via Admin Panel**
   - Log in to your OpenCart admin panel
   - Navigate to `Extensions` → `Extensions`
   - Select `Modules` from the extension type dropdown
   - Find "Extension Mapper & Recommender" in the list
   - Click the green `Install` button (this will automatically create database tables)
   - After installation, click the `Edit` button to configure

**Note:** The module will automatically create all database tables using your OpenCart database prefix. If you need to manually import SQL files, replace `oc_` with your actual database prefix in the SQL files.

### Method 2: Database Installation (Optional)

If you prefer to set up the database tables manually:

```bash
mysql -u your_username -p your_database < install/install.sql
```

**Note:** Replace the `oc_` prefix in the SQL file if your OpenCart installation uses a different database prefix.

## ⚙️ Configuration

1. Navigate to `Extensions` → `Extensions` → `Modules` → "Extension Mapper & Recommender"
2. Set the module status to "Enabled"
3. Click "Save" to apply changes

## 📖 Usage

### Adding Extensions to the Database

The module comes with pre-populated categories, functionalities, and use cases. To add specific extensions:

1. Navigate to the Extension Mapper module in your admin panel
2. Go to the "Extensions" tab
3. Click "Add Extension"
4. Fill in the extension details:
   - Name
   - Category
   - Description
   - Version
   - Author
   - Marketplace URL
   - Price
   - Rating
   - Downloads
5. Select applicable functionalities
6. Save the extension

### Viewing Functionality Mappings

1. Go to the "Functionality Mapping" tab
2. Browse extensions organized by their core functionalities
3. See which extensions provide specific features

### Getting Recommendations

1. Navigate to the "Recommendations" tab
2. Browse pre-defined use cases
3. View recommended extension combinations for each scenario
4. Each recommendation includes:
   - Essential extensions (payment, shipping, etc.)
   - Optional enhancements (SEO, marketing, etc.)
   - Compatibility considerations

## 🗂️ Database Structure

The module creates the following database tables:

- `ext_mapper_extensions` - Stores extension information
- `ext_mapper_categories` - Extension categories
- `ext_mapper_functionalities` - Available functionalities
- `ext_mapper_extension_functionality` - Maps extensions to functionalities
- `ext_mapper_use_cases` - Business use case scenarios
- `ext_mapper_recommendations` - Recommended extensions for each use case

## 📊 Pre-Populated Data

### Categories (10)
- Payment Gateways
- Shipping Methods
- Marketing & SEO
- Social Media
- Reporting & Analytics
- Product Management
- Customer Management
- Design & Layout
- Security
- Performance

### Functionalities (15)
- Payment Processing
- Inventory Management
- Email Marketing
- SEO Optimization
- Social Sharing
- Advanced Search
- Multi-currency
- Multi-language
- Customer Reviews
- Wishlist
- Live Chat
- Abandoned Cart Recovery
- Product Comparison
- One-Page Checkout
- Mobile Responsive

### Use Cases (8)
- Basic Online Store
- Fashion & Apparel Store
- Digital Downloads Store
- Marketplace
- B2B Wholesale
- Dropshipping Business
- Subscription Service
- International Store

## 🔧 API Endpoints

The module provides several AJAX endpoints for dynamic functionality:

- `getRecommendations` - Get recommendations for a specific use case
- `addExtension` - Add a new extension to the database

## 🛠️ Development

### File Structure
```
ocmarkext/
├── upload/
│   ├── admin/
│   │   ├── controller/extension/module/ext_mapper.php
│   │   ├── model/extension/module/ext_mapper.php
│   │   ├── language/en-gb/extension/module/ext_mapper.php
│   │   └── view/template/extension/module/ext_mapper.tpl
│   └── catalog/
│       └── controller/extension/module/
├── install/
│   ├── install.sql
│   └── uninstall.sql
└── README.md
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Related Links

- [OpenCart Official Website](https://www.opencart.com)
- [OpenCart Extension Marketplace](https://www.opencart.com/index.php?route=marketplace/extension)
- [OpenCart Documentation](https://docs.opencart.com)

## 💡 Use Case Examples

### Example: Setting Up a Fashion Store

1. Navigate to "Recommendations" tab
2. Select "Fashion & Apparel Store"
3. Review recommended extensions:
   - **Payment**: PayPal, Stripe (essential)
   - **Shipping**: Real-time shipping rates (essential)
   - **Product Display**: Advanced image galleries (recommended)
   - **Social**: Instagram integration (recommended)
   - **SEO**: Product schema markup (recommended)

### Example: Building an International Store

1. Select "International Store" use case
2. Get recommendations for:
   - Multi-currency payment gateways
   - Multi-language support
   - International shipping integrations
   - Currency converters
   - Regional tax calculators

## 🐛 Troubleshooting

### Module doesn't appear in Extensions list
- Clear OpenCart cache (System → Settings → Clear cache)
- Verify file permissions
- Check error logs in `system/storage/logs/`

### Database errors during installation
- Verify database credentials
- Check if tables already exist
- Ensure proper database permissions

### Blank page after installation
- Enable PHP error reporting to identify issues
- Check file paths match your OpenCart version
- Verify all required files are uploaded

## 📧 Support

For issues, questions, or suggestions, please open an issue on GitHub or contact the development team.

---

**Version:** 1.0.0  
**Author:** orgitcog  
**Last Updated:** December 2024