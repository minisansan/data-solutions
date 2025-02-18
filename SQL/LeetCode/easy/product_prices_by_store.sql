# Write your MySQL query statement below

SELECT  product_id,
        'store1' AS store,
        store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION

SELECT  product_id,
        'store2' AS store,
        store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION


SELECT  product_id,
        'store3' AS store,
        store3 AS price
FROM Products
WHERE store3 IS NOT NULL


/*
表：Products

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| store1      | int     |
| store2      | int     |
| store3      | int     |
+-------------+---------+
在 SQL 中，这张表的主键是 product_id（产品Id）。
每行存储了这一产品在不同商店 store1, store2, store3 的价格。
如果这一产品在商店里没有出售，则值将为 null。
*/
