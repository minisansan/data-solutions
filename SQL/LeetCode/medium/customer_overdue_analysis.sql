#首先将loan_tb和customer_tb连接
#之后按照pay_ability进行聚类
#利用ROUND保留1位小数，用COUNT求总和，用SUM求逾期客户的总数
#再利用CONCAT加上%

WITH CET1 AS(
    SELECT  l.overdue_days,
            c.pay_ability
    FROM  loan_tb AS l
    JOIN customer_tb AS c USING(customer_id)
)


SELECT  pay_ability,
        CONCAT(ROUND(SUM(IF(overdue_days IS NOT NULL,1,0))/COUNT(*)*100,1),'%') AS overdue_ratio
FROM CET1
GROUP BY pay_ability
ORDER BY overdue_ratio DESC;

/*
描述
有贷款信息表：loan_tb（agreement_id：合同id，customer_id：客户id，loan_amount：贷款金额，pay_amount：已还金额，overdue_days：逾期天数）
agreement_id	customer_id	loan_amount	pay_amount	overdue_days
10111	1111	20000	18000	NULL
10112	1112	10000	10000	NULL
10113	1113	15000	10000	38
10114	1114	50000	30000	NULL
10115	1115	60000	50000	NULL
10116	1116	10000	8000	NULL
10117	1117	50000	50000	NULL
10118	1118	25000	10000	5
10119	1119	20000	1000	106

客户信息表：customer_tb（customer_id：客户id，customer_age：客户年龄，pay_ability：还款能力级别）
customer_id	customer_age	pay_ability
1111	28	B
1112	38	A
1113	20	C
1114	30	A
1115	29	B
1116	21	C
1117	35	B
1118	36	B
1119	25	C
请根据以上数据分析各还款能力级别的客户逾期情况，按照还款能力级别统计有逾期行为客户占比。要求输出还款能力级别、逾期客户占比。
注：逾期客户占比要求按照百分数形式输出并四舍五入保留 1 位小数，最终结果按照占比降序排序。

示例数据结果如下：
pay_ability	overdue_ratio
C	66.7%
B	25.0%
A	0.0%
结果解释：
还款能力级别为 C 的客户有1113、1116、1119，其中有逾期行为的客户为 1113、1119，故结果为 2/3=66.7%；其他结果同理。
*/
