# Write your MySQL query statement below
#拥有好友的个数等于请求id+接受id总共出现的次数
#首先创建临时表存储id和次数
#选取次数最大的id输出

SELECT id , COUNT(id) AS num
FROM (SELECT requester_id AS id
      FROM RequestAccepted
      UNION ALL
      SELECT accepter_id AS id
      FROM RequestAccepted) AS A
GROUP BY id
ORDER BY COUNT(id) DESC
limit 1;


-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+
-- (requester_id, accepter_id) 是这张表的主键(具有唯一值的列的组合)。
-- 这张表包含发送好友请求的人的 ID ，接收好友请求的人的 ID ，以及好友请求通过的日期。

-- 编写解决方案，找出拥有最多的好友的人和他拥有的好友数目。
-- 生成的测试用例保证拥有最多好友数目的只有 1 个人。
