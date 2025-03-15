#请查询每天登陆最早的用户的内容喜好？
#对login_tb进行窗口函数RANK排号，找到每天第一个登录的用户
#左连接user_action_tb表，找到爱好

WITH CET1 AS(
    SELECT  user_id,
            DATE(log_time) AS log_day,
            RANK() OVER(
                PARTITION BY DATE(log_time)
                ORDER BY log_time
            ) AS r
    FROM login_tb
)

SELECT  c.log_day,
        c.user_id,
        u.hobby
FROM CET1 AS c
LEFT JOIN user_action_tb AS u USING(user_id)
WHERE c.r=1
ORDER BY c.log_day,c.user_id;

/*
描述
某产品在2022年2月6-9日用户登录信息表及用户信息和评分信息交叉表如下，
用户登录信息表login_tb(log_id-登录动作id,user_id-用户id, log_time-登录时间)，如下所示：
log_id	user_id	log_time
101	101	2022-02-06 07:24:00
102	102	2022-02-06 07:24:00
103	103	2022-02-06 09:36:00
104	102	2022-02-07 09:37:00
105	103	2022-02-07 12:01:00
106	101	2022-02-07 12:23:00
107	102	2022-02-08 08:37:00
108	103	2022-02-09 10:43:00
109	101	2022-02-09 14:56:00
用户信息及评分信息交叉表user_action_tb(user_id-用户id,hobby-喜好标签,  score-评分)，如下所示：
注：该表存储用户id及用户个人喜好内容标签，以及对平台推荐内容的评分信息
user_id	hobby	score
101	健身	88
102	影视	81
103	美妆	78
104	健身	68
105	体育	90
106	影视	56
107	体育	89
108	影视	77
问题：请查询每天登陆最早的用户的内容喜好？
注：如果当天出现多个用户同时最早登录，那么这些用户均需要输出
输出日期、用户id、用户内容喜好，结果按照日期升序排序
示例输出如下：
log_day	user_id	hobby
2022-02-06	101	健身
2022-02-06	102	影视
2022-02-07	102	影视
2022-02-08	102	影视
2022-02-09	103	美妆

解释：2022年2月6日用户101和102均在7:24登录，故在当天最早登录的用户是101和102，他们内容喜好标签分别是健身、影视。
其他结果同理
*/
