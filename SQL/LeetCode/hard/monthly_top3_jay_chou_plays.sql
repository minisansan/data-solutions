#首先要对用户表进行检索，找到符合条件的user_id
#利用符合条件的id，进行对play_log表进行找到符合条件的
#在按照月份聚类和歌曲id聚类，求出每首歌的COUNT
#对COUNT进行ROW_NUMBER排序，选择小于等于3的
#最后联合歌曲姓名表输出

WITH filtered_users AS (
    SELECT user_id
    FROM user_info
    WHERE age BETWEEN 18 AND 25
),
play_counts AS (
    SELECT 
        MONTH(p.fdate) AS month,
        p.song_id,
        COUNT(*) AS play_pv,
        s.song_name
    FROM play_log AS p
    JOIN song_info AS s
    ON p.song_id = s.song_id
    WHERE p.user_id IN (SELECT user_id FROM filtered_users)
      AND s.singer_name = '周杰伦'  
      AND YEAR(p.fdate) = 2022
    GROUP BY MONTH(p.fdate), p.song_id, s.song_name
),
ranked_songs AS (
    SELECT
        month,
        song_id,
        song_name,
        play_pv,
        ROW_NUMBER() OVER (
            PARTITION BY month
            ORDER BY play_pv DESC,song_id
        ) AS ranking
    FROM play_counts
)
SELECT
    month,
    ranking,
    song_name,
    play_pv
FROM ranked_songs
WHERE ranking <= 3
ORDER BY month, ranking;

/*
描述
从听歌流水中找到18-25岁用户在2022年每个月播放次数top 3的周杰伦的歌曲。

流水表 play_log:
日期 (fdate)	用户 ID (user_id)	歌曲 ID (song_id)
2022-01-08	10000	0
2022-01-16	10000	0
2022-01-20	10000	0
2022-01-25	10000	0
2022-01-02	10000	1
2022-01-12	10000	1
2022-01-13	10000	1
2022-01-14	10000	1
2022-01-10	10000	2
2022-01-11	10000	3
2022-01-16	10000	3
2022-01-11	10000	4
2022-01-27	10000	4
2022-02-05	10000	0
2022-02-19	10000	0
2022-02-07	10000	1
2022-02-27	10000	2
2022-02-25	10000	3
2022-02-03	10000	4
2022-02-16	10000	4
歌曲表song_info：
歌曲 ID (song_id)	歌曲名称 (song_name)	歌手名称 (singer_name)
0	明明就	周杰伦
1	说好的幸福呢	周杰伦
2	江南	林俊杰
3	大笨钟	周杰伦
4	黑键	林俊杰
用户表user_info：
user_id	age
10000	18
输出：
month	ranking	song_name	play_pv
1	1	明明就	4
1	2	说好的幸福呢	4
1	3	大笨钟	2
2	1	明明就	2
2	2	说好的幸福呢	1
2	3	大笨钟	1
*/
