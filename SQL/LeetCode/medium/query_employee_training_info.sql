#同样通过REPLACE把课程三替换成‘’，计算LENGTH差来判断是否有course3

WITH CET1 AS(
    SELECT  staff_id,
            (LENGTH(course)-LENGTH(REPLACE(course,'course3',''))) AS num
    FROM   cultivate_tb
    WHERE course IS NOT NULL
)

SELECT  s.staff_id,
        s.staff_name
FROM (SELECT staff_id FROM CET1 WHERE num>0) AS a
JOIN staff_tb AS s USING(staff_id)
ORDER BY staff_id;

/*
描述
某公司员工信息数据及员工培训信息数据如下：
员工信息表staff_tb(staff_id-员工id，staff_name-员工姓名，staff_gender-员工性别，post-员工岗位类别，department-员工所在部门)，如下所示：
staff_id	staff_name	staff_gender	post	department
1	Angus	male	Financial	dep1
2	Cathy	female	Director	dep1
3	Aldis	female	Director	dep2
4	Lawson	male	Engineer	dep1
5	Carl	male	Engineer	dep2
6	Ben	male	Engineer	dep1
7	Rose	female	Financial	dep2
员工培训信息表cultivate_tb(info_id-信息id，staff_id-员工id，course-培训课程)，如下所示：
注：该公司共开设了三门课程，员工可自愿原则性培训0-3项；
info_id	staff_id	course
101	1	course1, course2
102	2	course2
103	3	course1, course3
104	4	course1, course2, course3
105	5	course3
106	6	NULL
107	7	course1, course2
问题：请查询培训课程course3的员工信息？
注：只要培训的课程中包含course3课程就计入结果
要求输出：员工id、姓名，按照员工id升序排序；
示例数据结果如下：
staff_id	staff_name
3	Aldis
4	Lawson
5	Carl
解释：有员工3、4、5培训了course3课程，故结果如上

*/
