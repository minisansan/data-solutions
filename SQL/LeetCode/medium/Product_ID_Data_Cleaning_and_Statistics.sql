#  由于order_log中order_id未清洗的原因，用户购买的product_id在order_id中需要统计订单号出现次数最多的一个product_id，以product_id进行顺序排列返回
#将order_log里面的order_id进行拆分成为真正的order_id和product_id，进行聚合求COUNT()

WITH CET AS(
    SELECT  SUBSTRING_INDEX(order_id,"_",-1) AS product_id
    FROM order_log
)

SELECT  product_id,
        COUNT(*) AS cnt
FROM CET 
GROUP BY product_id
ORDER BY product_id;

/*
描述
小明负责支付订单的日志分析工作，公司有表order_log；

order_log表代表玩家创建订单的客户端日志(order_id订单号，uid用户id，日志采集时间logtime，客户端记录时间time，支付方式pay_method)

【问题】
    由于order_log中order_id未清洗的原因，用户购买的product_id在order_id中需要统计订单号出现次数最多的一个product_id，以product_id进行顺序排列返回
    order_id构成为order_id + '_' + product_id；且product_id以p开始命名，例如p100；order_id不会带有p
【知识点】
    正则表达式，分组统计，排序
【示例结果】
    返回列product_id | cnt

【示例解析】
    order_id中藏着的product_id为p599出现了六次，出现频率最高
注：不需要注意返回数据为空
*/
