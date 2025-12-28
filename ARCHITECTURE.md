# Architecture Documentation

## Overview

The Extension Mapper & Recommender is built following OpenCart's MVC (Model-View-Controller) architecture pattern. It provides a comprehensive system for organizing, mapping, and recommending OpenCart extensions.

## System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        Admin Interface                       │
│  ┌────────────┬──────────────┬──────────────┬─────────────┐ │
│  │  General   │  Extensions  │   Mapping    │Recommendations│ │
│  │   Tab      │     Tab      │     Tab      │     Tab       │ │
│  └────────────┴──────────────┴──────────────┴─────────────┘ │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Controller Layer                          │
│  (admin/controller/extension/module/ext_mapper.php)         │
│                                                              │
│  • Request handling                                          │
│  • User authentication & authorization                       │
│  • Data validation                                           │
│  • View rendering                                            │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                      Model Layer                             │
│  (admin/model/extension/module/ext_mapper.php)              │
│                                                              │
│  • Database operations (CRUD)                                │
│  • Business logic                                            │
│  • Data retrieval & manipulation                             │
│  • Recommendation algorithm                                  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     Database Layer                           │
│                                                              │
│  ┌─────────────────┐  ┌──────────────────┐                │
│  │   Extensions    │  │   Categories     │                 │
│  │   (metadata)    │  │   (10 types)     │                 │
│  └─────────────────┘  └──────────────────┘                 │
│                                                              │
│  ┌─────────────────┐  ┌──────────────────┐                │
│  │Functionalities  │  │   Use Cases      │                 │
│  │  (15 types)     │  │   (8 scenarios)  │                 │
│  └─────────────────┘  └──────────────────┘                 │
│                                                              │
│  ┌─────────────────┐  ┌──────────────────┐                │
│  │ Ext-Func Map    │  │ Recommendations  │                 │
│  │ (many-to-many)  │  │  (prioritized)   │                 │
│  └─────────────────┘  └──────────────────┘                 │
└─────────────────────────────────────────────────────────────┘
```

## Component Details

### 1. Controller (ext_mapper.php)

**Responsibilities:**
- Handle HTTP requests from admin panel
- Authenticate and authorize users
- Validate input data
- Load appropriate models and views
- Return JSON responses for AJAX requests

**Key Methods:**
- `index()` - Main entry point, displays module interface
- `install()` - Creates database tables and populates initial data
- `uninstall()` - Removes database tables
- `getRecommendations()` - AJAX endpoint for recommendations
- `addExtension()` - AJAX endpoint to add new extensions
- `validate()` - Permission checking

### 2. Model (ext_mapper.php)

**Responsibilities:**
- Database CRUD operations
- Business logic for extension management
- Recommendation algorithm
- Data aggregation and filtering

**Key Methods:**
- `install()` - Database schema creation
- `uninstall()` - Database cleanup
- `getExtensions()` - Retrieve extensions with filters
- `getExtension()` - Get single extension details
- `addExtension()` - Insert new extension
- `getCategories()` - List all categories
- `getFunctionalities()` - List all functionalities
- `getUseCases()` - List all use cases
- `getRecommendations()` - Get recommendations for a use case
- `getExtensionsByFunctionality()` - Filter by functionality

### 3. View (ext_mapper.tpl)

**Responsibilities:**
- Render HTML interface
- Display extension listings
- Show category cards
- Present recommendations
- Handle user interactions

**Features:**
- Tab-based navigation
- Responsive grid layout
- Data tables with sorting
- Icon-based visual elements
- Bootstrap 3 styling

### 4. Language File (ext_mapper.php)

**Responsibilities:**
- Internationalization strings
- UI labels and messages
- Error messages
- Help text

## Database Schema

### Entity Relationship Diagram

```
┌──────────────────┐          ┌─────────────────────┐
│   Categories     │          │    Extensions       │
├──────────────────┤          ├─────────────────────┤
│ category_id (PK) │◄────────┤│ extension_id (PK)   │
│ name             │          ││ name                │
│ description      │          ││ description         │
│ icon             │          ││ category_id (FK)    │
│ sort_order       │          ││ version             │
└──────────────────┘          ││ author              │
                              ││ marketplace_url     │
                              ││ price               │
                              ││ rating              │
                              ││ downloads           │
                              ││ date_added          │
                              ││ status              │
                              │└─────────────────────┘
                              │         │
                              │         │
                              │         ▼
┌──────────────────┐          │  ┌──────────────────────────┐
│ Functionalities  │          │  │ Extension_Functionality  │
├──────────────────┤          │  ├──────────────────────────┤
│functionality_id  │◄─────────┼─┤│ extension_id (FK)        │
│    (PK)          │          │  ││ functionality_id (FK)    │
│ name             │          │  │└──────────────────────────┘
│ description      │          │           (Junction Table)
└──────────────────┘          │
                              │
                              │
┌──────────────────┐          │  ┌─────────────────────┐
│   Use Cases      │          │  │  Recommendations    │
├──────────────────┤          │  ├─────────────────────┤
│ use_case_id (PK) │◄─────────┼─┤│recommendation_id(PK)│
│ name             │          │  ││ use_case_id (FK)    │
│ description      │          └─►││ extension_id (FK)   │
│ icon             │             ││ priority            │
└──────────────────┘             ││ reason              │
                                 │└─────────────────────┘
```

### Table Descriptions

#### ext_mapper_extensions
Stores extension metadata including name, version, pricing, ratings, and category.

**Key Fields:**
- `extension_id` - Primary key
- `category_id` - Foreign key to categories
- `rating` - Decimal (0-5)
- `downloads` - Integer count
- `price` - Decimal (USD)
- `status` - Active/Inactive

#### ext_mapper_categories
Defines extension categories for organization.

**Pre-populated with:**
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

#### ext_mapper_functionalities
Defines available functionalities that extensions can provide.

**Examples:**
- Payment Processing
- SEO Optimization
- Email Marketing
- Multi-currency Support

#### ext_mapper_extension_functionality
Junction table for many-to-many relationship between extensions and functionalities.

#### ext_mapper_use_cases
Business scenarios for recommendation purposes.

**Examples:**
- Basic Online Store
- Fashion & Apparel Store
- B2B Wholesale
- International Store

#### ext_mapper_recommendations
Links use cases to recommended extensions with priority and reasoning.

**Key Fields:**
- `priority` - Higher values = more important
- `reason` - Explanation for recommendation

## Data Flow

### Extension Listing Flow

```
User Request → Controller → Model → Database
                  ↓
              View ← Data ← Results
```

1. User navigates to Extensions tab
2. Controller calls `model->getExtensions()`
3. Model queries database with filters
4. Results returned to controller
5. Controller passes data to view
6. View renders HTML table

### Recommendation Flow

```
User Selects Use Case → AJAX Request → Controller
                                          ↓
                                       Model
                                          ↓
                                    Query joins:
                                    - use_cases
                                    - recommendations
                                    - extensions
                                    - categories
                                          ↓
                                    JSON Response
                                          ↓
                                    Update UI
```

1. User selects a use case
2. AJAX request to `getRecommendations()`
3. Model performs complex JOIN query
4. Returns prioritized list of extensions
5. JSON response sent to browser
6. JavaScript updates interface

## Security Considerations

### Authentication & Authorization
- All admin actions require valid user session
- Permission checking via `$this->user->hasPermission()`
- User token validation for all requests

### Input Validation
- SQL injection prevention via `$this->db->escape()`
- Type casting for integers: `(int)$id`
- Decimal validation for prices and ratings

### Database Security
- Parameterized queries
- Proper use of OpenCart's DB abstraction
- No direct SQL from user input

## Performance Optimization

### Database
- Indexed foreign keys (category_id, use_case_id)
- Efficient JOIN queries
- MyISAM engine for read-heavy operations

### Caching Opportunities (Future)
- Category list (rarely changes)
- Functionality list (static data)
- Use case definitions (static data)
- Popular recommendations

### Query Optimization
- Selective field retrieval
- LIMIT clauses for pagination
- Indexed WHERE conditions

## Extension Points

### Adding New Categories
```sql
INSERT INTO oc_ext_mapper_categories 
(name, description, icon, sort_order) 
VALUES ('New Category', 'Description', 'fa-icon', 11);
```

### Adding New Functionalities
```sql
INSERT INTO oc_ext_mapper_functionalities 
(name, description) 
VALUES ('New Functionality', 'Description');
```

### Adding New Use Cases
```sql
INSERT INTO oc_ext_mapper_use_cases 
(name, description, icon) 
VALUES ('New Use Case', 'Description', 'fa-icon');
```

## Integration Points

### OpenCart Marketplace API (Future)
- Fetch real-time extension data
- Update ratings and download counts
- Sync extension information

### Third-Party Services (Future)
- Extension review aggregation
- Compatibility checking services
- Update notification services

## Scalability Considerations

### Current Capacity
- Designed for thousands of extensions
- Efficient queries with proper indexing
- Minimal memory footprint

### Future Enhancements
- Pagination for large datasets
- Caching layer (Redis/Memcached)
- CDN for static assets
- Database query optimization
- API rate limiting

## Testing Strategy

### Unit Tests (Recommended)
- Model methods (CRUD operations)
- Validation functions
- Recommendation algorithm

### Integration Tests (Recommended)
- Database operations
- Controller-Model interaction
- AJAX endpoints

### Manual Testing
- UI functionality
- Cross-browser compatibility
- Responsive design
- Permission checking

## Deployment Checklist

- [ ] Verify PHP version (7.2+)
- [ ] Check MySQL version (5.6+)
- [ ] Test database permissions
- [ ] Verify file permissions
- [ ] Check OpenCart compatibility
- [ ] Test on staging environment
- [ ] Backup production database
- [ ] Deploy files
- [ ] Run installation
- [ ] Verify all features
- [ ] Monitor error logs

## Maintenance

### Regular Tasks
- Monitor database size
- Review error logs
- Update extension data
- Clean old recommendations
- Optimize database tables

### Update Procedure
1. Backup database and files
2. Upload new files
3. Run migration scripts
4. Test functionality
5. Clear cache
6. Monitor for issues

---

**Version:** 1.0.0  
**Last Updated:** December 2024  
**Maintained By:** orgitcog
