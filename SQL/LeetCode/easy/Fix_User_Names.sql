# Write your MySQL query statement below
#将name字符串，首字母upper,剩下的lower

SELECT  user_id,
        CONCAT(UPPER(left(name,1)),LOWER(right(name,length(name)-1))) AS name
FROM Users
ORDER BY user_id;

-- 表：Users
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | name           | varchar |
-- +----------------+---------+
-- user_id 是该表的主键(具有唯一值的列)。
-- 该表包含用户的 ID 和名字。名字仅由小写和大写字符组成。

-- 编写解决方案，修复名字，使得只有第一个字符是大写的，其余都是小写的。
-- 返回按 user_id 排序的结果表。
