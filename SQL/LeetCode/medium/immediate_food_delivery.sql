# Write your MySQL query statement below
#首先要获取用户的首次订单，利用窗口函数ROW_NUMBER()按不同的id排号，筛选出号为1的
#获取比例，可以用ROUND和SUM函数

WITH CET1 AS (
    SELECT  *,
            ROW_NUMBER() OVER(
                PARTITION BY customer_id
                ORDER BY order_date
            ) AS rn
    FROM Delivery
),
CET2 AS(
    SELECT *
    FROM CET1
    WHERE rn=1
)

SELECT ROUND(
    (SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100, 2
) AS immediate_percentage 
FROM CET2

/*
配送表: Delivery

+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id 是该表中具有唯一值的列。
该表保存着顾客的食物配送信息，顾客在某个日期下了订单，并指定了一个期望的配送日期（和下单日期相同或者在那之后）。
 

如果顾客期望的配送日期和下单日期相同，则该订单称为 「即时订单」，否则称为「计划订单」。

「首次订单」是顾客最早创建的订单。我们保证一个顾客只会有一个「首次订单」。

编写解决方案以获取即时订单在所有用户的首次订单中的比例。保留两位小数。
*/
