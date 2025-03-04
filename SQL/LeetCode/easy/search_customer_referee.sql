# Write your MySQL query statement below
#用where进行筛选referee_id不等于2的

SELECT name
FROM Customer
WHERE referee_id!=2 OR referee_id IS NULL;

/*
表: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
在 SQL 中，id 是该表的主键列。
该表的每一行表示一个客户的 id、姓名以及推荐他们的客户的 id。
找出那些 没有被 id = 2 的客户 推荐 的客户的姓名。

以 任意顺序 返回结果表。
*/
