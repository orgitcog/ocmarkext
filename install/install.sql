-- Extension Mapper Installation SQL
-- This SQL creates the necessary database tables for the Extension Mapper module

-- Extensions table
CREATE TABLE IF NOT EXISTS `oc_ext_mapper_extensions` (
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

-- Categories table
CREATE TABLE IF NOT EXISTS `oc_ext_mapper_categories` (
    `category_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `description` text,
    `icon` varchar(255),
    `sort_order` int(3) NOT NULL DEFAULT 0,
    PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Functionalities table
CREATE TABLE IF NOT EXISTS `oc_ext_mapper_functionalities` (
    `functionality_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `description` text,
    PRIMARY KEY (`functionality_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Extension-Functionality mapping table
CREATE TABLE IF NOT EXISTS `oc_ext_mapper_extension_functionality` (
    `extension_id` int(11) NOT NULL,
    `functionality_id` int(11) NOT NULL,
    PRIMARY KEY (`extension_id`, `functionality_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Use cases table
CREATE TABLE IF NOT EXISTS `oc_ext_mapper_use_cases` (
    `use_case_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `description` text,
    `icon` varchar(255),
    PRIMARY KEY (`use_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Recommendations table
CREATE TABLE IF NOT EXISTS `oc_ext_mapper_recommendations` (
    `recommendation_id` int(11) NOT NULL AUTO_INCREMENT,
    `use_case_id` int(11) NOT NULL,
    `extension_id` int(11) NOT NULL,
    `priority` int(3) NOT NULL DEFAULT 0,
    `reason` text,
    PRIMARY KEY (`recommendation_id`),
    KEY `use_case_id` (`use_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Insert default categories
INSERT INTO `oc_ext_mapper_categories` 
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
('Performance', 'Speed optimization and caching', 'fa-tachometer-alt', 10);

-- Insert default functionalities
INSERT INTO `oc_ext_mapper_functionalities` 
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
('Mobile Responsive', 'Optimized for mobile devices');

-- Insert default use cases
INSERT INTO `oc_ext_mapper_use_cases` 
(`name`, `description`, `icon`) VALUES
('Basic Online Store', 'Simple store with essential e-commerce features', 'fa-store'),
('Fashion & Apparel Store', 'Clothing and fashion retail with visual focus', 'fa-tshirt'),
('Digital Downloads Store', 'Sell digital products and downloads', 'fa-download'),
('Marketplace', 'Multi-vendor marketplace platform', 'fa-shopping-bag'),
('B2B Wholesale', 'Business-to-business wholesale operations', 'fa-industry'),
('Dropshipping Business', 'Dropshipping e-commerce model', 'fa-shipping-fast'),
('Subscription Service', 'Recurring subscription-based products', 'fa-sync'),
('International Store', 'Multi-currency, multi-language store', 'fa-globe');
