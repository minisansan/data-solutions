#从订单链路出发，找出同一个order_id下order_log与select_log相差时间的绝对值的平均值(logtime，以s为单位)，以整数形式返回
#用order_log连接表select_log，计算两个表当中的logtime差，可以利用TIMESTAMPDIFF(),SECOND
 
SELECT CAST(ROUND(AVG(ABS(TIMESTAMPDIFF(SECOND, s.logtime, o.logtime))), 0) AS SIGNED) AS gap
FROM  order_log AS o
JOIN select_log AS s  USING(order_id)

/*
描述
小明负责支付订单的日志分析工作，公司有两个表order_log和select_log；
order_log表代表玩家创建订单的客户端日志(order_id订单号，uid用户id，日志采集时间logtime，客户端记录时间time，product_id商品id，支付方式pay_method)
order_id	uid	logtime	time	product_id	pay_method
aaaa	user_0001	2021-01-01 10:00:00	2021-01-01 10:00:00	p599	
bbbb	user_0006	2022-01-01 09:59:58	2021-01-01 09:59:58	p599	
cccc	user_0006	2022-01-01 09:59:58	2021-01-01 09:59:58	p599	
select_log表代表玩家选择支付方式的客户端日志(order_id订单号，uid用户id，日志采集时间logtime，客户端记录时间time，product_id商品id，支付方式pay_method)
order_id	uid	logtime	time	product_id	pay_method
aaaa	user_0001	2021-01-01 10:01:00	2021-01-01 10:01:00	p599	vx
bbbb	user_0006	2022-01-01 10:00:58	2021-01-01 10:00:58	p599	alipay
cccc	user_0006	2022-01-01 10:00:58	2021-01-01 10:00:58	p599	meituan
【问题】从订单链路出发，找出同一个order_id下order_log与select_log相差时间的绝对值的平均值(logtime，以s为单位)，以整数形式返回
【示例结果】
返回列：
gap
60

【示例解析】
    1.基于order_id关联出，order_log和select_log日志在同一订单号order_id下的order_log中的logtime与select_log中的logtime的间隔
    2.对间隔时间求绝对值再求平均值最后返回订单号与间隔时间(s)
注：logtime为日志采集时间，可能局部乱序；无需考虑为空
*/
