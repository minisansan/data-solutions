# Write your MySQL query statement below

#按照salary排序，倒叙
#利用limit限制1
#因为要找到不同的薪水，所以应该DISTINCT
#并且要设置目标的salary<MAX(salary)

--SELECT IFNULL(
--    (SELECT DISTINCT salary
--     FROM Employee
--     WHERE salary < (SELECT MAX(salary) FROM Employee)
--     ORDER BY salary DESC
--     LIMIT 1
--    ) ,  NULL) AS SecondHighestSalary;


#聚合函数max + 标量子查询
#根据max函数的特性，如果返回值为空，则返回null
--SELECT MAX(salary) AS SecondHighestSalary
--FROM Employee
--WHERE salary < (SELECT MAX(salary) FROM Employee)



#利用窗口函数
SELECT IFNULL(
    (SELECT DISTINCT salary
     FROM (
         SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rn
         FROM Employee
     ) AS ranked
     WHERE rn = 2),
    NULL) AS SecondHighestSalary;

-- 功能：查询并返回 Employee 表中第二高的不同薪水
-- 如果不存在第二高的薪水，查询应该返回 NULL
-- 适用于 MySQL 和其他支持窗口函数的数据库

-- 表结构：
-- Employee(id, salary)
-- id 是主键，表的每一行包含员工的工资信息。

-- 查询逻辑：
-- 1. 使用子查询或窗口函数找到第二高的不同薪水。
-- 2. 如果没有第二高的薪水，返回 NULL
