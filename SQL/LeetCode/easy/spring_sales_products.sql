# 报告 2019年春季 才售出的产品。即 仅 在 2019-01-01 （含）至 2019-03-31 （含）之间出售的商品。
#对Sales表进行按照product_id聚类，观看每一类的最大时间是否大于03-31，最小时间是否小于01-01

SELECT s.product_id, p.product_name
FROM Sales AS s
JOIN Product AS p USING(product_id)
GROUP BY s.product_id, p.product_name
HAVING MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date) <= '2019-03-31';

/*

表： Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
| unit_price   | int     |
+--------------+---------+
product_id 是该表的主键（具有唯一值的列）。
该表的每一行显示每个产品的名称和价格。
表：Sales

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| seller_id   | int     |
| product_id  | int     |
| buyer_id    | int     |
| sale_date   | date    |
| quantity    | int     |
| price       | int     |
+------ ------+---------+
这个表可能有重复的行。
product_id 是 Product 表的外键（reference 列）。
该表的每一行包含关于一个销售的一些信息。
 

编写解决方案，报告 2019年春季 才售出的产品。即 仅 在 2019-01-01 （含）至 2019-03-31 （含）之间出售的商品。

以 任意顺序 返回结果表。
*/
