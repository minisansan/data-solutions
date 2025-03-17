#请你统计实际总销售额（结果保留三位小数）与客单价（人均付费，总收入/总用户数，结果保留三位小数）
#sales_tb筛选出sale_date在2021-12-15和2021-12-31之间
#将sales_tb连接表goods_tb，计算客单价

SELECT  ROUND(SUM(goods_price*sales_num),3) sales_total,
        ROUND(SUM(goods_price*sales_num)/COUNT(distinct user_id),3) per_trans
FROM sales_tb s
LEFT JOIN goods_tb g USING(goods_id)

/*
2021年结束，小牛店长需要对其在淘宝的网店就2021年12月下旬用户交易情况和产品情况进行分析以更好的经营小店。
现有销售数据表sales_tb如下
(goods_id 货号；sales_date 销售日期；user_id 购买用户编号；sales_num 销售数量)

商品表goods_tb如下
(goods_id 货号；goods_name 商品名称；goods_price 商品单价)

请你统计实际总销售额（结果保留三位小数）与客单价（人均付费，总收入/总用户数，结果保留三位小数），以上例子的输出结果如下：

解释：由销售数据表得到每件商品销售数量*对应商品单价得到订单金额，计算订单金额总和得到总销售额3680.000；由销售数据表得知共13名用户，由总销售额/用户数量，即客单价为3680/13=283.077(保留三位小数)
*/
