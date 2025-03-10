#返回每个商品的销售总量，先按照商品类别升序排序，再按销售总量降序排列，同时包括商品名称和销售总量。
#还需要在结果中包含每个商品在其所属类别内的排名，排名相同的商品可以按照 product_id 升序排序

#销售总量，按照product_id聚合，对quantity求SUM，按照要求形成表CET1
#用表CET1连接products表，利用窗口函数排序

WITH CET1 AS(
    SELECT  product_id,
            SUM(quantity) AS total_sales
    FROM orders
    GROUP BY product_id
)

SELECT  p.name AS product_name,
        c.total_sales,
        ROW_NUMBER() OVER(
            PARTITION BY p.category
            ORDER BY c.total_sales DESC,c.product_id
        ) AS category_rank
FROM  CET1 AS c
JOIN products AS p USING(product_id)
ORDER BY p.category,c.total_sales DESC

/*
描述
假设你是一个电商平台的数据库工程师，需要编写一个SQL查询来生成每个商品的销售排行榜。你的数据库中有products和orders两张表：
products示例表如下，包括product_id（商品编号）、name（商品名称）和category（商品类别）字段；
product_id	name	category
1	Product A	Category 1
2	Product B	Category 1
3	Product C	Category 2
4	Product D	Category 2
5	Product E	Category 3
orders示例表如下，包括order_id（订单编号）、product_id（商品编号）、quantity（销售数量）和order_date（下单日期）字段；
order_id	product_id	quantity	order_date
101	1	5	2023-08-01
102	2	3	2023-08-01
103	3	8	2023-08-02
104	4	10	2023-08-02
105	5	15	2023-08-03
106	1	7	2023-08-03
107	2	4	2023-08-04
108	3	6	2023-08-04
109	4	12	2023-08-05
110	5	9	2023-08-05
使用上述表格，编写一个SQL查询，返回每个商品的销售总量，先按照商品类别升序排序，再按销售总量降序排列，同时包括商品名称和销售总量。此外，还需要在结果中包含每个商品在其所属类别内的排名，排名相同的商品可以按照 product_id 升序排序。
示例输出如下：
product_name	total_sales	category_rank
Product A	12	1
Product B	7	2
Product D	22	1
Product C	14	2
Product E	24	1
*/
