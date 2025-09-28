USE team3;

-- Ngôn ngữ
INSERT INTO Language(LanguageID, Language) VALUES
  ('vi','Tiếng Việt'),
  ('en','English')
ON DUPLICATE KEY UPDATE Language = VALUES(Language);

-- Danh mục
INSERT INTO ProductCategory (CanBeShipped) VALUES (b'1'),(b'1'),(b'1'),(b'0');

INSERT INTO ProductCategoryTranslation(ProductCategoryID, LanguageID, CategoryName) VALUES
(1,'vi','Điện thoại'), (1,'en','Phones'),
(2,'vi','Phụ kiện'),  (2,'en','Accessories'),
(3,'vi','Laptop'),    (3,'en','Laptops'),
(4,'vi','Phần mềm'),  (4,'en','Software')
ON DUPLICATE KEY UPDATE CategoryName=VALUES(CategoryName);

-- Sản phẩm (mỗi danh mục 3 sp)
INSERT INTO Product (Price,Weight,ProductCategoryID) VALUES
-- Điện thoại (cat=1)
(12000000, 180.0, 1),  -- ID 1
(15000000, 200.0, 1),  -- ID 2
(10000000, 170.0, 1),  -- ID 3

-- Phụ kiện (cat=2)
(250000,    20.0, 2),  -- ID 4
(500000,    15.0, 2),  -- ID 5
(350000,    25.0, 2),  -- ID 6

-- Laptop (cat=3)
(18000000, 2200.0, 3), -- ID 7
(22000000, 2000.0, 3), -- ID 8
(20000000, 2100.0, 3), -- ID 9

-- Phần mềm (cat=4, weight=0)
(2000000,     0.0, 4), -- ID 10
(1500000,     0.0, 4), -- ID 11
(3000000,     0.0, 4); -- ID 12

-- Dịch sản phẩm
INSERT INTO ProductTranslation(ProductID, LanguageID, ProductName, ProductDescription) VALUES
-- Điện thoại
(1,'vi','Điện thoại A1','Màn hình 6.1"'), (1,'en','Phone A1','6.1" display'),
(2,'vi','Điện thoại X2','Pin 5000mAh, camera kép'), (2,'en','Phone X2','5000mAh battery, dual camera'),
(3,'vi','Điện thoại Y3','Chip 8 nhân, RAM 8GB'), (3,'en','Phone Y3','Octa-core chip, 8GB RAM'),

-- Phụ kiện
(4,'vi','Tai nghe B2','Bluetooth 5.0'), (4,'en','Headset B2','Bluetooth 5.0'),
(5,'vi','Sạc nhanh C3','Hỗ trợ sạc 65W'), (5,'en','Fast Charger C3','Supports 65W charging'),
(6,'vi','Chuột D4','Chuột không dây 2.4GHz'), (6,'en','Mouse D4','Wireless mouse 2.4GHz'),

-- Laptop
(7,'vi','Laptop L5','Core i5, 16GB RAM, SSD 512GB'), (7,'en','Laptop L5','Core i5, 16GB RAM, 512GB SSD'),
(8,'vi','Laptop Pro 14','Core i7, màn hình 14" Retina'), (8,'en','Laptop Pro 14','Core i7, 14" Retina display'),
(9,'vi','Laptop Gamer Z','RTX 4060, màn 15.6" 144Hz'), (9,'en','Gaming Laptop Z','RTX 4060, 15.6" 144Hz display'),

-- Phần mềm
(10,'vi','Phần mềm kế toán EBiz','Quản lý tài chính cho SME'), (10,'en','Accounting Software EBiz','Finance management for SMEs'),
(11,'vi','Phần mềm CRM Pro','Quản lý khách hàng'), (11,'en','CRM Software Pro','Customer management'),
(12,'vi','Phần mềm HRM','Quản lý nhân sự'), (12,'en','HRM Software','Human Resource Management')
ON DUPLICATE KEY UPDATE ProductName=VALUES(ProductName), ProductDescription=VALUES(ProductDescription);
