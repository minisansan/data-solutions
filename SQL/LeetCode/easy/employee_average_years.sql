# Write your MySQL query statement below
#查询每一个项目中员工的 平均 工作年限，精确到小数点后两位
#用表Project左连接表Employee表，按照project_id聚类，求AVG

SELECT  p.project_id ,
        ROUND(AVG(e.experience_years),2) AS average_years
FROM Project AS p
LEFT JOIN Employee AS e USING(employee_id)
GROUP BY p.project_id
ORDER BY p.project_id ;

/*
项目表 Project： 

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
主键为 (project_id, employee_id)。
employee_id 是员工表 Employee 表的外键。
这张表的每一行表示 employee_id 的员工正在 project_id 的项目上工作。
 

员工表 Employee：

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
主键是 employee_id。数据保证 experience_years 非空。
这张表的每一行包含一个员工的信息。
 

请写一个 SQL 语句，查询每一个项目中员工的 平均 工作年限，精确到小数点后两位。

以 任意 顺序返回结果表。
*/
