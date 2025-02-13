# Write your MySQL query statement below
#首先对学号和学科一起进行聚合，判断是否为2
#如果为2，将成绩按照时间进行正序（1为远，2为进）利用窗口函数的ROW_NUMBER()
#排序后，利用CASE，将序号为1的为MIN,2的为MAX
#之后进行判断MIN是否小于MAX
#最后按照要求排序输出
WITH A AS (
    SELECT  *,
        ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS num
    FROM Scores
    ORDER BY student_id,subject
),
B AS (
    SELECT  student_id,
            subject,
            MAX(CASE WHEN num = 1 THEN score END) AS first_score,
            MAX(CASE WHEN num = 2 THEN score END) AS latest_score
    FROM A
    GROUP BY student_id,subject
)

SELECT *
FROM B
WHERE first_score<latest_score;


-- 表：Scores
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student_id  | int     |
-- | subject     | varchar |
-- | score       | int     |
-- | exam_date   | varchar |
-- +-------------+---------+
-- (student_id, subject, exam_date) 是这张表的主键。
-- 每一行包含有关学生在特定考试日期特定科目成绩的信息。分数范围从 0 到 100（包括边界）。

-- 编写一个解决方案来查找进步的学生。如果同时满足以下两个条件，则该学生被认为是进步的：
-- 1. 在同一科目至少参加过两个不同日期的考试。
-- 2. 他们在该学科最近的分数比他们第一次该学科考试的分数更高。
-- 返回结果表以 student_id，subject 升序排序。
