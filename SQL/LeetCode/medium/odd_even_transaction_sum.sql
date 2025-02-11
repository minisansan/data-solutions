#首先按照日期进行聚合，排序
#将奇数偶数分别用SUM求和

SELECT  transaction_date,
        SUM(CASE WHEN amount%2!=0 THEN amount ELSE 0 END) AS odd_sum,
        SUM(CASE WHEN amount%2=0 THEN amount ELSE 0 END) AS even_sum
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date;



-- 表结构：transactions
-- +------------------+------+
-- | Column Name      | Type |
-- +------------------+------+
-- | transaction_id   | int  |
-- | amount           | int  |
-- | transaction_date | date |
-- +------------------+------+
-- transaction_id 列唯一标识了表中的每一行。
-- 这张表的每一行包含交易 id，金额总和和交易日期。

-- 编写一个解决方案来查找每天 奇数 交易金额和 偶数 交易金额的 总和。如果某天没有奇数或偶数交易，显>示为 0。
-- 返回结果表以 transaction_date 升序 排序。


