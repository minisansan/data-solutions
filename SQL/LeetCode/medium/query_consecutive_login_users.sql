#请查询连续登陆不少于3天的新注册用户
#对表login_tb，分user_id对log_time进行从小到大排序，利用登录时间和排序序号作差，求出一个新的列存
#对login_tb聚合，求出MAX最大的出现次数相同的，再进行筛选

WITH CET1 AS(
    SELECT  user_id,
            log_time,
            DATE_SUB(DATE(log_time), INTERVAL DENSE_RANK() OVER (
                PARTITION BY user_id 
                ORDER BY log_time
            ) DAY) AS day_diff
    FROM login_tb
),
CET2 AS(
    SELECT  user_id,
            day_diff,
            COUNT(*) AS rankd
    FROM CET1
    GROUP BY user_id, day_diff
    HAVING COUNT(*)>=3
)



SELECT user_id
FROM CET2
WHERE user_id IN (SELECT user_id FROM register_tb)
ORDER BY user_id

/*
描述
某产品在2022年2月8日各端口用户注册信息及后几日登录信息如下：

用户注册信息表register_tb(user_id-用户id, reg_time-注册时间, reg_port-注册端口)
user_id	reg_time	reg_port
1101	2022-02-08 07:23:15	pc
1102	2022-02-08 09:12:22	app
1103	2022-02-08 09:35:45	m
1104	2022-02-08 09:41:01	app
1105	2022-02-08 12:01:01	app
1106	2022-02-08 17:22:13	app
1107	2022-02-08 18:26:21	pc
1108	2022-02-08 19:16:21	pc
1109	2022-02-08 19:56:21	pc

用户登录信息表login_tb(log_id-登录动作id,user_id-用户id, log_time-登录时间,  log_port-登录端口)
log_id	user_id	log_time	log_port
101	1101	2022-02-09 07:24:15	pc
102	1102	2022-02-09 09:12:57	app
103	1003	2022-02-09 09:36:11	m
104	1102	2022-02-10 09:37:01	app
105	1104	2022-02-10 12:01:46	app
106	1106	2022-02-10 10:23:01	app
107	1003	2022-02-10 10:43:01	m
108	1102	2022-02-11 11:56:47	app
109	1104	2022-02-11 14:52:37	app
1010	1106	2022-02-11 16:56:27	app
1011	1003	2022-02-11 17:43:01	m
1012	1106	2022-02-12 10:56:17	app

问题：请查询连续登陆不少于3天的新注册用户？要求：输出user_id并升序排序。
注：登录表为单日随机一次登录数据，该题忽略单日多次登录情况。

示例输出如下：
user_id
1102
1106
解释：1102在9日、10日、11日，登陆了系统满足查询条件；1106在10日、11日、12日登录了系统满足查询条件。
*/
