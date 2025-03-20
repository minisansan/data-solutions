#求出user_client_log中具有下单次数逆序前三的用户的id和下单次数；相同次数以uid顺序排列
#对表user_client_log筛选出order，按照uid进行聚合，进行排序
#按照逆序排序，筛选出想要的

SELECT  uid,
        COUNT(*) AS cnt
FROM user_client_log
WHERE step='order'
GROUP BY uid
ORDER BY cnt DESC
LIMIT 3;

/*
小明需要处理某支付app会在客户端打印的日志。其中客户端有表user_client_log(trace_id,uid,logtime,step,product_id,pay_method)分别代表trace_id订单号，uid(用户id)、logtime(客户端事件发生时间)、step(客户端步骤)、product_id(商品id)、pay_method(支付方式) 。

例如：完整的下单流程是select选择支付方式、order下单、start开始支付、failed支付失败、end支付结束）。

 【问题】求出user_client_log中具有下单次数逆序前三的用户的id和下单次数；相同次数以uid顺序排列
【知识点】聚合函数、窗口函数、排序函数 
【示例结果】返回两列：uid代表用户id、cnt代表成功下单的用户下单的次数

【示例解析】
    1.例如trace_id为0001的支付链路日志，具有order信息（即step含有order）
    2.根据含有order的订单与商品信息表中的商品信息关联得到，trace_id='0001'的订单，购买的次数是1
    3.根据1&2中汇总的数据分组统计最后得出用户商品购买成功次数最多的前三个用户，相同次数则以用户id顺序排列返回
注：

    只有select步骤的数据有pay_method字段；

    如果select中pay_method为''则以error标记pay_method为脏数据；

   无需考虑返回为空的异常处理
   */
