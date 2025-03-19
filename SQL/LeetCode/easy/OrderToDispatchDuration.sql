#请统计从快递单创建到快递邮出的平均间隔时间
#连接两张白表，计算时间差，最后统计平均
#平均间隔了多少分钟，最后结果转化成小时，同时保留3位小数

SELECT  ROUND(AVG(TIMESTAMPDIFF(MINUTE,ep.create_time,ea.out_time)/60),3) AS time
FROM express_tb AS ep
JOIN exp_action_tb AS ea USING(exp_number);

/*
描述
某物流公司快递信息数据及运输动作信息数据如下：
快递信息表express_tb(exp_number-快递单号,exp_type-快递种类,out_city-快递发出城市,in_city-快递邮入城市,create_time-快递单创建时间)，如下所示：

快递运输动作表exp_action_tb(exp_number-快递单号,transport_type-运输类型,out_time-快递发出时间,in_time-快递到达时间)，如下所示：

问题：请统计从快递单创建到快递邮出的平均间隔时间?
要求输出：平均间隔了多少分钟，最后结果转化成小时，同时保留3位小数
示例数据结果如下：

解释：快递单号11101创建时间为2022-05-02 09:00:00，发出时间为：2022-05-03 09:00:00，则间隔时长为24.000小时；
其他快递单同理，则平均间隔时长为24.981小时
*/
