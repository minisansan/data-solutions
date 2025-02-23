# Write your MySQL query statement below

#查询每一个玩家第一次登录的日期，可以用窗口函数按照玩家id分类，按时间顺序排名，在输出为1的

WITH CET1 AS(
    SELECT  player_id,
            event_date,
            ROW_NUMBER() OVER(
                PARTITION BY player_id
                ORDER BY event_date
            )   AS rnk
    FROM Activity
)

SELECT  player_id,
        event_date AS first_login
FROM CET1
WHERE rnk=1

/*
活动表 Activity：

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
在 SQL 中，表的主键是 (player_id, event_date)。
这张表展示了一些游戏玩家在游戏平台上的行为活动。
每行数据记录了一名玩家在退出平台之前，当天使用同一台设备登录平台后打开的游戏的数目（可能是 0 个）。


查询每位玩家 第一次登录平台的日期。
*/
