#请查询产生理赔金额的快递信息？
#对表exp_cost_tb中筛选出claims_cost的非空记录，再左连接表express_tb
#输出快递单号、快递种类、理赔费用

SELECT  ec.exp_number,
        et.exp_type,
        ec.claims_cost
FROM  exp_cost_tb AS ec
LEFT JOIN express_tb AS et USING(exp_number)
WHERE ec.claims_cost IS NOT NULL
ORDER BY ec.claims_cost DESC,ec.exp_number;

/*
某物流公司快递信息数据及快递费用数据如下：
快递信息表express_tb(exp_number-快递单号,exp_type-快递种类,out_city-快递发出城市,in_city-快递邮入城市,create_time-快递单创建时间)，如下所示：

快递费用信息表exp_cost_tb(exp_number-快递单号,transport_cost-运费,insurance_cost-运费险,claims_cost-快递损坏理赔费用)，如下所示：

问题：请查询产生理赔金额的快递信息？
要求输出：快递单号、快递种类、理赔费用（按照理赔费用降序排序）
知识点：关联查询、条件查询
示例数据结果如下：

解释：快递单号为11103、11105产生理赔费用
故结果如上
*/
