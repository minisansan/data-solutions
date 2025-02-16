# Write your MySQL query statement below
#首先按照要求连接两个表，之后在进行处理
#把处理放在WHERE中的子查询里
#在子查询里，按照部门id进行归类，输出salary最大的部门id和salary

SELECT  d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary
FROM Employee AS e
LEFT JOIN Department AS d
ON d.id = e.departmentId
WHERE (e.departmentId,e.salary) IN (
            SELECT departmentId,MAX(salary)
            FROM Employee
            GROUP BY departmentId
        );


-- 文件名：Highest_Salary_Per_Department.sql
-- 功能：查询每个部门中薪资最高的员工
-- 输入表：
-- Employee 表：
-- +--------------+---------+
-- | 列名          | 类型    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
-- 在 SQL 中，id 是此表的主键。
-- departmentId 是 Department 表中 id 的外键。
-- 此表的每一行都表示员工的 id、姓名和工资，以及他们所在部门的 id。

-- Department 表：
-- +-------------+---------+
-- | 列名         | 类型    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- 在 SQL 中，id 是此表的主键列。
-- 此表的每一行都表示一个部门的 id 及其名称。

-- 查询目标：
-- 查找出每个部门中薪资最高的员工。
-- 按任意顺序返回结果表。
-- 查询结果格式如下例所示。
