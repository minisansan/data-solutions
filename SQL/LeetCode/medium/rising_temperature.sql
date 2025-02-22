# Write your MySQL query statement below

#将两个表笛卡尔积连接，然后通过datediff函数筛选出日期相差为1天的日期
#然后再筛选出要求的天气

SELECT w1.id
FROM Weather AS w1
CROSS JOIN Weather AS w2
WHERE DATEDIFF(w1.recordDate,w2.recordDate) = 1 AND w1.temperature>w2.temperature;

/*
表： Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id 是该表具有唯一值的列。
没有具有相同 recordDate 的不同行。
该表包含特定日期的温度信息
 

编写解决方案，找出与之前（昨天的）日期相比温度更高的所有日期的 id 。

返回结果 无顺序要求 。
*/

