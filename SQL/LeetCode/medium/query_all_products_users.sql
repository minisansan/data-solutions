# Write your MySQL query statement below
#报告 Customer 表中购买了 Product 表中所有产品的客户的 id
#可以对Customer表进行聚合，求每个客户id买的不同种类产品的数量
#如果数量等于product表的个数，即符合要求
SELECT customer_id
FROM Customer 
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*)
    FROM Product
)

/*
Customer 表：

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
该表可能包含重复的行。
customer_id 不为 NULL。
product_key 是 Product 表的外键(reference 列)。
Product 表：

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key 是这张表的主键（具有唯一值的列）。
 

编写解决方案，报告 Customer 表中购买了 Product 表中所有产品的客户的 id。

返回结果表 无顺序要求 。
*/
