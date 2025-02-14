
-- 查询第N高的工资
-- 逻辑：
-- 1. 使用DISTINCT确保返回的工资是唯一的，避免因重复工资导致的错误。
-- 2. 使用ORDER BY salary DESC按工资降序排列，确保最高的工资排在前面。
-- 3. 使用LIMIT 1 OFFSET @N - 1跳过前N-1行，返回第N行的工资。
-- 注意：如果@N为0或负数，OFFSET会导致错误，因此需要确保@N是一个正整数。


#offset的值必须为一个常量，所以需要提前设置

CREATE FUNCTION getNthHighestSalary(N INT) 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE result INT DEFAULT NULL;
  DECLARE offset_val INT DEFAULT 0;

  IF N > 0 THEN
    SET offset_val = N - 1;
    SELECT DISTINCT salary INTO result
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET offset_val;
  END IF;

  RETURN result;
END


-- SQL文件名称：第N高的薪水.sql
-- 作者：[你的名字]
-- 创建日期：[具体日期]
-- 功能：查询Employee表中第N高的工资
-- 输入：N（整数，表示要查询的第N高的工资）
-- 输出：第N高的工资值（如果存在），否则返回NULL

-- 表结构：
-- Employee(id, salary)，其中id是主键，salary是员工的工资。

-- 示例说明：
-- 假设表中有以下数据：
-- | id | salary |
-- |----|--------|
-- | 1  | 3000   |
-- | 2  | 2000   |
-- | 3  | 5000   |
-- | 4  | 2000   |
-- | 5  | 4000   |
-- 查询第2高的工资，结果应为4000。



