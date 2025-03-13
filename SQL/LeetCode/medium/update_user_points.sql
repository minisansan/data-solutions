#会员用户如果下订单金额大于100则可获得同订单金额相同数额的积分，请根据这几日订单数据更新用户会员等级表中积分信息。
#对表oeder_tb筛选出会员的记录
#对生成的记录表，利用IF判断order_price是否大于100，大于返回order_price，不大于返回0，生成新的列point_a
#再按照id聚类，求SUM

WITH CET1 AS(
    SELECT  user_id,
            IF(order_price>100,order_price,0) AS point_a
    FROM order_tb
    WHERE user_id IN (SELECT user_id FROM uservip_tb)
),
CET2 AS(
    SELECT  user_id,
            SUM(point_a) AS 'point'
    FROM CET1
    GROUP BY user_id
    HAVING point>0
)

SELECT  c.user_id,
        c.point+u.point AS point
FROM CET2 AS c
JOIN uservip_tb AS u USING(user_id)
ORDER BY point DESC,c.user_id;

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
会员用户如果下订单金额大于100则可获得同订单金额相同数额的积分，请根据这几日订单数据更新用户会员等级表中积分信息。
要求输出：user_id,积分
注：默认现有用户会员等级信息表中积分为未更新状态，并且未获得积分的用户不用输出，最终结果按照积分降序排序。
示例数据结果如下：
user_id	point
12	13550
13	6755
11	1935
结果解释：
user_id为10、14、15、16未在这几日下单订，故未获得积分；
其中user_id为11的用户9月1日、2日、3日下订单，订单金额分别为380、100、60，
根据规则仅有9月1日订单可获得380积分，故更新后的积分为1555+380=1935积分；
其他结果同理。
*/
