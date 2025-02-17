# Write your MySQL query statement below

#对表进行左连接

SELECT a.name AS Employee
FROM Employee AS a
LEFT JOIN Employee AS b
ON a.managerId = b.id
WHERE a.salary > b.salary;


--表：Employee

--+-------------+---------+
--| Column Name | Type    |
--+-------------+---------+
--| id          | int     |
--| name        | varchar |
--| salary      | int     |
--| managerId   | int     |
--+-------------+---------+
--id 是该表的主键（具有唯一值的列）。
--该表的每一行都表示雇员的ID、姓名、工资和经理的ID。


--编写解决方案，找出收入比经理高的员工。

--以任意顺序 返回结果表。
