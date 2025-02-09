# LeetCode SQL 175: 组合两个表

# Write your MySQL query statement below
#因为AdDRESSS表里面有的personId,在person表中是没有的，并且输出的结果以person表为主
#所以要进行左连接，这样正好如果Address表中没有的话，会显示为null
SELECT p.lastName , p.firstName,a.city,a.state
FROM Person AS p
LEFT JOIN Address AS a
ON a.personID = p.personID;



## 题目描述
编写一个 SQL 查询，报告 `Person` 表中每个人的姓、名、城市和州。如果 `personId` 的地址不在 `Address` 表中，则报告为 `null`。

以 **任意顺序** 返回结果表。

## 表结构

### Person 表
| 列名       | 类型     |
|------------|----------|
| personId   | int      |
| firstName  | varchar  |
| lastName   | varchar  |

- `personId` 是该表的主键（具有唯一值的列）。
- 该表包含一些人的 ID 和他们的姓和名的信息。

### Address 表
| 列名       | 类型     |
|------------|----------|
| addressId  | int      |
| personId   | int      |
| city       | varchar  |
| state      | varchar  |

- `addressId` 是该表的主键（具有唯一值的列）。
- 该表的每一行都包含一个 ID = `personId` 的人的城市和州的信息。
