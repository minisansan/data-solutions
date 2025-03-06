#现需要查询 Tom 这个客户在 2023 年每月的消费金额（按月份正序显示）
#首先再customer表中检索到Tom的c_id
#再trade中只需要指定的c_id，并且只需要2023年的数据
#按照月份进行聚类，利用sum求和输出月份总消费
#按照月份排序

WITH CET1 AS (
    SELECT  t_cus,
            t_time,
            t_amount
    FROM trade
    WHERE t_cus IN (SELECT c_id FROM customer WHERE c_name = 'Tom')
        AND YEAR(t_time) = 2023 AND (t_type=1 OR t_type=0)
)

SELECT  DATE_FORMAT(t_time, '%Y-%m') AS time,
        SUM(t_amount) AS total
FROM CET1
GROUP BY DATE_FORMAT(t_time, '%Y-%m')
ORDER BY DATE_FORMAT(t_time, '%Y-%m');

/*
描述
某金融公司某项目下有如下 2 张表：
交易表 trade（t_id：交易流水号，t_time：交易时间，t_cus：交易客户，t_type：交易类型【1表示消费，0表示转账】，t_amount：交易金额）:
t_id	t_time	t_cus	t_type	t_amount
1	2022-01-19 03:14:08	101	1	45.0
2	2023-02-15 11:22:11	101	1	23.6
3	2023-03-19 05:33:22	102	0	350.0
4	2023-03-21 06:44:09	103	1	16.9
5	2023-02-21 08:44:09	101	1	26.9
6	2023-07-07 07:11:45	101	1	1200.0
7	2023-07-19 06:04:32	102	1	132.5
8	2023-09-19 11:23:11	101	1	130.6
9	2023-10-19 04:32:30	103	1	110.0

客户表 customer（c_id：客户号，c_name：客户名称）:
c_id	c_name
101	Tom
102	Ross
103	Julie
104	Niki
现需要查询 Tom 这个客户在 2023 年每月的消费金额（按月份正序显示），示例如下：
time	total
2023-02	50.5
2023-07	1200.0
2023-09	130.6
请编写 SQL 语句实现上述需求。
*/
