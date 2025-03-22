#现在你需要输出每个用户最后一次下单的信息
#根据表orders，利用窗口函数，按照customer_id，对order_date进行排序，逆序，输出为1的
#最后链接表customers

WITH CET AS(
    SELECT  customer_id,
            order_id,
            order_date,
            RANK() OVER(
                PARTITION BY customer_id
                ORDER BY order_date DESC
            ) AS rnk
    FROM orders
)

SELECT  c.order_id,
        cu.customer_name,
        order_date
FROM CET AS c
LEFT JOIN customers AS cu USING(customer_id)
WHERE c.rnk=1
ORDER BY cu.customer_name,c.order_id;

/*
日常在处理订单的时候我们会遇到一些问题。
假设现在有2个表，订单orders表和用户customers表。
其中orders的表结构如下
+---------+------------+---------------------+
| order_id | customer_id | order_date          |
+---------+------------+---------------------+
| 1       | 101        | 2022-07-01 10:00:00 |
| 2       | 102        | 2022-07-02 11:30:00 |
| 3       | 101        | 2022-07-03 15:45:00 |
| 4       | 103        | 2022-07-04 09:20:00 |
| 5       | 102        | 2022-07-05 14:10:00 |
+---------+------------+---------------------+
customers的表结构如下
+------------+--------------+
| customer_id | customer_name |
+------------+--------------+
| 101        | aaa        |
| 102        | bbb          |
| 103        | ccc        |
+------------+--------------+
现在你需要输出每个用户最后一次下单的信息，包括：order_id，customer_name，最近下单日期。
上面的例子输出如下
+---------+--------------+---------------------+
| order_id | customer_name | order_date          |
+---------+--------------+---------------------+
| 3       | aaa        | 2022-07-03 15:45:00 |
| 5       | bbb          | 2022-07-05 14:10:00 |
| 4       | ccc        | 2022-07-04 09:20:00 |
+---------+--------------+---------------------+
*/
