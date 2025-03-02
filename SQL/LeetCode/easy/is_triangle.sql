# Write your MySQL query statement below
#可以用case when来解决

SELECT  *,
        CASE WHEN x+y>z AND z+x>y AND z+y>x THEN 'Yes'
        ELSE 'No'
        END AS triangle
FROM Triangle 

/*
表: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
在 SQL 中，(x, y, z)是该表的主键列。
该表的每一行包含三个线段的长度。
 

对每三个线段报告它们是否可以形成一个三角形。

以 任意顺序 返回结果表。
*/
