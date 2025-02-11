# Write your MySQL query statement below
#首先将表格按照部门id聚合
SELECT  id,
        SUM(IF(month = "Jan",revenue,NULL)) AS Jan_Revenue,
        SUM(IF(month = "Feb",revenue,NULL)) AS Feb_Revenue,
        SUM(IF(month = "Mar",revenue,NULL)) AS Mar_Revenue,
        SUM(IF(month = "Apr",revenue,NULL)) AS Apr_Revenue,
        SUM(IF(month = "May",revenue,NULL)) AS May_Revenue,
        SUM(IF(month = "Jun",revenue,NULL)) AS Jun_Revenue,
        SUM(IF(month = "Jul",revenue,NULL)) AS Jul_Revenue,
        SUM(IF(month = "Aug",revenue,NULL)) AS Aug_Revenue,
        SUM(IF(month = "Sep",revenue,NULL)) AS Sep_Revenue,
        SUM(IF(month = "Oct",revenue,NULL)) AS Oct_Revenue,
        SUM(IF(month = "Nov",revenue,NULL)) AS Nov_Revenue,
        SUM(IF(month = "Dec",revenue,NULL)) AS Dec_Revenue
FROM  Department
GROUP BY id
ORDER BY id;


## 表 Department：
##
## +---------------+---------+
## | Column Name   | Type    |
## +---------------+---------+
## | id            | int     |
## | revenue       | int     |
## | month         | varchar |
## +---------------+---------+
## 在 SQL 中，(id, month) 是表的联合主键。
## 这个表格有关于每个部门每月收入的信息。
## 月份（month）可以取下列值 ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]。
##
## 重新格式化表格，使得 每个月 都有一个部门 id 列和一个收入列。
##
## 以 任意顺序 返回结果表
