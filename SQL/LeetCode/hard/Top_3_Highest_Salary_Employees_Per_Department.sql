# Write your MySQL query statement below
#按照窗口函数，DENSE_RANK()进行分部门不跳号排序，作为临时表
#进行WHERE筛选，选择标号<=3的员工

SELECT 
    Department.name AS Department,
    emp.name AS Employee,
    emp.salary AS Salary
FROM (
    SELECT 
        departmentId,
        name,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY departmentId 
            ORDER BY salary DESC
        ) AS rn
    FROM Employee
) AS emp
LEFT JOIN Department 
ON emp.departmentId = Department.id
WHERE emp.rn <= 3;


-- 表: Employee
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
-- id 是该表的主键列(具有唯一值的列)。
-- departmentId 是 Department 表中 ID 的外键（reference 列）。
-- 该表的每一行都表示员工的ID、姓名和工资。它还包含了他们部门的ID。

-- 表: Department
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id 是该表的主键列(具有唯一值的列)。
-- 该表的每一行表示部门ID和部门名。

-- 公司的主管们感兴趣的是公司每个部门中谁赚的钱最多。
-- 一个部门的 高收入者 是指一个员工的工资在该部门的 不同 工资中 排名前三 。
