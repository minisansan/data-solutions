#需要计算订单下单最多的商品id，取第一个返回即可；注最早支付的订单是只需要考虑order_log中的订单号的订单，非整条支付链路；相同次数以product_id顺序排列
#对表user_client_log,找出step为order的，对应的product_id的数量，找出最高的

SELECT product_id,
       COUNT(*) AS cnt
FROM user_client_log
WHERE step = 'order'
GROUP BY product_id
ORDER BY product_id
LIMIT 1;

/*
描述
小明需要处理某支付app会在客户端打印的日志。其中客户端有表user_client_log(trace_id,uid,logtime,step,product_id,pay_method)分别代表trace_id订单号，uid(用户id)、logtime(客户端事件发生时间)、step(客户端步骤)、product_id(商品id)、pay_method(支付方式)，

例如：完整的下单流程是select选择支付方式、order下单、start开始支付、failed支付失败、end支付结束）。
其中有product_info(product_id,price,type,product_name)分别代表product_id商品id、price商品价格、type商品类型、product_name商品名称（表中数据已去重）。



【问题】需要计算订单下单最多的商品id，取第一个返回即可；注最早支付的订单是只需要考虑order_log中的订单号的订单，非整条支付链路；相同次数以product_id顺序排列


【示例结果】返回两列：product_id、cnt代表个数

【示例解析】
    1.例如trace_id为0001的支付链路日志，具有order信息（即step含有order）
    2.根据含有order的订单与商品信息表中的商品信息关联得到，trace_id='0001'的订单，购买的商品是p100
    3.根据1&2中汇总的数据分组统计最后得出下单成功最高的商品id

*/
