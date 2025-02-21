# Write your MySQL query statement below

#通过后值函数，将学生student往下一行，并且要求id为偶数
#通过LEAD函数，将学生student向上一行，并且要求id为奇数,如果最后一个为null，即这个表是奇数表
#那么还需要将最后一个null替换为原本的学生姓名

WITH CET1 AS(
    SELECT student
    FROM Seat
    ORDER BY id DESC
    LIMIT 1
)

SELECT  id,
        CASE WHEN id%2!=0
            THEN LEAD(student,1,(SELECT student FROM CET1)) OVER(ORDER BY id)
        WHEN id%2=0
            THEN LAG(student,1) OVER(ORDER BY id)
        END AS 'student'
FROM Seat
ORDER BY id

/*
表: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id 是该表的主键（唯一值）列。
该表的每一行都表示学生的姓名和 ID。
ID 序列始终从 1 开始并连续增加。
 

编写解决方案来交换每两个连续的学生的座位号。如果学生的数量是奇数，则最后一个学生的id不交换。

按 id 升序 返回结果表。
*/
