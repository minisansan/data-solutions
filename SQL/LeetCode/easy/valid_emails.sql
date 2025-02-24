# Write your MySQL query statement below
#使用正则表达式REGEXP
#@符号前面只包含数字和下划线：^[A-Za-z0-9_]+
#@符号后面与.com 前面的部分包含只有字母的域名：@[a-zA-Z]+\\.com

SELECT  user_id,
        email
FROM Users
WHERE email REGEXP '^[A-Za-z0-9_]+@[a-zA-Z]+\\.com'
ORDER BY user_id

/*
表：Users

+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| user_id         | int     |
| email           | varchar |
+-----------------+---------+
(user_id) 是这张表的唯一主键。
每一行包含用户的唯一 ID 和邮箱地址。
编写一个解决方案来查找所有 合法邮箱地址。一个合法的邮箱地址符合下述条件：

只包含一个 @ 符号。
以 .com 结尾。
@ 符号前面的部分只包含 字母数字 字符和 下划线。
@ 符号后面与 .com 前面的部分 包含 只有字母 的域名。
返回结果表以 user_id 升序 排序。
*/
