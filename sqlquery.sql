/* 
Materi Video :
00:00:00​ - Pendahuluan
00:01:41​ - Pengenalan Sistem Basis Data
00:12:05​ - Pengenalan SQL
00:20:28​ - Menginstall MySQL
00:37:07​ - Database
00:45:47​ - Tipe Data
00:49:10​ - Tipe Data Number
00:55:31​ - Tipe Data String
01:02:34​ - Tipe Data Date dan Time
01:05:50​ - Tipe Data Boolean
01:06:49​ - Tipe Data Lainnya
01:08:22​ - Table
01:33:08​ - Insert Data
01:41:40​ - Select Data
01:44:21​ - Primary key
01:50:38​ - Where Clause
01:54:14​ - Update Data
02:02:05​ - Delete Data
02:04:43​ - Alias
02:08:57​ - Where Operator
02:29:24​ - Order By Clause
02:33:10​ - Limit Clause
02:37:19​ - Select Distinct Data
02:39:24​ - Numeric Function
02:45:36​ - Auto Increment
02:52:34​ - String Function
02:55:29​ - Date dan Time Function
02:58:21​ - Flow Control Function
03:06:01​ - Aggregate Function
03:10:31​ - Grouping
03:16:45​ - Constraint
03:28:17​ - Index
03:42:15​ - Full-Text Search
03:54:05​ - Table Relationship
04:11:58​ - Join
04:23:19​ - One to One Relationship
04:31:42​ - One to Many Relationship
04:40:54​ - Many to Many Relationship
05:00:05​ - Jenis-Jenis Join
05:14:40​ - Subquery
05:20:20​ - Set Operator
05:34:22​ - Transaction
05:46:45​ - Locking
06:12:01​ - User Management
06:24:11​ - Backup Database
06:28:50​ - Restore Database

 */



/* melihat engines yang tersedia di database */
SHOW ENGINES;

/* melihat table yang tersedia di database */
SHOW TABLES;

/* membuat TABLE */
CREATE TABLE barang(
    id INT NOT NULL,
    nama VARCHAR(10) NOT NULL,
    harga INT NOT NULL DEFAULT 0,
    jumlah INT NOT NULL DEFAULT 0
)ENGINE = InnoDB;

/* melihat struktur table */
DESC /DESCRIBE  barang;

/* melihat struktur query / constraint */
SHOW CREATE TABLE barang;

/* menghapus field jumlah yang berada di table barang */
ALTER TABLE barang DROP COLUMN jumlah

/* mengubah field/kolom jumlah yang berada di table barang */
ALTER TABLE barang
MODIFY jumlah INT NOT NULL DEFAULT 0;


/* menghapus semua data yang berada di dalam table kemudian tabelnya dibuat ulang */
TRUNCATE barang;

/* menghapus table secara permanen */
DROP TABLE barang;




=======DATA MANIPULATION LANGUAGE (DML)=======

/* MEMBUAT TABLE. note: UNSIGNED artinya data tidak boleh bernilai minus (-1) */
CREATE TABLES products(
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL DEFAULT 0,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINES = InnoDB;

/* insert untuk memasukan data kedalam table. */
INSERT INTO products(id, name, description, price, quantity) VALUES 
('P0001', 'Mie Ayam Original', 'mie ayam original favorit', 15000, 100),
('P0002', 'Mie Ayam Baso', 'mie ayam Baso favorit', 20000, 90),
('P0003', 'Mie Ayam Pangsit', 'mie ayam pangsit favorit', 18000, 70),
('Q0001', 'Indomie goreng original', 'indomie goreng original', 3000, 7000),
('Q0002', 'Indomie Ayam Bawang', 'indomie ayam bawang', 2500, 8000),
('Q0003', 'Indomie soto ayam', 'indomie soto ayam', 2800, 10),
('R0001', 'Aqua botol 1500ml', 'Air mineral Aqua', 3000, 10000),
('R0002', 'Sanqua botol 1500ml', 'Air mineral Aqua', 2000, 6500),
('R0003', 'Le Mineral 1500ml', 'Air mineral Le mineral', 2900, 4500),
('S0001', 'Fanta 1500ml', 'Fanta', 5000, 5),
('S0002', 'Coca cola 1500ml', 'Coca cola', 3000, 2500),
('S0003', 'Sprite 1500ml', 'Sprite', 4000, 1876),
('T0001', 'Xiaomi Redmi Note 5A ', 'Android mobile phone', 1800000, 9570),
('T0002', 'Samsung Galaxy A5', 'Android mobile phone', 5000000, 3900),
('T0003', 'Iphone 6+', 'IOS mobile phone', 7000000, 2364);

/* mengambil/menampilan seluruh data pada table products */
SELECT * FROM products;

/* mengambil/menampilkan data pada table proucts sesuai field/kolom yang diinginkan */
SELECT name, price, quantity FROM products;


------------------------ PRIMARY KEY ------------------------
CREATE TABLES products(
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL DEFAULT 0,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)ENGINES = InnoDB;

/* cara set PRIMARY KEY jika table sudah dibuat */
ALTER TABLE products ADD PRIMARY KEY (id);

------------------------ WHERE CLAUSE ------------------------
/* where berguna untuk menampilkan data berdasarkan kriteria tertentu */
SELECT id, name, price, quantity FROM products WHERE quantity = 0;

------------------------ UPDATE DATA ------------------------

ALTER TABLE products ADD COLUMN category ENUM('Makanan', 'Minuman', 'Lain - Lain') AFTER name;

/* cara UPDATE data di field category pada table products  */
UPDATE products SET category = 'Makanan' WHERE id = 'P0001';

/* cara melakukan operasi aritmatika pada saat UPDATE */
UPDATE products SET price = price + 5000 WHERE id = 'P0001';

------------------------ DELETE DATA ------------------------
/* cara menghapus data pada sebuah table */
DELETE FROM products WHERE id = 'P0009';

------------------------------------------------ ALIAS ------------------------------------------------
/* cara menggunakan alias untuk mengganti nama field pada tampilan */
SELECT 
id AS 'Kode',
name AS 'Nama',
category AS 'Kategori',
price AS 'Harga',
quantity AS 'Stok'
FROM products;


-------------------------------------------- WHERE OPERATOR ---------------------------------------
=               -> sama dengan
<>,!=           -> tidak sama dengan
<               -> kurang dari
<=              -> kurang dari atau sama dengan
>               -> lebih dari
>=              -> lebih dari atau sama dengan
AND             ->
Or              ->
LIKE            -> mencari sebagian kata dalam string (mencari data yang mengandung keyword yg dicari). tidak disarankan menggunakan LIKE jika datanya sudah terlalu besar karena LIKE sangat lambat. incase sensitive.
NOT LIKE        -> kebalikan LIKE
IS NULL         -> mencari data NULL
IS NOT NULL     -> kebalian dari NULL
BETWEEN         -> untuk mencari data diantara kondisi tertentu
NOT BETWEEN     -> kebalian dari BETWEEN
IN              -> untuk melakukan pencarian didalam sebuah kolom dengan beberapa nilai

SELECT * FROM products WHERE quantity > 100;

SELECT * FROM products WHERE quantity >= 100;

SELECT * FROM products WHERE category != 'Makanan';
SELECT * FROM products WHERE category <> 'Makanan';

SELECT * FROM products WHERE quantity > 100 AND price > 20000;
SELECT * FROM products WHERE category = 'Makanan' AND price < 20000;

SELECT * FROM products WHERE quantity > 100 OR price > 20000;

/* AND lebih prioritas dari OR, maka dari itu apabila kita ingin memprioritaskan sesuatu maka kita gunakan () */
SELECT * FROM products WHERE (categoty = 'Makanan' OR quantity > 100) AND price > 20000;

/* mencari value dengan awalan m */
SELECT * FROM products WHERE name LIKE = 'M%';
/* mencari value akhiran awalan m */
SELECT * FROM products WHERE name LIKE = '%M';
/* mencari value yang menganung kata mie */
SELECT * FROM products WHERE name LIKE = '%Mie%';

SELECT * FROM products WHERE description IS NULL;
SELECT * FROM products WHERE description IS NOT NULL;

SELECT * FROM products WHERE price BETWEEN 10000 AND 20000;
SELECT * FROM products WHERE price NOT BETWEEN 10000 AND 20000;

SELECT * FROM products WHERE category IN ('Makanan','Minuman');
SELECT * FROM products WHERE category NOT IN ('Makanan','Minuman');

-------------------------------------------- ORDER BY CLAUSE ---------------------------------------
ORDER BY -> untuk mengurutkan data berdasarkan kolom. default-nya ASC

SELECT * FROM products ORDER BY category ASC;
SELECT * FROM products ORDER BY category ASC, price DESC;
SELECT * FROM products WHERE description NOT NULL ORDER BY category ASC, price DESC;

-------------------------------------------- LIMIT CLAUSE ---------------------------------------
LIMIT 2, 2-> untuk membatasi jumlah data yang akan ditampilkan. parameter pertama skip/offset data, parameter kedua limit datanya.

SELECT * FROM products ORDER BY category ASC LIMIT 5;
SELECT * FROM products ORDER BY category ASC LIMIT 0, 5;

SELECT * FROM products ORDER BY category ASC LIMIT 5, 5;

----------------------------------------- SELECT DISTINC DATA ---------------------------------------
DISTINC -> agar data yang duplikat ditampilkan satu saja

SELECT DISTINC category FROM products;

----------------------------------------- NUMERIC FUNCTION ---------------------------------------

ARITHMETIC OPERATOR
- %, MOD    -> Modulus
- *         -> perkalian
- +         -> penjumlahan
- -         -> pengurangan,minus value
- /         -> pembagian
- DIV       -> pembagian namun akan akan dibulatkan menjadi integer

/* kita bisa melakukan query tanpa table */
SELECT 10 + 10 AS hasil;

SELECT id, name, price, price DIV 1000 AS 'Price in K' FROM products;

MATHEMATICAL FUNCTION
/* info lebih lengkap liat docemtasinya */
- PI()
- POWER() -> untuk perpangkatan
- COS()
- SIN()
- TAN()

SELECT id, SIN(price), COS(price), TAN(price) FROM products;

SELECT id, name, price, price FROM products WHERE price DIV 1000 > 15;

----------------------------------------- AUTO INCREMENT ---------------------------------------
CREATE TABLE admin(
    id INT NOT NULL AUTO INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)

)ENGINES = InnoDB;

DESC admin;

INSERT INTO admin (first_name, last_name) VALUES ('Andi', 'Saputra');

/* untuk melihat id terahir yang di insert */
SELECT LAST_INSERT_ID();


----------------------------------------- STRING FUNCTION ---------------------------------------
/* info lebih lengkap liat docemtasinya di mysql.com*/

SELECT id, LOWER(name) AS 'Name Lower', UPPER(name) AS 'Name Upper', LENGTH(name) AS 'Name Length' FROM products;

----------------------------------------- DATE AND TIME FUNCTION ---------------------------------------
/* info lebih lengkap liat docemtasinya di mysql.com*/
SELECT id, created_at,
        EXTRACT(YEAR FROM created_at) AS year,
        EXTRACT(MONTH FROM created_at) AS month,
FROM products;

SELECT id, created_at, YEAR(created_at), MONTH(created_at) FROM products;

----------------------------------------- FLOW CONTROL FUNCTION ---------------------------------------
/* flow control sama seperti di bahasa pemrogramman namun tidak sekompleks bahsa pemrograman. info lebih lengkap liat docemtasinya di mysql.com*/
SELECT id, 
        CASE category
            WHEN 'Mankanan' THEN 'Enak'
            WHEN 'Minuman' THEN 'Segar'
            ELSE 'Apa itu?'
        END AS 'Category'
FROM products;

SELECT id, price,
        IF(price <= 15000, 'Murah', 'Mahal') AS 'Mahal?'
FROM products;


/* nested if */
SELECT id, price,
        IF(price <= 15000, 'Murah',
        IF(price >= 2000, 'Mahal', 'Mahal Banget')) AS 'Mahal?'
FROM products;

SELECT id, price, IF NULL(description, 'Kosong') FROM products;

----------------------------------------- AGGREGATE FUNCTION ---------------------------------------
/*untuk melakukan aggregate pada data. info lebih lengkap liat docemtasinya di mysql.com
- jika kita melakukan aggregate kita tidak bisa menggabungkan dengan select kolom biasa
*/

SELECT COUNT(id) AS 'Jumlah Produk' FROM products;
SELECT MAX(Price) AS 'Produk Termahal' FROM products;
SELECT MIN(Price) AS 'Produk Termurah' FROM products;
SELECT AVG(Price) AS 'Harga rata - rata' FROM products;
SELECT SUM(quantity) AS 'Total Stock' FROM products;

----------------------------------------- GROUP BY ---------------------------------------
/*untuk melakukan GROUPING pada data. info lebih lengkap liat docemtasinya di mysql.com
- KITA BISA MELAKUAN GROUPPING MENGGUNAKKAN AGGREGATE
*/

SELECT COUNT(id) AS 'Total Produk', category FROM products GROUP BY category;
SELECT MAX(Price) AS 'Produk Termahal', category FROM products GROUP BY category;
SELECT MIN(Price) AS 'Produk Termurah', category FROM products GROUP BY category;
SELECT AVG(Price) AS 'Harga rata - rata', category FROM products GROUP BY category;
SELECT SUM(quantity) AS 'Total Stock', category FROM products GROUP BY category;

----------------------------------------- Having clause ---------------------------------------
/* kita tidak bisa menggunakan hasil where untuk memfilter hasil aggregate FUNCTION, maka dari itu kita menggunakan HAAVING UNTUK memfilter HASIL AGGREGATE FUNCTION */

SELECT COUNT(id) AS total, category FROM products GROUP BY category HAVING total > 5;

----------------------------------------- Constraint ---------------------------------------

* UNIQUE Constraint -> Menolak ata yang duplikat
CREATE TABLE customers(
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email)
)ENGINE = InnoDB;

/*cara menambah constraint */
ALTER TABLE customers ADD CONSTRAINT email_unique UNIQUE (email);

/* cara menghapus constraint */
ALTER TABLE customers DROP CONSTRAINT email_unique;

* CHECK Constraint -> mengecek data sebelum dimasukan ke database. misal harga barang harus diatas 1000
CREATE TABLES products(
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL DEFAULT 0,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT price_check CHECK (price >= 1000)
)ENGINES = InnoDB;

/*cara menambah constraint */
ALTER TABLE products ADD CONSTRAINT price_check CHECK (price >= 1000);

/* cara menghapus constraint */
ALTER TABLE products DROP CONSTRAINT price_check;

----------------------------------------- Index ---------------------------------------
/* secara default mysql akan mencari data dari baris pertama sampai terakhir
    namun dengan kita membuat index mysql akan menyimpan data dalam struktur data B-Tree(balancing tree) maksudnya data kan dalam disimpan dalam bentuk tree namun bukan perbaris melainkan perkolom. jadi ini akan mempermudah kita dalam pencarian dan pengurutan data
    detail lihat di documentasinya https://dev.mysql.com//doc/refman/8.0/en/optimization-indexes.html. efek membuat index di kolom adalah query menjadi cepat namun memperlambat proses manipulasi data karena mysql akan melakukan proses update tiap kali kita melakukan tambah, ubah, hapus data ditable.di mysql primary key dan unique constraint akan secara otomatis ditambahkan
 */

CREATE TABLE sellers{
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY email_unique (email),
    INDEX name_index (name)

}ENGINE = InnoDB;

----------------------------------------- Full Text Search ---------------------------------------
/* Full Text Search adalah index spesial utnuk melakukan pencarian teks (mencari sebagian kata disebagian kolom).
sangat cocok ketika kita memang membutuhkan pencarian yang tidak hanya sekedar operasi = (equals, sama dengan). detailnya baca documentasi di dev.mysql.com/fulltextsearch */

CREATE TABLE sellers{
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY email_unique (email),
    FULLTEXT seller_search (name)

}ENGINE = InnoDB;


ALTER TABLE sellers ADD FULLTEXT seller_search(name);
/* MENGHAPUS FULLTEXT SEARCH */
ALTER TABLE sellers DROP INDEX seller_search(name);

SELECT * FROM products WHERE MATCH(name) AGAINST ('TOKO', IN NATURAL LANGUAGE MODE);
/* MENCARI KATA DENGAN KATA MIE NAMUN TANPA KATA BASO DENGAN FULLTEXT SEARCH*/
SELECT * FROM products WHERE MATCH(name) AGAINST ('+mie -bakso', IN BOOLEAN MODE);
/* MENCARI STRING YANG MIRIP DENGAN KATA SELANJUTNYA DARI BAKSO */
SELECT * FROM products WHERE MATCH(name) AGAINST ('bakso', WITH QUERY EXPANSION);

----------------------------------------- Table Relationship ---------------------------------------
/* untuk membuat relasi antar table kita hanya perlu membuat kolom foreign key yang berelasi ke kolom primary key di table reference 

behvior foreign key     ON DELETE           ON UPDATE
- RESTRICT              ditolak             ditolak
- CASCADE               data akan dihapus   data akan ikut diubah
- NO ACTION             data dibiarkan      data dibiarkan
- SET NULL              diubah jadi null    diubah jadi null
*/
CREATE TABLE wishlist{
    id INT NOT NULL AUTO_INCREMENT,
    id_produk VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product
        FOREIGN KEY (id_produk) REFERENCES products(id)
}ENGINE = InnoDB;

ALTER TABLE wishlist
    DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_product
        FOREIGN KEY (id_produk) REFERENCES products(id)
            ON DELETE CASCADE ON UPDATE SET NULL

----------------------------------------- Join ---------------------------------------
/* cara melakukan join di nysql */

SELECT * FROM wishlist JOIN proucts ON (wishlist.id_produk = products.id)

SELECT wishlist.id, products.id, products.name, wishlist.description FROM wishlist JOIN proucts ON (wishlist.id_produk = products.id)

SELECT w.id AS id_wishlist, p.id AS id_produk, p.name, w.description FROM wishlist AS w JOIN proucts AS p ON (w.id_produk = p.id)

ALTER TABLE wishlist ADD COLUMN id_customer INT; 

/* menambahan relasi ke dalam table */
ALTER TABLE wishlist ADD CONSTRAINT fk_wishlist_customer FOREIGN KEY (id_customer) REFERENCES customers (id);

----------------------------------------- One To One Relationship (relasi satu ke satu)---------------------------------------
/* tiap data di sebuah tabel hanya boleh berelasi ke maksimal 1 data di table lain misal: jika di toko online satu customer hanya boleh punya satu dompet/wallet, cara menerapkan relasi one to one adalah dengan membuat foreign key kemudian kita set menjadi UNIQUE KEY */

CREATE TABLE wallet{
    id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_unique (id_customer),
    CONSTRAINT fk_wallet_customer
        FOREIGN KEY (id_customer) REFERENCES customers(id)
}ENGINE = InnoDB;

----------------------------------------- One To Many Relationship (relasi satu ke banyak)---------------------------------------
/* one to many berarti satu data bisa digunakan lebih dari satu kali di table relasinya, misal satu category bisa digunakan oleh banyak produk. implementainya tidak perlu menggunakan  unique key di table relasi seperti one to one karena memang datanya boleh berkali kali ditambahkan di table relasinya */

CREATE TABLE categories{
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
}ENGINE = InnoDB;

--tambahkan relasi ke table produk. paa relasi ini data boleh sama di kolom foreign key
ALTER TABLE products
A CONSTRAINT fk_product_categories
FOREIGN KEY (id_category) REFERENCES categories(id);

----------------------------------------- Many To Many Relationship (relasi banyak ke banyak)---------------------------------------
/* relai many to many adalah relasi antar dua table dimana table pertama bisa punya banyak relasi di table kedua, begitupula sebaliknya. implementasi many to many adalah dengan membuat satu buah table relasi ditengahnya yang berfungsi sebagai jembatan untuk menggabungkan relasi M to M. isi table jembtannya akan berisi id dari table pertama dan id dari table ke dua  */

--TABLE ORDER
CREATE TABLE orders{
    id INT NOT NULL AUTO_INCREMENT,
    total INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
}ENGINE = InnoDB;


--TABLE RELASI/PENGHUBUNG/JEMBATAN ANTARA DUA TABLE M TO M
CREATE TABLE orders_detail{
    id_product VARCHAR(10) NOT NULL,
    id_order INT NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id_product, id_order)
}ENGINE = InnoDB;

--menambahkan foreign key ke table penghubung
ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_products
FOREIGN KEY (id_product) REFERENCES products(id);

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_orders
FOREIGN KEY (id_order) REFERENCES orders(id);

----------------------------------------- Kesimpulan dari relasi antar table ---------------------------------------
/* implementasi relasi dilakukan dengan membuat sebuah field sebagai foreign key di tabel lain, jika relasinya one to one maka field foreign key tersebut di buat menjadi unique key, apabila one to many foreign key tidak perlu dijadikan unique key, sedangkan untuk relasi many to many kita harus membuat satu table lagi sebagai table penghubung antara dua table kemudian membuat fiel foreign key dari setiap masing masing table seperti contoh diatas */

----------------------------------------- Jenis jenis join ---------------------------------------
/* 
- INNER JOIN 
ini adalah default join. jika ada data di table pertama yang tidak memiliki relasi ditable kedua ataupun sebaliknya, maka hail inner join tidak akan ditampilkan
- LEFT JOIN
seperti inner join namun semua data di table pertama akan ditampilkan juga meski kolom relasinya kosong
RIGHT JOIN
- kebalikan dari left join
CROSS JOIN
- mengalikan di table pertama dengan data di table kedua. artinya jika ada 5 data di table pertama dan 5 data ditable kedua maka akan menghasilkan 25 kombinasi data(5X5). join ini jarang sekali digunakan
 */

--inner join
 SELECT * FROM categories INNER JOIN proucts ON (proucts.id_category = categories.id);

--left join
 SELECT * FROM categories LEFT JOIN proucts ON (proucts.id_category = categories.id);

--right join
 SELECT * FROM categories RIGHT JOIN proucts ON (proucts.id_category = categories.id);

--right join
 SELECT * FROM categories CROSS JOIN proucts;

 ----------------------------------------- Subquery ---------------------------------------
/* subquery adalah untuk mencari data berdasarkan hasil query lain */
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);

--Subquery JUGA BISA DILAKUKAN DI FROM CLAUSE NAMUN HARUS MENGGUNAKAN ALIAS
SELECT MAX(cp.price) FROM (SELECT price FROM categories JOIN products ON (products.id_category = categories.id)) AS cp;

----------------------------------------- Set Operator ---------------------------------------
/* 
set operator adalah operasi antara hasil dari dua select query. Ada banyak jenis operator set, yaitu:
- UNION
    - operasi menggabungkan dua buah select query, dimana jika terdapat data yang duplikat, data duplikatnya akan dihapus dari hasil query
- UNION ALL
    - sama seperti union namun data duplikat akan tetap ditampilkan dihasil querynya
- INTERSECT
    - operasi menggabungkan dua query, namun yang diambil hanya data yang terdapat pada hasil query dan query kedua
    - data yang muncul data distinc/tidak duplikat
    - INTERSECT diimplementasikan menggunakan join atau subquery
- MINUS
    - operasi dimana query pertama akan dihilangkan oleh query kedua
    - MINUS diimplementasikan menggunakan JOIN
 */

 CREATE TABLE guestbooks{
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100),
    title VARCHAR(100),
    content TEXT,
    PRIMARY KEY (id)
}ENGINE = InnoDB;

INSERT INTO guestbooks(email, title, content) VALUES ('guest@gmail.com', 'Hello', 'Hello'),
('guest@gmail.com', 'Hello', 'Hello'),
('guest2@gmail.com', 'Hello', 'Hello'),
('guest3@gmail.com', 'Hello', 'Hello'),
('eko@gmail.com', 'Hello', 'Hello'),
('eko@gmail.com', 'Hello', 'Hello'),
('eko@gmail.com', 'Hello', 'Hello')

--UNION -> MENAMPILKAN DATA HASIL GABUNGAN DARI KEDUA QUERY DIBAWAH, NAMUN DATA YANG DUPLIKAT HANYA DITAMPILKAN SATU
SELECT DISTINC email FROM customers
UNION
SELECT DISTINC email FROM guestbooks;

--UNION ALL -> sama seperti union namun data duplikat akan tetap ditampilkan dihasil querynya
SELECT DISTINC email FROM customers
UNION
SELECT DISTINC email FROM guestbooks;

--menghitung berapa banyak kemunculan email
SELECT emails.email, COUNT(emails.email) FROM
(SELECT DISTINC email FROM customers
UNION
SELECT DISTINC email FROM guestbooks) AS emails GROUP BY emails.email;


/* INTERSECT
    - operasi menggabungkan dua query, namun yang diambil hanya data yang terdapat pada hasil query dan query kedua
    - data yang muncul data distinc/tidak duplikat
    - INTERSECT diimplementasikan menggunakan inner join atau subquery */
SELECT DISTINC email FROM customers WHERE email IN (SELECT DISTINC email FROM guestbooks);
--atau
SELECT DISTINC customers.email FROM customers INNER JOIN guestbooks ON (guestbooks.email = customers.email);

/* 
- MINUS
    - operasi dimana query pertama akan dihilangkan oleh query kedua
    - MINUS diimplementasikan menggunakan JOIN */

SELECT DISTINC customers.email, guestbooks.email FROM customers LEFT JOIN guestbooks ON (guestbooks.email = customers.email) WHERE guestbooks.email IS NULL;