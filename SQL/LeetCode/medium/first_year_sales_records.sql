# Write your MySQL query statement below
#首先对表Sales按照product_id，窗口函数RANK()按照year进行排序，筛选出序号为1的输出
WITH CET1 AS (
    SELECT 
        product_id,
        year,
        quantity,
        price,
        RANK() OVER (
            PARTITION BY product_id
            ORDER BY year
        ) AS rnk
    FROM Sales
)
SELECT 
    product_id,
    year AS first_year,
    quantity,
    price
FROM CET1
WHERE rnk = 1;
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
(sale_id, year) 是这张表的主键（具有唯一值的列的组合）。
product_id 是产品表的外键（reference 列）。
这张表的每一行都表示：编号 product_id 的产品在某一年的销售额。
请注意，价格是按每单位计的。
 

产品表 Product：

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id 是这张表的主键（具有唯一值的列）。
这张表的每一行都标识：每个产品的 id 和 产品名称。
 

编写解决方案，选出每个售出过的产品 第一年 销售的 产品 id、年份、数量 和 价格。

结果表中的条目可以按 任意顺序 排列。
*/
