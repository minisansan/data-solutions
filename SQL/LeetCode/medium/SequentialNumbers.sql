# Write your MySQL query statement below
#利用窗口函数前后值函数，判断num前面后面是否相等，相等就是3个
WITH CET1 AS(
    SELECT  num,
            LAG(num,1) OVER(ORDER BY id) AS num1,
            LEAD(num,1) OVER(ORDER BY id) AS num2
    FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM CET1
WHERE num=num1 AND num=num2
/*
表：Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
在 SQL 中，id 是该表的主键。
id 是一个自增列。
 

找出所有至少连续出现三次的数字。

返回的结果表中的数据可以按 任意顺序 排列。

*/
