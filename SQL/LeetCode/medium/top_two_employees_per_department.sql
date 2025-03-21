#找出每个部门薪资排名前两名的员工信息，并按部门和薪资降序排列。要求使用窗口函数来完成。
#对不同部门，按照salary排序，选出序号<=2的

WITH CET1 AS (
    SELECT  department,
            employee_name,
            salary,
            RANK() OVER (
                PARTITION BY department
                ORDER BY salary DESC
            ) AS rnk
    FROM employees
)

SELECT  department,
        employee_name,
        salary
FROM CET1
WHERE rnk <= 2
ORDER BY department, salary DESC;

/*
假设你有一个名为employees的表，存储了员工的信息。示例表如下：

请编写一个SQL查询，找出每个部门薪资排名前两名的员工信息，并按部门和薪资降序排列。要求使用窗口函数来完成。
示例输出如下：
*/

