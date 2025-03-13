#请查询单日下单多次的用户信息
#order_tb，通过user_id和DATE(order_time)聚类，找出COUNT()>=2

SELECT  DATE(o.order_time) AS order_date,
        o.user_id,
        COUNT(*) AS order_nums,
        u.vip
FROM  order_tb AS o
JOIN uservip_tb AS u USING(user_id)
GROUP BY  o.user_id,DATE(o.order_time)
HAVING COUNT(*)>=2
ORDER BY order_nums DESC , user_id;


/*
描述
现有某公司部分订单数据及用户会员等级数据，如下所示：
订单信息表：order_tb（订单id-order_id,用户id-user_id,订单金额-order_price,订单创建时间-order_time）
order_id	user_id	order_price	order_time
101	11	380	2022-09-01 09:00:00
102	12	200	2022-09-01 10:00:00
103	13	260	2022-09-01 12:00:00
104	11	100	2022-09-02 11:00:00
105	12	150	2022-09-02 12:00:00
106	12	1200	2022-09-02 13:00:00
107	11	60	2022-09-03 09:00:00
108	13	380	2022-09-03 09:30:00
会员等级信息表：uservip_tb（用户id-user_id,会员等级-vip,积分-point）
user_id	vip	point
10	银卡会员	530
11	银卡会员	1555
12	钻石会员	12000
13	金卡会员	6115
14	普通会员	230
15	银卡会员	810
16	普通会员	330
请查询单日下单多次的用户信息？
要求输出：订单日期，user_id，下单次数，会员等级
注：单日多次下订单指该日同一用户下单次数大于1次，结果按照下单次数降序排序
示例数据结果如下：
order_date	user_id	order_nums	vip
2022-09-02	12	2	钻石会员
结果解释：
user_id为12的用户在9月2日分别下了order_id为105、106的订单，故结果如上。
*/
