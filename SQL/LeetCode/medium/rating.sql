# Write your MySQL query statement below
# 确认率 是 'confirmed' 消息的数量除以请求的确认消息的总数
#对表Confirmations，按照user_id进行聚合，算出确认率 成为表CET1
#用表Signups左连接CET1，将确认率为NULL的设置为0.0

WITH CET1 AS(
    SELECT  user_id,
            ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END)/COUNT(*),2) AS  confirmation_rate
    FROM Confirmations
    GROUP BY user_id 
)

SELECT  s.user_id,
        COALESCE(c.confirmation_rate, 0.0) AS confirmation_rate
FROM Signups AS s
LEFT JOIN CET1 AS c USING(user_id)

/*
表: Signups

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
User_id是该表的主键。
每一行都包含ID为user_id的用户的注册时间信息。
 

表: Confirmations

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
| action         | ENUM     |
+----------------+----------+
(user_id, time_stamp)是该表的主键。
user_id是一个引用到注册表的外键。
action是类型为('confirmed'， 'timeout')的ENUM
该表的每一行都表示ID为user_id的用户在time_stamp请求了一条确认消息，该确认消息要么被确认('confirmed')，要么被过期('timeout')。
 

用户的 确认率 是 'confirmed' 消息的数量除以请求的确认消息的总数。没有请求任何确认消息的用户的确认率为 0 。确认率四舍五入到 小数点后两位 。

编写一个SQL查询来查找每个用户的 确认率 。

以 任意顺序 返回结果表。
*/
