# Write your MySQL query statement below
#首先找到电影评分最多的用户名
#通过对movingrating表的user_id进行聚合，求max(count)
#之后再连接表users得到name，需要按照name进行排序，再limited 1
#再找到在2020年2月份评分最高的电影
#需要对movingrating中筛选出符合2020年2月份的
#求评分的平均数，之后再比较最大，连接表movies输出title
WITH CET1 AS (
    SELECT user_id,
           COUNT(*) AS cou
    FROM MovieRating
    GROUP BY user_id
),
CET2 AS (
    SELECT movie_id,
           AVG(rating) AS ra
    FROM MovieRating
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY movie_id
)
(
    SELECT u.name AS results
    FROM CET1 AS c
    JOIN Users AS u
    ON u.user_id = c.user_id
    ORDER BY c.cou DESC, u.name
    LIMIT 1
)
UNION ALL
(
    SELECT m.title AS results
    FROM CET2 AS c
    JOIN Movies AS m
    ON c.movie_id = m.movie_id
    ORDER BY c.ra DESC, m.title
    LIMIT 1
);


/*
表：Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id 是这个表的主键(具有唯一值的列)。
title 是电影的名字。
表：Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id 是表的主键(具有唯一值的列)。
'name' 列具有唯一值。
表：MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) 是这个表的主键(具有唯一值的列的组合)。
这个表包含用户在其评论中对电影的评分 rating 。
created_at 是用户的点评日期。 
 

请你编写一个解决方案：

查找评论电影数量最多的用户名。如果出现平局，返回字典序较小的用户名。
查找在 February 2020 平均评分最高 的电影名称。如果出现平局，返回字典序较小的电影名称。
字典序 ，即按字母在字典中出现顺序对字符串排序，字典序较小则意味着排序靠前。
*/
