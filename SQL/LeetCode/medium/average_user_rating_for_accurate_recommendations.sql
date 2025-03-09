#请统计推荐内容准确的用户平均评分？(结果保留3位小数)
#将表recommend_tb左连接user_action_tb，连接条件为rec_info_l=hobby_l AND user_id=rec_user
#将非空的score加起来，并处理非空个数

SELECT  ROUND(AVG(u.score),3) AS avg_score
FROM (SELECT DISTINCT rec_info_l,rec_user 
    FROM recommend_tb ) AS r
LEFT JOIN user_action_tb AS u
ON r.rec_info_l=u.hobby_l AND u.user_id=r.rec_user

/*
描述
某产品2022年2月8日系统推荐内容给部分用户的数据，以及用户信息和对推荐内容的评分交叉表部分数据如下：
推荐内容表recommend_tb（rec_id-推荐信息id，rec_info_l-推荐信息标签，rec_user-推荐目标用户id，rec_time-推荐时间），如下所示：
rec_id	rec_info_l	rec_user	rec_time
1	健身	101	2022-02-08 07:23:15
2	美妆	102	2022-02-08 07:24:15
3	体育	103	2022-02-08 07:25:15
4	美妆	103	2022-02-08 07:26:15
5	政要	104	2022-02-08 07:27:15
6	体育	104	2022-02-08 07:28:15
7	体育	105	2022-02-08 07:29:15
8	影视	106	2022-02-08 07:30:15
用户信息及评分交叉表user_action_tb（user_id-用户id，hobby_l-用户喜好标签，score-综合评分），如下所示：
注：该表score为对所有推荐给该用户的内容的综合评分，在计算用户平均评分切勿将推荐次数作为分母
user_id	hobby_l	scor
101	健身	88
102	影视	81
103	美妆	78
104	健身	68
105	体育	90
106	影视	82

问题：请统计推荐内容准确的用户平均评分？(结果保留3位小数)
注：（1）准确的定义：推荐的内容标签与用户喜好标签一致；如推荐多次给同一用户，有一次及以上准确就归为准确。
示例数据结果如下：
avg_score
84.500
解释：一共推荐8条内容，其中推荐给101、103、105、106四位用户的内容准确,
四位用户的评分分别是88、78、90、82，故平均评分=（88+78+90+82）/4=84.500
(2)如果同一用户推荐同一个内容标签的话，计算的时候只算一次。
*/
