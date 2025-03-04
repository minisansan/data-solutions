# Write your MySQL query statement below
#需要按照国家以及月份进行聚类
#求COUNT(*)作为trans_count
#利用窗口函数SUM求解approved_count和approved_total_amount,以及trans_total_amount
#用SUBSTRING_INDEX提取月份

SELECT  SUBSTRING_INDEX(trans_date,"-",2) AS month,
        country,
        COUNT(state) AS trans_count,
        SUM(IF(state='approved',1,0)) AS approved_count,
        SUM(amount) AS trans_total_amount,
        SUM(IF(state='approved',amount,0)) AS approved_total_amount
FROM Transactions
GROUP BY month,country;
        
/*

表：Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id 是这个表的主键。
该表包含有关传入事务的信息。
state 列类型为 ["approved", "declined"] 之一。
 

编写一个 sql 查询来查找每个月和每个国家/地区的事务数及其总金额、已批准的事务数及其总金额。

以 任意顺序 返回结果表。
*/
