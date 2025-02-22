#可以按照player_id聚类，然后找到首次登陆的时间，也就是min()，那么第二天也登录这个游戏的话，应该是存在DATE_ADD(MIN(event_date), INTERVAL 1 DAY)的
#如果存在那么，我们就找到了

WITH CET1 AS(
    SELECT  player_id,
            DATE_ADD(MIN(event_date), INTERVAL 1 DAY)
    FROM activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(DISTINCT player_id)/(SELECT COUNT(DISTINCT player_id) FROM activity),2) AS fraction
FROM  activity
WHERE (player_id,event_date) IN (
    SELECT *
    FROM CET1
)


/*
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
（player_id，event_date）是此表的主键（具有唯一值的列的组合）。
这张表显示了某些游戏的玩家的活动情况。
每一行是一个玩家的记录，他在某一天使用某个设备注销之前登录并玩了很多游戏（可能是 0）。
 

编写解决方案，报告在首次登录的第二天再次登录的玩家的 比率，四舍五入到小数点后两位。换句话说，你需要计算从首次登录日期开始至少连续两天登录的玩家的数量，然后除以玩家总数。
*/
