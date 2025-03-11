#请统计每个会员等级的订单总额。
#将order_tb表按照user_id进行聚类，SUM求total_price返回表CET1
#利用表uservip_tb左连接CET1,按照vip聚合求SUM，如果为NULL返回0

WITH CET1 AS(
    SELECT  user_id,
            SUM(order_price) AS total_price
    FROM order_tb
    GROUP BY user_id
)


SELECT  u.vip,
        IFNULL(SUM(total_price),0) AS order_total
FROM CET1 AS c
RIGHT JOIN uservip_tb AS u USING(user_id)
GROUP BY u.vip
ORDER BY order_total DESC;

/*
描述
现有某公司部分订单数据及用户会员等级数据，如下所示：
订单信息表：order_tb（订单id-order_id，用户id-user_id，订单金额-order_price，订单创建时间-order_time）
order_id	user_id	order_price	order_time
101	11	380	2022-09-01 09:00:00
102	12	200	2022-09-01 10:00:00
103	13	260	2022-09-01 12:00:00
104	11	100	2022-09-02 11:00:00
105	12	150	2022-09-02 12:00:00
106	12	1200	2022-09-02 13:00:00
107	11	60	2022-09-03 09:00:00
108	13	380	2022-09-03 09:30:00
会员等级信息表：uservip_tb（用户id-user_id，会员等级-vip，积分-point）
user_id	vip	point
10	银卡会员	530
11	银卡会员	1555
12	钻石会员	12000
13	金卡会员	6115
14	普通会员	230
15	银卡会员	810
16	普通会员	330
请统计每个会员等级的订单总额。
要求输出：会员等级，订单总额
注：如果存在某一会员等级的用户没有下订单也需要输出该会员等级，订单总额记录为0，
输出结果按照订单总额降序排序
示例数据结果如下：
vip	order_total
钻石会员	1550
金卡会员	640
银行会员	540
普通会员	0
结果解释：
由用户会员等级信息表可知，钻石会员用户有12，该用户这几日共计下订单总额为1550，其他结果同理；
其中普通会员用户14、16没有下订单，故订单总额为0。
*/
