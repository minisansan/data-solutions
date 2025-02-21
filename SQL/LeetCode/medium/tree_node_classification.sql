# Write your MySQL query statement below

#首先判断root，当一个结点p_id=null的时候，即为
#内部结点，某个结点的p_id不等于null，并且p_id中有该节点
#叶节点，某个结点的p_id不等于null，并且p_id中没有该节点

WITH CET1 AS(
    SELECT p_id
    FROM Tree
    GROUP BY p_id
    HAVING COUNT(p_id)>=1 AND p_id IS NOT NULL
)

SELECT  id,
        CASE WHEN p_id IS NULL 
            THEN 'Root'
        WHEN  id IN (SELECT p_id FROM CET1)
            THEN 'Inner'
        ELSE  'Leaf'
        END  AS 'type'
FROM Tree



/*
表：Tree

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| p_id        | int  |
+-------------+------+
id 是该表中具有唯一值的列。
该表的每行包含树中节点的 id 及其父节点的 id 信息。
给定的结构总是一个有效的树。
 

树中的每个节点可以是以下三种类型之一：

"Leaf"：节点是叶子节点。
"Root"：节点是树的根节点。
"lnner"：节点既不是叶子节点也不是根节点。
编写一个解决方案来报告树中每个节点的类型。

以 任意顺序 返回结果表。
*/
