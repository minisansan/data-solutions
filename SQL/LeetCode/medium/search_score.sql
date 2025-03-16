#查询出语文，数学，英语3科的平均成绩大于60分的学生人数
#对表SC，对sId聚合，选出COUNT=3的，再选出avg>60的
#最后对该表求COUNT

WITH CET1 AS(
    SELECT  sId           
    FROM SC
    GROUP BY sId
    HAVING COUNT(*)=3 AND AVG(score)>60
)

SELECT count(*)
FROM CET1;

/*
描述
有以下3张表分别是学生表Student，成绩表SC，课程表Course，查询出语文，数学，英语3科的平均成绩大于60分的学生人数。
学生表Student：
sId (学生编号)	sname (学生姓名)	sage (学生年龄)	ssex (学生性别)
1	张三	14	男
2	李四	15	男
3	王五	13	女
4	小红	14	女
5	王明	16	男
成绩表SC：
sId (学生编号)	cId (课程编号)	score (分数)
1	1	80
1	2	88
1	3	90
2	1	60
2	2	58
2	3	61
3	1	70
3	2	77
3	3	89
4	1	88
4	2	75
4	3	67
5	1	90
5	2	78
5	3	87课程表Course：
cId (课程编号)	cname (课程名称)
1	语文
2	数学
3	英语

输出示例（表格模式）
count(*)
3
*/
