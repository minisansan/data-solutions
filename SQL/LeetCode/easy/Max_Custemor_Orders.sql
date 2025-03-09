# Write your MySQL query statement below
#按照customer_number聚类，找出COUNT最大的

SELECT customer_number
FROM (
SELECT customer_number,COUNT(*) AS c
FROM Orders
GROUP BY customer_number
) AS a
WHERE c = (
    SELECT MAX(c) 
    FROM (
        SELECT customer_number, COUNT(*) AS c
        FROM Orders
        GROUP BY customer_number
    ) AS b
);

/*
表: Orders

+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
在 SQL 中，Order_number是该表的主键。
此表包含关于订单ID和客户ID的信息。
 

查找下了 最多订单 的客户的 customer_number 。

测试用例生成后， 恰好有一个客户 比任何其他客户下了更多的订单。
*/
