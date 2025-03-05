# Write your MySQL query statement below
#资本利得/损失
#首先按照不同的stock_name和operation进行聚合，计算买和卖分别多少钱
#返回一张表
#再让卖-买最后得出结果

WITH CET1 AS(
    SELECT  stock_name,
            SUM(IF(operation='Buy',price,0)) AS 'buy_price',
            SUM(IF(operation='Sell',price,0)) AS 'sell_price'
    FROM Stocks
    GROUP BY stock_name
)
SELECT  stock_name,
        (sell_price-buy_price) AS capital_gain_loss
FROM CET1

/*
Stocks 表：

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| stock_name    | varchar |
| operation     | enum    |
| operation_day | int     |
| price         | int     |
+---------------+---------+
(stock_name, operation_day) 是这张表的主键(具有唯一值的列的组合)
operation 列使用的是一种枚举类型，包括：('Sell','Buy')
此表的每一行代表了名为 stock_name 的某支股票在 operation_day 这一天的操作价格。
此表可以保证，股票的每个“卖出”操作在前某一天都有相应的“买入”操作。并且，股票的每个“买入”操作在即将到来的某一天都有相应的“卖出”操作。
 

编写解决方案报告每只股票的 资本损益。

股票的 资本利得/损失 是指一次或多次买卖该股票后的总收益或损失。

以 任意顺序 返回结果表。
*/
