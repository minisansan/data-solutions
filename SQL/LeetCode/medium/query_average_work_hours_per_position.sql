#请统计该公司各岗位员工平均工作时长
#对表attendent_tb，计算每一行的last_clockin和first_clockin差值，利用TIMESTAMPDIFF,存成表CET1
#将表staff_tb和CET1连接,按照post聚合,求AVG

WITH CET1 AS(
    SELECT  staff_id,
            TIMESTAMPDIFF(SECOND,first_clockin,last_clockin)/3600.0 AS  difftime
    FROM  attendent_tb
)

SELECT  s.post,
        ROUND(AVG(c.difftime),3) AS work_hours 
FROM staff_tb AS s
JOIN CET1 AS c  USING(staff_id)
GROUP BY s.post
ORDER BY work_hours DESC;

/*
描述
某公司员工信息数据及单日出勤信息数据如下：
员工信息表staff_tb(staff_id-员工id,staff_name-员工姓名,staff_gender-员工性别,post-员工岗位类别,department-员工所在部门)，如下所示：
staff_id	staff_name	staff_gender	post	department
1	Angus	male	Financial	dep1
2	Cathy	female	Director	dep1
3	Aldis	female	Director	dep2
4	Lawson	male	Engineer	dep1
5	Carl	male	Engineer	dep2
6	Ben	male	Engineer	dep1
7	Rose	female	Financial	dep2
出勤信息表attendent_tb(info_id-信息id,staff_id-员工id,first_clockin-上班打卡时间,last_clockin-下班打卡时间)，如下所示：
info_id	staff_id	first_clockin	last_clockin
101	1	2022-03-22 08:00:00	2022-03-22 17:00:00
102	2	2022-03-22 08:30:00	2022-03-22 18:00:00
103	3	2022-03-22 08:45:00	2022-03-22 17:00:00
104	4	2022-03-22 09:00:00	2022-03-22 18:30:00
105	5	2022-03-22 09:00:00	2022-03-22 18:10:00
106	6	2022-03-22 09:15:00	2022-03-22 19:30:00
107	7	2022-03-22 09:30:00	2022-03-22 18:29:00
问题：请统计该公司各岗位员工平均工作时长？要求输出：员工岗位类别、平均工作时长（以小时为单位输出并保留三位小数），按照平均工作时长降序排序。
注：如员工未打卡该字段数据会存储为NULL，那么不计入在内。

示例数据结果如下：
post	work_hours
Engineer	9.639
Financial	8.992
Director	8.875
解释：Engineer类岗位有4、5、6共计3名员工，工作时长分别为：9.500、9.167、10.250，则平均工作时长为 (9.500+9.167+10.250)/3=9.639小时。
其他结果同理.....
*/
