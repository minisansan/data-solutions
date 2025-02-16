# Write your MySQL query statement below

SELECT  user_id,
        COUNT(user_id) AS followers_count
FROM  Followers
GROUP BY user_id
ORDER BY user_id


-- 输入表：Followers(user_id, follower_id)
-- 输出表：包含每个用户的 user_id 和其关注者数量 follower_count
-- 输出格式：按 user_id 升序排列

-- 表结构：
-- Followers(user_id, follower_id)
-- (user_id, follower_id) 是主键，表示每个关注关系是唯一的。
-- user_id：被关注用户的ID
-- follower_id：关注者的ID

-- 查询逻辑：
-- 1. 使用 GROUP BY 对每个 user_id 进行分组。
-- 2. 使用 COUNT(follower_id) 计算每个用户的关注者数量。
-- 3. 按 user_id 升序排列结果。

