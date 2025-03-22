#编写一个MySQL查询语句，查找每个顾客最后一次下单的订单信息，包括订单编号、顾客名称、以及最近下单日期。
#对表orders，按照customer_id，对order_date进行利用窗口函数排序RANK，逆序，选出第一个，在进行表连接

WITH CET1 AS (
    SELECT  order_id,
            customer_id,
            order_date,
            RANK() OVER(
                PARTITION BY customer_id
                ORDER BY order_date DESC
            ) AS rnk
    FROM orders
)

SELECT  c.order_id,
        cu.customer_name,
        c.order_date
FROM CET1 AS c
LEFT JOIN customers AS cu USING(customer_id)
WHERE c.rnk=1
ORDER BY cu.customer_name,c.order_id;

/*
描述
假设有两个表，分别是"orders"和"customers"，用于存储电商平台的订单信息和顾客信息。下面是两个表的结构和示例数据：
Table: orders
+---------+------------+---------------------+
| order_id | customer_id | order_date          |
+---------+------------+---------------------+
| 1       | 101        | 2023-07-01 10:00:00 |
| 2       | 102        | 2023-07-02 11:30:00 |
| 3       | 101        | 2023-07-03 15:45:00 |
| 4       | 103        | 2023-07-04 09:20:00 |
| 5       | 102        | 2023-07-05 14:10:00 |
+---------+------------+---------------------+
Table: customers
+------------+--------------+
| customer_id | customer_name |
+------------+--------------+
| 101        | Alice        |
| 102        | Bob          |
| 103        | Carol        |
+------------+--------------+
编写一个MySQL查询语句，查找每个顾客最后一次下单的订单信息，包括订单编号、顾客名称、以及最近下单日期。要求使用窗口函数和表联结进行解决。
+---------+--------------+---------------------+
| order_id | customer_name | order_date          |
+---------+--------------+---------------------+
| 3       | Alice        | 2023-07-03 15:45:00 |
| 5       | Bob          | 2023-07-05 14:10:00 |
| 4       | Carol        | 2023-07-04 09:20:00 |
+---------+--------------+---------------------+
*/
