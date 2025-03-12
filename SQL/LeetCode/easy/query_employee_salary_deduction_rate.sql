#请统计部门 dep1 扣除薪资比例
#对表staff_tb进行筛选，只留下dep1的员工
#表salary_tb从上面的条件筛选出合适的员工记录
#利用dock_salary/normal_salary即可

SELECT  a.staff_id,
        b.staff_name,
        CONCAT(ROUND(a.dock_salary/a.normal_salary*100,1),"%") AS dock_ratio
FROM salary_tb AS a
JOIN staff_tb AS b USING(staff_id)
WHERE  b.department='dep1'
ORDER BY dock_ratio DESC,b.staff_id;

/*
描述
某公司员工信息数据及员工薪资信息数据如下：
员工信息表 staff_tb（staff_id-员工id，staff_name-员工姓名，staff_gender-员工性别，post-员工岗位类别，department-员工所在部门），如下所示：
staff_id	staff_name	staff_gender	post	department
1	Angus	male	Financial	dep1
2	Cathy	female	Director	dep1
3	Aldis	female	Director	dep2
4	Lawson	male	Engineer	dep1
5	Carl	male	Engineer	dep2
6	Ben	male	Engineer	dep1
7	Rose	female	Financial	dep2
员工薪资信息表 salary_tb（salary_id-薪资信息id，staff_id-员工id，normal_salary-标准薪资，dock_salary-扣除薪资），如下所示：
salary_id	staff_id	normal_salary	dock_salary
10	1	12000	2500
11	2	11000	2200
12	3	9000	1800
13	4	10500	1900
14	5	13500	2100
15	6	7500	1000
16	7	50000	5000
问题：请统计部门 dep1 扣除薪资比例。
要求输出：员工id、姓名、扣除薪资占比（保留1位小数以百分数形式输出）按照扣除薪资占比降序排序
知识点：关联查询、子查询、聚合函数、字符串函数
示例数据结果如下：
staff_id	staff_name	dock_ratio
1	Angus	20.8%
2	Cathy	20.0%
4	Lawson	18.1%
6	Ben	13.3%

解释：部门dep1共有员工1、2、4、6
其中员工1标准薪资为12000，扣除薪资为2500，故扣除薪资比例为2500/12000=20.8%
其他结果同理。
*/
