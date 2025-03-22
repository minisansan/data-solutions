#请编写一个SQL查询，找到每个部门里排名top2的薪水信息，返回结果按照部门和薪水降序排列。
#利用窗口函数RANK进行排序，找到<=2的

WITH CET1 AS(
    SELECT  department,
            employee_name,
            salary,
            RANK() OVER(
                PARTITION BY department
                ORDER BY salary DESC
            ) AS rnk
    FROM employees
)

SELECT  department,
        employee_name,
        salary
FROM CET1 
WHERE rnk<=2
ORDER BY department,salary DESC;

/*
描述
假设有一个employees表，里面记录了公司里职工的信息。
包括职工id、职工姓名、部门、薪水、入职日期。

请编写一个SQL查询，找到每个部门里排名top2的薪水信息，返回结果按照部门和薪水降序排列。
示例输出如下：
*/
