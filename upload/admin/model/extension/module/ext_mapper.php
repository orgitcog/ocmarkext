<?php
/**
 * Extension Mapper Model
 * 
 * Handles database operations for extension mapping and recommendations
 */
class ModelExtensionModuleExtMapper extends Model {
    
    public function install() {
        // Create extensions table
        $this->db->query("
            CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "ext_mapper_extensions` (
                `extension_id` int(11) NOT NULL AUTO_INCREMENT,
                `name` varchar(255) NOT NULL,
                `description` text,
                `category_id` int(11) NOT NULL,
                `version` varchar(50),
                `author` varchar(255),
                `marketplace_url` varchar(500),
                `price` decimal(10,2),
                `rating` decimal(3,2),
                `downloads` int(11) DEFAULT 0,
                `date_added` datetime NOT NULL,
                `status` tinyint(1) NOT NULL DEFAULT 1,
                PRIMARY KEY (`extension_id`),
                KEY `category_id` (`category_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ");
        
        // Create categories table
        $this->db->query("
            CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "ext_mapper_categories` (
                `category_id` int(11) NOT NULL AUTO_INCREMENT,
                `name` varchar(255) NOT NULL,
                `description` text,
                `icon` varchar(255),
                `sort_order` int(3) NOT NULL DEFAULT 0,
                PRIMARY KEY (`category_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ");
        
        // Create functionalities table
        $this->db->query("
            CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "ext_mapper_functionalities` (
                `functionality_id` int(11) NOT NULL AUTO_INCREMENT,
                `name` varchar(255) NOT NULL,
                `description` text,
                PRIMARY KEY (`functionality_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ");
        
        // Create extension-functionality mapping table
        $this->db->query("
            CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "ext_mapper_extension_functionality` (
                `extension_id` int(11) NOT NULL,
                `functionality_id` int(11) NOT NULL,
                PRIMARY KEY (`extension_id`, `functionality_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ");
        
        // Create use cases table
        $this->db->query("
            CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "ext_mapper_use_cases` (
                `use_case_id` int(11) NOT NULL AUTO_INCREMENT,
                `name` varchar(255) NOT NULL,
                `description` text,
                `icon` varchar(255),
                PRIMARY KEY (`use_case_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ");
        
        // Create use case recommendations table
        $this->db->query("
            CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "ext_mapper_recommendations` (
                `recommendation_id` int(11) NOT NULL AUTO_INCREMENT,
                `use_case_id` int(11) NOT NULL,
                `extension_id` int(11) NOT NULL,
                `priority` int(3) NOT NULL DEFAULT 0,
                `reason` text,
                PRIMARY KEY (`recommendation_id`),
                KEY `use_case_id` (`use_case_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ");
        
        // Insert default categories
        $this->db->query("
            INSERT INTO `" . DB_PREFIX . "ext_mapper_categories` 
            (`name`, `description`, `icon`, `sort_order`) VALUES
            ('Payment Gateways', 'Payment processing and gateway integrations', 'fa-credit-card', 1),
            ('Shipping Methods', 'Shipping carriers and delivery options', 'fa-truck', 2),
            ('Marketing & SEO', 'Marketing tools and search engine optimization', 'fa-bullhorn', 3),
            ('Social Media', 'Social media integrations and sharing', 'fa-share-alt', 4),
            ('Reporting & Analytics', 'Reports, statistics, and analytics tools', 'fa-chart-line', 5),
            ('Product Management', 'Product display, filters, and management', 'fa-boxes', 6),
            ('Customer Management', 'Customer accounts and communication', 'fa-users', 7),
            ('Design & Layout', 'Themes, templates, and visual customization', 'fa-paint-brush', 8),
            ('Security', 'Security enhancements and fraud prevention', 'fa-shield-alt', 9),
            ('Performance', 'Speed optimization and caching', 'fa-tachometer-alt', 10)
        ");
        
        // Insert default functionalities
        $this->db->query("
            INSERT INTO `" . DB_PREFIX . "ext_mapper_functionalities` 
            (`name`, `description`) VALUES
            ('Payment Processing', 'Process online payments'),
            ('Inventory Management', 'Track and manage product inventory'),
            ('Email Marketing', 'Send marketing emails to customers'),
            ('SEO Optimization', 'Improve search engine rankings'),
            ('Social Sharing', 'Share products on social media'),
            ('Advanced Search', 'Enhanced product search capabilities'),
            ('Multi-currency', 'Support multiple currencies'),
            ('Multi-language', 'Support multiple languages'),
            ('Customer Reviews', 'Collect and display customer reviews'),
            ('Wishlist', 'Allow customers to save favorite products'),
            ('Live Chat', 'Real-time customer support chat'),
            ('Abandoned Cart Recovery', 'Recover abandoned shopping carts'),
            ('Product Comparison', 'Compare multiple products'),
            ('One-Page Checkout', 'Simplified checkout process'),
            ('Mobile Responsive', 'Optimized for mobile devices')
        ");
        
        // Insert default use cases
        $this->db->query("
            INSERT INTO `" . DB_PREFIX . "ext_mapper_use_cases` 
            (`name`, `description`, `icon`) VALUES
            ('Basic Online Store', 'Simple store with essential e-commerce features', 'fa-store'),
            ('Fashion & Apparel Store', 'Clothing and fashion retail with visual focus', 'fa-tshirt'),
            ('Digital Downloads Store', 'Sell digital products and downloads', 'fa-download'),
            ('Marketplace', 'Multi-vendor marketplace platform', 'fa-shopping-bag'),
            ('B2B Wholesale', 'Business-to-business wholesale operations', 'fa-industry'),
            ('Dropshipping Business', 'Dropshipping e-commerce model', 'fa-shipping-fast'),
            ('Subscription Service', 'Recurring subscription-based products', 'fa-sync'),
            ('International Store', 'Multi-currency, multi-language store', 'fa-globe')
        ");
    }
    
    public function uninstall() {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "ext_mapper_recommendations`");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "ext_mapper_use_cases`");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "ext_mapper_extension_functionality`");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "ext_mapper_functionalities`");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "ext_mapper_categories`");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "ext_mapper_extensions`");
    }
    
    public function getExtensions($data = array()) {
        $sql = "SELECT e.*, c.name as category_name 
                FROM `" . DB_PREFIX . "ext_mapper_extensions` e 
                LEFT JOIN `" . DB_PREFIX . "ext_mapper_categories` c ON (e.category_id = c.category_id)
                WHERE e.status = 1";
        
        if (!empty($data['category_id'])) {
            $sql .= " AND e.category_id = '" . (int)$data['category_id'] . "'";
        }
        
        if (!empty($data['search'])) {
            $sql .= " AND (e.name LIKE '%" . $this->db->escape($data['search']) . "%' 
                      OR e.description LIKE '%" . $this->db->escape($data['search']) . "%')";
        }
        
        $sql .= " ORDER BY e.downloads DESC, e.rating DESC";
        
        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }
            
            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }
            
            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }
        
        $query = $this->db->query($sql);
        
        return $query->rows;
    }
    
    public function getExtension($extension_id) {
        $query = $this->db->query("
            SELECT e.*, c.name as category_name 
            FROM `" . DB_PREFIX . "ext_mapper_extensions` e 
            LEFT JOIN `" . DB_PREFIX . "ext_mapper_categories` c ON (e.category_id = c.category_id)
            WHERE e.extension_id = '" . (int)$extension_id . "'
        ");
        
        return $query->row;
    }
    
    public function addExtension($data) {
        // Validate required fields
        if (empty($data['name']) || empty($data['category_id'])) {
            return false;
        }
        
        $this->db->query("
            INSERT INTO `" . DB_PREFIX . "ext_mapper_extensions` 
            SET name = '" . $this->db->escape($data['name']) . "',
                description = '" . $this->db->escape(isset($data['description']) ? $data['description'] : '') . "',
                category_id = '" . (int)$data['category_id'] . "',
                version = '" . $this->db->escape(isset($data['version']) ? $data['version'] : '') . "',
                author = '" . $this->db->escape(isset($data['author']) ? $data['author'] : '') . "',
                marketplace_url = '" . $this->db->escape(isset($data['marketplace_url']) ? $data['marketplace_url'] : '') . "',
                price = '" . (float)(isset($data['price']) ? $data['price'] : 0) . "',
                rating = '" . (float)(isset($data['rating']) ? $data['rating'] : 0) . "',
                downloads = '" . (int)(isset($data['downloads']) ? $data['downloads'] : 0) . "',
                date_added = NOW(),
                status = 1
        ");
        
        $extension_id = $this->db->getLastId();
        
        // Add functionalities if provided
        if (!empty($data['functionalities']) && is_array($data['functionalities'])) {
            foreach ($data['functionalities'] as $functionality_id) {
                $this->db->query("
                    INSERT INTO `" . DB_PREFIX . "ext_mapper_extension_functionality` 
                    SET extension_id = '" . (int)$extension_id . "',
                        functionality_id = '" . (int)$functionality_id . "'
                ");
            }
        }
        
        return $extension_id;
    }
    
    public function getCategories() {
        $query = $this->db->query("
            SELECT * FROM `" . DB_PREFIX . "ext_mapper_categories` 
            ORDER BY sort_order ASC
        ");
        
        return $query->rows;
    }
    
    public function getFunctionalities() {
        $query = $this->db->query("
            SELECT * FROM `" . DB_PREFIX . "ext_mapper_functionalities` 
            ORDER BY name ASC
        ");
        
        return $query->rows;
    }
    
    public function getExtensionFunctionalities($extension_id) {
        $query = $this->db->query("
            SELECT f.* 
            FROM `" . DB_PREFIX . "ext_mapper_functionalities` f
            INNER JOIN `" . DB_PREFIX . "ext_mapper_extension_functionality` ef 
                ON (f.functionality_id = ef.functionality_id)
            WHERE ef.extension_id = '" . (int)$extension_id . "'
            ORDER BY f.name ASC
        ");
        
        return $query->rows;
    }
    
    public function getUseCases() {
        $query = $this->db->query("
            SELECT * FROM `" . DB_PREFIX . "ext_mapper_use_cases` 
            ORDER BY name ASC
        ");
        
        return $query->rows;
    }
    
    public function getRecommendations($use_case_id) {
        $query = $this->db->query("
            SELECT e.*, r.reason, r.priority, c.name as category_name
            FROM `" . DB_PREFIX . "ext_mapper_recommendations` r
            INNER JOIN `" . DB_PREFIX . "ext_mapper_extensions` e 
                ON (r.extension_id = e.extension_id)
            LEFT JOIN `" . DB_PREFIX . "ext_mapper_categories` c 
                ON (e.category_id = c.category_id)
            WHERE r.use_case_id = '" . (int)$use_case_id . "'
                AND e.status = 1
            ORDER BY r.priority DESC, e.rating DESC
        ");
        
        return $query->rows;
    }
    
    public function getExtensionsByFunctionality($functionality_id) {
        $query = $this->db->query("
            SELECT e.*, c.name as category_name
            FROM `" . DB_PREFIX . "ext_mapper_extensions` e
            INNER JOIN `" . DB_PREFIX . "ext_mapper_extension_functionality` ef 
                ON (e.extension_id = ef.extension_id)
            LEFT JOIN `" . DB_PREFIX . "ext_mapper_categories` c 
                ON (e.category_id = c.category_id)
            WHERE ef.functionality_id = '" . (int)$functionality_id . "'
                AND e.status = 1
            ORDER BY e.rating DESC, e.downloads DESC
        ");
        
        return $query->rows;
    }
}
