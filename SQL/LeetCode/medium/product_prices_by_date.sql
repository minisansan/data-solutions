# Write your MySQL query statement below
#可以分为两部分解题，用UNION ALL连接
#第一部分找到2019-08-16日期之前的
#对之前的数据，可以利用聚类，找到每个id以及其对应的最大日期
#最后找到对应的输出就可以了
#第二部分，找到之后的没有出现过的id（也即最小的出现时间大于8.16），将他们定价为10
(
WITH CET1 AS(
    SELECT  product_id,
            max(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

SELECT  product_id,
        new_price AS price
FROM Products
WHERE (product_id,change_date) IN(
    SELECT *
    FROM CET1
)
)
UNION ALL

(
SELECT  product_id,
        10
FROM Products
GROUP BY product_id
HAVING MIN(change_date)>'2019-08-16'
)

/*
产品数据表: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) 是此表的主键（具有唯一值的列组合）。
这张表的每一行分别记录了 某产品 在某个日期 更改后 的新价格。
 

编写一个解决方案，找出在 2019-08-16 时全部产品的价格，假设所有产品在修改前的价格都是 10 。

以 任意顺序 返回结果表。

结果格式如下例所示。
*/
