#首先需要将profile取出来
#使用SUBSTRING_INDEX取出我们想要的部分

WITH CET1 AS(
    SELECT SUBSTRING_INDEX(profile, ',', -1) AS gender
    FROM user_submit
)

SELECT  gender,
        COUNT(*)
FROM CET1
GROUP BY gender;

/*
描述
题目：现在运营举办了一场比赛，收到了一些参赛申请，表数据记录形式如下所示，现在运营想要统计每个性别的用户分别有多少参赛者，请取出相应结果

示例：user_submit
device_id	profile	blog_url
2138	180cm,75kg,27,male	http:/url/bigboy777
3214	165cm,45kg,26,female	http:/url/kittycc
6543	178cm,65kg,25,male	http:/url/tiger
4321	171cm,55kg,23,female	http:/url/uhksd
2131	168cm,45kg,22,female	http:/urlsydney

根据示例，你的查询应返回以下结果：
gender	number
male	2
female	3
*/
