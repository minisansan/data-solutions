#找到第一天都上线的人数，也就是对device_id求COUNT DISTINCT
#再找到两天都上线的人
#需要把这个表进行内连接,再筛选出同一行两个日期相差一天的，并且前一个小于后一个

WITH CET1 AS(
    SELECT COUNT(DISTINCT device_id,date) AS c
    FROM question_practice_detail
),
CET2 AS(
    SELECT DISTINCT q1.device_id, q1.date AS date1, q2.date AS date2
    FROM question_practice_detail AS q1
    INNER JOIN question_practice_detail AS q2
    ON q1.device_id = q2.device_id
    WHERE q2.date = DATE_ADD(q1.date, INTERVAL 1 DAY)
      AND q1.date < q2.date
)

SELECT ROUND((SELECT COUNT(*) FROM CET2) * 1.0 / (SELECT c FROM CET1),4)AS avg_ret


/*
描述
题目：现在运营想要查看用户在某天刷题后第二天还会再来刷题的留存率。请你取出相应数据。

示例：question_practice_detail
id	device_id	question_id	result	date
1	2138	111	wrong	2021-05-03
2	3214	112	wrong	2021-05-09
3	3214	113	wrong	2021-06-15
4	6543	111	right	2021-08-13
5	2315	115	right	2021-08-13
6	2315	116	right	2021-08-14
7	2315	117	wrong	2021-08-15
8	3214	112	wrong	2021-05-09
9	3214	113	wrong	2021-08-15
10	6543	111	right	2021-08-13
11	2315	115	right	2021-08-13
12	2315	116	right	2021-08-14
13	2315	117	wrong	2021-08-15
14	3214	112	wrong	2021-08-16
15	3214	113	wrong	2021-08-18
16	6543	111	right	2021-08-13

根据示例，你的查询应返回以下结果：
avg_ret
0.3000
*/
