#请统计每种快递种类平均运输时长
#对表exp_action_tb进行计算运输时间，按小时
#左连接表express_tb表，按照exp_type聚合求平均

WITH CET1 AS(
    SELECT  exp_number,
            TIMESTAMPDIFF(SECOND,out_time,in_time)/3600 AS time_diff
    FROM exp_action_tb
)

SELECT  e.exp_type,
        ROUND(AVG(c.time_diff),1) AS time
FROM CET1 AS c
LEFT JOIN express_tb AS e  USING(exp_number)
GROUP BY e.exp_type
ORDER BY time,exp_type;

/*
某物流公司快递信息数据及运输动作信息数据如下：
快递信息表express_tb(exp_number-快递单号,exp_type-快递种类,out_city-快递发出城市,in_city-快递邮入城市,create_time-快递单创建时间)，如下所示：

快递运输动作表exp_action_tb(exp_number-快递单号,transport_type-运输类型,out_time-快递发出时间,in_time-快递到达时间)，如下所示：

问题：请统计每种快递种类平均运输时长?
要求输出：快递种类、平均运输时长（单位：小时，保留1位小数），根据输出时长从小到大排序
知识点：关联查询、分组查询、聚合函数、时间函数
示例数据结果如下

解释：快递种类为C&A的单号有11102：发出时间为2022-05-03 09:00:00，邮入时间为：2022-05-06 09:00:00，则间隔时长为72.0小时；
11106：发出时间为2022-05-03 09:00:00，邮入时间为：2022-05-06 16:00:00，则间隔时长为79.0小时；
则快递种类为C&A的平均运输时长为：75.5小时
其他快递种类同理
*/
