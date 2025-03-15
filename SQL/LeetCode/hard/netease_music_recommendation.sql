#查询向user_id = 1 的用户，推荐其关注的人喜欢的音乐。不要推荐该用户已经喜欢的音乐
#首先在表follow中找出user_id = 1 喜欢的id,在表music_likes筛选出目标id喜欢的音乐id，并且要去掉和user_id=1喜欢音乐id相同的
#再联立表，选出name


WITH CET1 AS (
    SELECT music_id
    FROM music_likes
    WHERE user_id IN (
        SELECT follower_id
        FROM follow
        WHERE user_id = 1
    )
    AND music_id NOT IN (
        SELECT music_id
        FROM music_likes
        WHERE user_id = 1
    )
),
CET2 AS (
    SELECT DISTINCT m.music_name
    FROM CET1 AS c
    JOIN music AS m ON m.id = c.music_id
    ORDER BY m.music_name
)
SELECT  c.music_name
FROM CET2 AS c
JOIN music AS m USING(music_name)
ORDER BY m.id;

/*
假设云音乐数据库里面现在有几张如下简化的数据表:
关注follow表，第一列是关注人的id，第二列是被关注人的id，这2列的id组成主键
user_id	follower_id
1	2
1	4
2	3比如第一行代表着用户id为1的关注着id为2的用户

个人的喜欢的音乐music_likes表，第一列是用户id，第二列是喜欢的音乐id，这2列的id组成主键
user_id	music_id
1	17
2	18
2	19
3	20
4	17比如第一行代表着用户id为1的喜欢music_id为17的音乐

音乐music表，第一列是音乐id，第二列是音乐name，id是主键
id	music_name
17	yueyawang

