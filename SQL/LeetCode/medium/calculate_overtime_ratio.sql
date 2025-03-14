#请统计该公司各部门加班员工所占比例,工作时长大于9.5小时定义为加班
#从表attendent_tb中，计算TIMESTAMPDIFF,MINUTE

WITH CET1 AS(
    SELECT  staff_id,
            TIMESTAMPDIFF(MINUTE,first_clockin,last_clockin)/60 AS diff_hour
    FROM attendent_tb
)

SELECT  s.department,
        CONCAT(ROUND(SUM(IF(c.diff_hour>9.5,1,0))/COUNT(*)*100,1),"%") AS ratio
FROM CET1 AS c
JOIN staff_tb AS s USING(staff_id)
GROUP BY s.department
ORDER BY ratio DESC,s.department;

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
107	7	2022-03-22 09:30:00	
2022-03-22 18:29:00

问题：请统计该公司各部门加班员工所占比例？
注：工作时长大于9.5小时定义为加班
要求输出：部门（department）、加班员工占比（ratio，以百分数形式输出并保留1位小数），查询结果按照加班员工占比降序排序；
示例数据结果如下：
department	ratio
dep1	25.0%
dep2	0.0%
解释：dep1部门共有4名员工，其中仅有员工6(Ben)在该日加班，所以结果为1/4=25.0%
其他结果同理.....
*/


