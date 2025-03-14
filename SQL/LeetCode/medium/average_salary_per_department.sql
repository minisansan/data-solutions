#请统计各个部门平均实发薪资
#对salary_tb求真实salary
#连接表，按部门求avg

WITH CET1 AS(
    SELECT  staff_id,
            (normal_salary-dock_salary) AS ac_salary
    FROM  salary_tb
    WHERE (normal_salary-dock_salary) BETWEEN 4000 AND 30000
)
SELECT  st.department,
        ROUND(AVG(sa.ac_salary),3) AS avg_salary
FROM CET1 AS sa
LEFT JOIN staff_tb AS st USING(staff_id)
GROUP BY st.department
ORDER BY avg_salary DESC,st.department;


/*
描述
某公司员工信息数据及员工薪资信息数据如下：
员工信息表staff_tb(staff_id-员工id，staff_name-员工姓名，staff_gender-员工性别，post-员工岗位类别，department-员工所在部门)，如下所示：
staff_id	staff_name	staff_gender	post	department
1	Angus	male	Financial	dep1
2	Cathy	female	Director	dep1
3	Aldis	female	Director	dep2
4	Lawson	male	Engineer	dep1
5	Carl	male	Engineer	dep2
6	Ben	male	Engineer	dep1
7	Rose	female	Financial	dep2
员工薪资信息表salary_tb(salary_id-薪资信息id，taff_id-员工id，normal_salary-标准薪资，dock_salary-扣除薪资)，如下所示：
salary_id	staff_id	normal_salary	dock_salary
10	1	12000	2500
11	2	11000	2200
12	3	9000	1800
13	4	10500	1900
14	5	13500	2100
15	6	7500	1000
16	7	50000	5000
问题：请统计各个部门平均实发薪资？
注：实发薪资=标准薪资-扣除薪资，统计平均薪资要求剔除薪资小于4000和大于30000的员工
要求输出：部门，平均实发薪资（保留3位小数）按照平均实发薪资降序排序
示例数据结果如下：
department	avg_salary
dep2	9300.000
dep1	8350.000
解释：部门dep2共有员工3、5、7
实发薪资分别为9000-1800=7200、13500-2100=11400、50000-5000=45000>30000(剔除)
故结果为(7200+11400)/2=9300.000;
其他结果同理。
*/
