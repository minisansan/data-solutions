
#首先要按照学生和科目聚合，找到COUNT()>1的，作为CET1表
#并且返回学生id同学科同第一个和最后一个，作为CET2
#在CET2中可以按照ROW_NUMBER窗口函数排序，去找到最后一个和第一个
#之后将表按照日期从小到大排序，按照后值函数没生成pre_score,作为表CET3
#之后再通过成绩比较

WITH CET1 AS(
    SELECT  student_id,
            subject
    FROM Scores
    GROUP BY student_id,subject
    HAVING COUNT(*)>1
),
CET2 AS(
    SELECT  *,
            ROW_NUMBER() OVER (
                PARTITION BY student_id, subject
                ORDER BY exam_date
            ) AS first_date,
            ROW_NUMBER() OVER (
                PARTITION BY student_id, subject
                ORDER BY exam_date DESC
            ) AS latest_date
    FROM Scores
),

CET3 AS(
    SELECT  *,
            LAG(score,1) OVER(
                PARTITION BY student_id,subject
                ORDER BY exam_date
            ) AS pre_score
    FROM CET2
    WHERE (student_id,subject) IN (SELECT * FROM CET1) 
          AND (first_date = 1 OR latest_date = 1)
)

SELECT  student_id,
        subject,
        pre_score AS first_score,
        score AS latest_score
FROM CET3
WHERE pre_score IS NOT NULL AND pre_score < score
ORDER BY student_id, subject, exam_date;

/*
表：Scores

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student_id  | int     |
| subject     | varchar |
| score       | int     |
| exam_date   | varchar |
+-------------+---------+
(student_id, subject, exam_date) 是这张表的主键。
每一行包含有关学生在特定考试日期特定科目成绩的信息。分数范围从 0 到 100（包括边界）。
编写一个解决方案来查找 进步的学生。如果 同时 满足以下两个条件，则该学生被认为是进步的：

在 同一科目 至少参加过两个不同日期的考试。
他们在该学科 最近的分数 比他们 第一次该学科考试的分数更高。
返回结果表以 student_id，subject 升序 排序。
*/
