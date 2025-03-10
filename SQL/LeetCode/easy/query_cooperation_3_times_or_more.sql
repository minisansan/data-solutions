# Write your MySQL query statement below
#按照(actor_id, director_id)聚合，找出COUNT>3的

SELECT  actor_id, 
        director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*)>=3;

/*
ActorDirector 表：

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+
timestamp 是这张表的主键(具有唯一值的列).
 

编写解决方案找出合作过至少三次的演员和导演的 id 对 (actor_id, director_id)
*/
