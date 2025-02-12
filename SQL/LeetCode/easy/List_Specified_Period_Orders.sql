# Write your MySQL query statement below
#按照order_date聚类，like 2020-02
#聚类之后按照product_id进行聚类，对同一个id的unit进行相加
#判断是否>=100

SELECT  P.product_name,
        SUM(O.unit) AS unit
FROM  Orders AS O
JOIN Products AS P
ON P.product_id=O.product_id
WHERE O.order_date LIKE "2020-02-%"
GROUP BY O.product_id
HAVING SUM(O.unit)>=100;


-- 表: Products
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | product_id       | int     |
-- | product_name     | varchar |
-- | product_category | varchar |
-- +------------------+---------+
-- product_id 是该表主键(具有唯一值的列)。
-- 该表包含该公司产品的数据。

-- 表: Orders
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | order_date    | date    |
-- | unit          | int     |
-- +---------------+---------+
-- 该表可能包含重复行。
-- product_id 是表单 Products 的外键（reference 列）。
-- unit 是在日期 order_date 内下单产品的数目。

-- 写一个解决方案，要求获取在 2020 年 2 月份下单的数量不少于 100 的产品的名字和数目。
-- 返回结果表单的 顺序无要求 。
-- 查询结果的格式如下。
