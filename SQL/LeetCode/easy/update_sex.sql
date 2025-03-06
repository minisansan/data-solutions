# Write your MySQL query statement below
#对字符串“fm”
#如果sex是f，用“”替换掉fm里面的sex即f，得到m
UPDATE salary
SET sex=REPLACE('fm',sex,'')

/*
Salary 表：

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
| sex         | ENUM     |
| salary      | int      |
+-------------+----------+
id 是这个表的主键（具有唯一值的列）。
sex 这一列的值是 ENUM 类型，只能从 ('m', 'f') 中取。
本表包含公司雇员的信息。
 

请你编写一个解决方案来交换所有的 'f' 和 'm' （即，将所有 'f' 变为 'm' ，反之亦然），仅使用 单个 update 语句 ，且不产生中间临时表。

注意，你必须仅使用一条 update 语句，且 不能 使用 select 语句。
*/
