#LeetCode 570 至少有5名直接下属的经理 
#首先进行group by操作，找到符合有五个下属经理的信息 ，生成临时表格
#将生成的临时表格和原表格进行内连接，然后在进行输出name
SELECT e2.name
FROM (
    SELECT managerId
    FROM Employee
    WHERE managerId is not NULL
    GROUP BY managerId
    HAVING count(*)>=5
) AS e1
JOIN Employee AS e2
ON e1.managerId =  e2.id;


/*
 * 题目：找出至少有五个直接下属的经理
 *
 * 表: Employee
 * +-------------+---------+
 * | Column Name | Type    |
 * +-------------+---------+
 * | id          | int     |   -- 员工ID，主键
 * | name        | varchar |   -- 员工姓名
 * | department  | varchar |   -- 部门
 * | managerId   | int     |   -- 经理ID
 * +-------------+---------+
 *
 * 说明：
 * 1. id 是此表的主键（具有唯一值的列）。
 * 2. 每一行表示雇员的名字、他们的部门和他们的经理的id。
 * 3. 如果 managerId 为空，则该员工没有经理。
 * 4. 没有员工会成为自己的管理者。
 * 找出至少有五个直接下属的经理。
 * 以任意顺序返回结果表。
 */
