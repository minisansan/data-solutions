# Write your MySQL query statement below
#获取 Sales 表中所有 sale_id 对应的 product_name 以及该产品的所有 year 和 price 
#Sales表左连接Product表

SELECT  p.product_name,
        s.year,
        s.price
FROM Sales AS s
LEFT JOIN Product AS p USING(product_id);

/*
销售表 Sales：

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) 是销售表 Sales 的主键（具有唯一值的列的组合）。
product_id 是关联到产品表 Product 的外键（reference 列）。
该表的每一行显示 product_id 在某一年的销售情况。
注意: price 表示每单位价格。
产品表 Product：

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id 是表的主键（具有唯一值的列）。
该表的每一行表示每种产品的产品名称。
 

编写解决方案，以获取 Sales 表中所有 sale_id 对应的 product_name 以及该产品的所有 year 和 price 。

返回结果表 无顺序要求 。
*/


