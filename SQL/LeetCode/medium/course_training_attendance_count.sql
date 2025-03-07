#首先去掉course为NULL的行，方便后续统计
#之后对course里面的,进行检索，看看有几个，所学的课程就在，上面+1
#对,的判断：可以用原本长度-用''替换，之后的长度  LENGTH() REPLACE
WITH CET1 AS(
    SELECT  *,
            (LENGTH(course)-LENGTH(REPLACE(course,',',''))+1) AS num
    FROM cultivate_tb
    WHERE course IS NOT NULL 
)

SELECT SUM(num) AS staff_nums
FROM CET1;

/*
描述
某公司员工培训信息数据如下：
员工培训信息表cultivate_tb(info_id-信息id,staff_id-员工id,course-培训课程)，如下所示：
注：该公司共开设了三门课程，员工可自愿原则性培训0-3项，每项课程每人可培训1次。
info_id	staff_id	course
101	1	course1,course2
102	2	course2
103	3	course1,course3
104	4	course1, course2, course3
105	5	course3
106	6	NULL
107	7	course1, course2
问题：请统计该公司所有课程参加培训人次？
示例数据结果如下：
staff_nums
11
解释：course1课程共有员工1、3、4、7共4名员工培训；
course2课程共有员工1、2、4、7共4名员工培训；
course3课程共有员工3、4、5共3名员工培训。
*/`
