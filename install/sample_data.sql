-- Sample Extension Data
-- This file contains example extension data that can be imported for demonstration purposes

-- Sample Payment Gateway Extensions
INSERT INTO `oc_ext_mapper_extensions` 
(`name`, `description`, `category_id`, `version`, `author`, `marketplace_url`, `price`, `rating`, `downloads`, `date_added`, `status`) 
VALUES
('PayPal Express Checkout', 'Accept payments via PayPal with express checkout functionality', 1, '3.0', 'PayPal', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=1', 0.00, 4.50, 150000, NOW(), 1),
('Stripe Payment Gateway', 'Secure payment processing with Stripe', 1, '2.5', 'Stripe Inc.', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=2', 29.99, 4.80, 85000, NOW(), 1),
('Square Payment', 'Accept credit card payments through Square', 1, '1.8', 'Square', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=3', 19.99, 4.60, 45000, NOW(), 1);

-- Sample Shipping Extensions
INSERT INTO `oc_ext_mapper_extensions` 
(`name`, `description`, `category_id`, `version`, `author`, `marketplace_url`, `price`, `rating`, `downloads`, `date_added`, `status`) 
VALUES
('USPS Shipping', 'Real-time USPS shipping rates', 2, '2.0', 'USPS', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=4', 0.00, 4.20, 65000, NOW(), 1),
('FedEx Shipping', 'FedEx real-time shipping calculations', 2, '3.2', 'FedEx', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=5', 39.99, 4.40, 42000, NOW(), 1),
('UPS Shipping', 'UPS shipping rate calculator', 2, '2.8', 'UPS', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=6', 35.00, 4.30, 38000, NOW(), 1);

-- Sample Marketing & SEO Extensions
INSERT INTO `oc_ext_mapper_extensions` 
(`name`, `description`, `category_id`, `version`, `author`, `marketplace_url`, `price`, `rating`, `downloads`, `date_added`, `status`) 
VALUES
('SEO URL Pro', 'Advanced SEO-friendly URL generator with metadata optimization', 3, '4.0', 'SEO Masters', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=7', 49.99, 4.70, 72000, NOW(), 1),
('Newsletter Subscription', 'Email newsletter subscription and campaign management', 3, '1.5', 'Marketing Tools', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=8', 24.99, 4.40, 55000, NOW(), 1),
('Abandoned Cart Recovery', 'Recover lost sales with automated cart recovery emails', 3, '2.3', 'Cart Recovery Pro', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=9', 59.99, 4.90, 38000, NOW(), 1);

-- Sample Social Media Extensions
INSERT INTO `oc_ext_mapper_extensions` 
(`name`, `description`, `category_id`, `version`, `author`, `marketplace_url`, `price`, `rating`, `downloads`, `date_added`, `status`) 
VALUES
('Social Login', 'Login with Facebook, Google, Twitter, and more', 4, '3.1', 'Social Connect', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=10', 34.99, 4.60, 68000, NOW(), 1),
('Social Share Buttons', 'Add social sharing buttons to products and pages', 4, '1.2', 'Share Tools', 'https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=11', 14.99, 4.30, 52000, NOW(), 1);

-- Map extensions to functionalities
-- PayPal: Payment Processing, Multi-currency
INSERT INTO `oc_ext_mapper_extension_functionality` (`extension_id`, `functionality_id`) VALUES
(1, 1), (1, 7);

-- Stripe: Payment Processing, Multi-currency, Mobile Responsive
INSERT INTO `oc_ext_mapper_extension_functionality` (`extension_id`, `functionality_id`) VALUES
(2, 1), (2, 7), (2, 15);

-- Square: Payment Processing
INSERT INTO `oc_ext_mapper_extension_functionality` (`extension_id`, `functionality_id`) VALUES
(3, 1);

-- SEO URL Pro: SEO Optimization
INSERT INTO `oc_ext_mapper_extension_functionality` (`extension_id`, `functionality_id`) VALUES
(7, 4);

-- Newsletter: Email Marketing
INSERT INTO `oc_ext_mapper_extension_functionality` (`extension_id`, `functionality_id`) VALUES
(8, 3);

-- Abandoned Cart: Email Marketing
INSERT INTO `oc_ext_mapper_extension_functionality` (`extension_id`, `functionality_id`) VALUES
(9, 3), (9, 12);

-- Social Login: Social Sharing
INSERT INTO `oc_ext_mapper_extension_functionality` (`extension_id`, `functionality_id`) VALUES
(10, 5);

-- Social Share: Social Sharing
INSERT INTO `oc_ext_mapper_extension_functionality` (`extension_id`, `functionality_id`) VALUES
(11, 5);

-- Recommendations for Basic Online Store (use_case_id = 1)
INSERT INTO `oc_ext_mapper_recommendations` (`use_case_id`, `extension_id`, `priority`, `reason`) VALUES
(1, 1, 10, 'Essential for accepting online payments. PayPal is widely trusted by customers.'),
(1, 4, 8, 'Provides accurate shipping rates for US-based stores.'),
(1, 7, 6, 'Improves search engine visibility and organic traffic.'),
(1, 11, 4, 'Enables customers to share products on social media.');

-- Recommendations for Fashion & Apparel Store (use_case_id = 2)
INSERT INTO `oc_ext_mapper_recommendations` (`use_case_id`, `extension_id`, `priority`, `reason`) VALUES
(2, 2, 10, 'Modern payment solution perfect for fashion retail.'),
(2, 5, 8, 'Professional shipping for fashion brands.'),
(2, 10, 9, 'Social login is essential for fashion-conscious customers.'),
(2, 7, 7, 'SEO helps attract fashion shoppers searching online.');

-- Recommendations for International Store (use_case_id = 8)
INSERT INTO `oc_ext_mapper_recommendations` (`use_case_id`, `extension_id`, `priority`, `reason`) VALUES
(8, 2, 10, 'Stripe supports multiple currencies and international payments.'),
(8, 1, 9, 'PayPal is available in most countries worldwide.'),
(8, 6, 8, 'UPS provides international shipping solutions.');
