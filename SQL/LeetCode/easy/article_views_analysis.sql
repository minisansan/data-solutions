# Write your MySQL query statement below

#也就是找到suthor_id,viewer_id相同的，按照id升序排序 

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id=viewer_id
ORDER BY author_id;

/*
SQL Schema
Pandas Schema
Views 表：

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
此表可能会存在重复行。（换句话说，在 SQL 中这个表没有主键）
此表的每一行都表示某人在某天浏览了某位作者的某篇文章。
请注意，同一人的 author_id 和 viewer_id 是相同的。
 

请查询出所有浏览过自己文章的作者

结果按照 id 升序排列。
*/
