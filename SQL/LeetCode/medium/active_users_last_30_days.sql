# Write your MySQL query statement below
#统计日期小于2019-07-28日期的，并且是30天的，可以利用DATEDIFF，定义一个结束日期，并且两个日期的差在0到29
#按照日期聚类，统计COUNT不同的用户个数


SELECT  activity_date AS day,
        COUNT(DISTINCT user_id) AS active_users
FROM Activity
GROUP BY activity_date
HAVING DATEDIFF("2019-07-27", activity_date) BETWEEN 0 AND 29

/*
表：Activity

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+
该表没有包含重复数据。
activity_type 列是 ENUM(category) 类型， 从 ('open_session'， 'end_session'， 'scroll_down'， 'send_message') 取值。
该表记录社交媒体网站的用户活动。
注意，每个会话只属于一个用户。
 

编写解决方案，统计截至 2019-07-27（包含2019-07-27），近 30 天的每日活跃用户数（当天只要有一条活动记录，即为活跃用户）。

以 任意顺序 返回结果表。
*/·
