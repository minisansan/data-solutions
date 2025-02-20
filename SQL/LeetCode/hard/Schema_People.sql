# Write your MySQL query statement below



#可以首先去掉people小于100的id行
#之后再对表按id大小排序，用id-排序的序号得到group_id
#如果是连续的，都大于100的，他们得到的group_id序号是一样的
#只要断掉一个或者不连续，他们的group_id是不一样
#按照上述，得到一个表CET1
#之后在通过这个表，在查询中聚合group_id，选择COUNT(*)>=3的输出

WITH CET1 AS(
    SELECT  *,
            (id- ROW_NUMBER() OVER(ORDER BY id)) AS group_id
    FROM Stadium
    WHERE people>=100
)

SELECT  id,
        visit_date,
        people
FROM CET1
WHERE group_id in (
    SELECT group_id
    FROM CET1
    GROUP BY group_id
    HAVING COUNT(*)>=3
)
ORDER BY visit_date


/*

表：Stadium
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| visit_date    | date    |
| people        | int     |
+---------------+---------+
visit_date 是该表中具有唯一值的列。
每日人流量信息被记录在这三列信息中：序号 (id)、日期 (visit_date)、 人流量 (people)
每天只有一行记录，日期随着 id 的增加而增加
 

编写解决方案找出每行的人数大于或等于 100 且 id 连续的三行或更多行记录。

返回按 visit_date 升序排列 的结果表。
*/
