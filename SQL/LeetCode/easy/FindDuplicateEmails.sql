# Write your MySQL query statement below
#可以按照email聚类，选择count不为1的输出

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*)>1 ;


/*

表: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id 是该表的主键（具有唯一值的列）。
此表的每一行都包含一封电子邮件。电子邮件不包含大写字母。
 

编写解决方案来报告所有重复的电子邮件。 请注意，可以保证电子邮件字段不为 NULL。

以 任意顺序 返回结果表。

*/
