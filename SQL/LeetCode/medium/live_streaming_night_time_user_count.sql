#请你统计晚上11-12点之间各直播间的在线人数(包含边界值11:00、12:00)，并按在线人数降序排序
#表user_view_tb，筛选开始小于等于11点和结束时间大于等于11点
#或者开始时间大于11点小于等于12点

SELECT  u.room_id,
        r.room_name,
        COUNT(DISTINCT user_id) AS user_count
FROM user_view_tb AS u
LEFT JOIN room_info_tb AS r ON u.room_id = r.room_id
WHERE u.out_time >= '23:00:00'
GROUP BY u.room_id, r.room_name
ORDER BY user_count DESC,u.room_id;
/*
描述
现有某天短视频直播间用户观看直播间的信息表user_view_tb如下，
（其中字段包含用户id：user_id、直播间id：room_id、  进入时间：in_time，离开时间：out_time）
user_id	room_id	in_time	out_time
1	1001	10:00:00	10:30:00
2	1001	10:01:00	10:05:00
3	1001	10:05:00	10:20:00
1	1002	19:05:00	20:05:00
2	1002	19:15:00	19:55:00
2	1002	20:15:00	20:45:00
3	1002	20:15:00	20:45:00
4	1003	22:15:00	23:15:00
1	1002	23:15:00	23:45:00
4	1002	23:10:00	23:25:00
3	1002	23:00:00	23:35:00
4	1001	23:10:00	23:25:00
3	1001	23:00:00	23:35:00
4	1003	23:10:00	23:15:00
1	1001	20:10:00	20:15:00
1	1001	20:00:00	23:35:00
有直播间信息表room_info_tb如下：
room_id	room_name	room_type
1001	娱乐大王牌	娱乐
1002	声家班	搞笑
1003	嗨嗨嗨	搞笑
请你统计晚上11-12点之间各直播间的在线人数(包含边界值11:00、12:00)，并按在线人数降序排序，以上例子输出结果如下：
room_id	room_name	user_count
1001	娱乐大王牌	3
1002	声家班	3
1003	嗨嗨嗨	1
*/
