# Write your MySQL query statement below
#找出没有任何与名为 “RED” 的公司相关的订单的所有销售人员的姓名
#首先从Company得到RED的com_id号
#再从Orders表中，找到com_id等于上面表找到的com_id的行，得到sales_id
#再从SalesPerson表中看

WITH A AS(
    SELECT sales_id
    FROM  Orders 
    WHERE com_id IN (
        SELECT com_id
        FROM Company
        WHERE name='RED'
    )
)

SELECT  name
FROM  SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM A
)

/*
表: SalesPerson

+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |
+-----------------+---------+
sales_id 是该表的主键列(具有唯一值的列)。
该表的每一行都显示了销售人员的姓名和 ID ，以及他们的工资、佣金率和雇佣日期。
 

表: Company

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| com_id      | int     |
| name        | varchar |
| city        | varchar |
+-------------+---------+
com_id 是该表的主键列(具有唯一值的列)。
该表的每一行都表示公司的名称和 ID ，以及公司所在的城市。
 

表: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |
+-------------+------+
order_id 是该表的主键列(具有唯一值的列)。
com_id 是 Company 表中 com_id 的外键（reference 列）。
sales_id 是来自销售员表 sales_id 的外键（reference 列）。
该表的每一行包含一个订单的信息。这包括公司的 ID 、销售人员的 ID 、订单日期和支付的金额。
 

编写解决方案，找出没有任何与名为 “RED” 的公司相关的订单的所有销售人员的姓名。

以 任意顺序 返回结果表。
*/
