-- 首先将两个表连接起来，去掉 banned='Yes' 的行，形成一个临时表 A
-- 在两个表连接的时候，要进行两次连接，第一次连接的是 client_id，第二次连接的是 driver_id
WITH CET1 AS (
    SELECT 
        t.status,
        t.request_at,
        c.banned AS client_banned,
        d.banned AS driver_banned
    FROM Trips t
    LEFT JOIN Users c ON c.users_id = t.client_id AND c.role = 'client'
    LEFT JOIN Users d ON d.users_id = t.driver_id AND d.role = 'driver'
),
-- 去掉有 'Yes' 的行
CET2 AS (
    SELECT status, request_at
    FROM CET1
    WHERE client_banned = 'No' AND driver_banned = 'No' AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
-- 计算每天的取消率，使用 ROUND 四舍五入保留两位小数
SELECT 
    request_at AS Day,
    ROUND(
        SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS 'Cancellation Rate'
FROM CET2
GROUP BY request_at;

/*
表：Trips
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| client_id   | int      |
| driver_id   | int      |
| city_id     | int      |
| status      | enum     |
| request_at  | varchar  |
+-------------+----------+
id 是这张表的主键（具有唯一值的列）。
这张表中存所有出租车的行程信息。每段行程有唯一 id ，其中 client_id 和 driver_id 是 Users 表中 users_id 的外键。
status 是一个表示行程状态的枚举类型，枚举成员为(‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’) 。


表：Users

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| users_id    | int      |
| banned      | enum     |
| role        | enum     |
+-------------+----------+
users_id 是这张表的主键（具有唯一值的列）。
这张表中存所有用户，每个用户都有一个唯一的 users_id ，role 是一个表示用户身份的枚举类型，枚举成员为 (‘client’, ‘driver’, ‘partner’) 。
banned 是一个表示用户是否被禁止的枚举类型，枚举成员为 (‘Yes’, ‘No’) 。


取消率 的计算方式如下：(被司机或乘客取消的非禁止用户生成的订单数量) / (非禁止用户生成的订单总数)。

编写解决方案找出 "2013-10-01" 至 "2013-10-03" 期间非禁止用户（乘客和司机都必须未被禁止）的取消率。非禁止用户即 banned 为 No 的用户，禁止用户即 banned 为 Yes 的用户。其中取消率 Cancellation Rate 需要四舍五入保留 两位小数 。

返回结果表中的数据 无顺序要求 。  */
