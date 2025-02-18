# Write your MySQL query statement below
#对分数进行倒叙排名，且不会跳号，所以使用DENSE_RANK窗口函数

SELECT  score,
        DENSE_RANK() OVER(
            ORDER BY score DESC
        ) AS 'rank'
FROM Scores

/*
表: Scores

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+
id 是该表的主键（有不同值的列）。
该表的每一行都包含了一场比赛的分数。Score 是一个有两位小数点的浮点值。

编写一个解决方案来查询分数的排名。排名按以下规则计算:
1. 分数应按从高到低排列。
2. 如果两个分数相等，那么两个分数的排名应该相同。
3. 在排名相同的分数后，排名数应该是下一个连续的整数。换句话说，排名之间不应该有空缺的数字。

按 score 降序返回结果表。
*/
