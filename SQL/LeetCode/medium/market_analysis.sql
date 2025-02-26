# Write your MySQL query statement below
#编写解决方案找出每个用户的注册日期和在 2019 年作为买家的订单总数。
#首先查找出来每个用户的注册日期join_date,也即就是表Users
#在查找在2019年买家的订单总数
#首先要挑出在2019年的购物记录，使用日期范围进行筛选
#将Users表LEFT JOIN 表Orders
#之后按照user_id聚合统计个数


SELECT  u.user_id AS buyer_id,
        u.join_date,
        COUNT(o.order_id) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o 
ON u.user_id = o.buyer_id
    AND o.order_date >= '2019-01-01' AND o.order_date < '2020-01-01'
GROUP BY u.user_id, u.join_date;

/*
表： Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| join_date      | date    |
| favorite_brand | varchar |
+----------------+---------+
user_id 是此表主键（具有唯一值的列）。
表中描述了购物网站的用户信息，用户可以在此网站上进行商品买卖。
 

表： Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| item_id       | int     |
| buyer_id      | int     |
| seller_id     | int     |
+---------------+---------+
order_id 是此表主键（具有唯一值的列）。
item_id 是 Items 表的外键（reference 列）。
（buyer_id，seller_id）是 User 表的外键。
 

表：Items

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| item_id       | int     |
| item_brand    | varchar |
+---------------+---------+
item_id 是此表的主键（具有唯一值的列）。
 

编写解决方案找出每个用户的注册日期和在 2019 年作为买家的订单总数。

以 任意顺序 返回结果表。
*/
