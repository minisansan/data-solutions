# Write your MySQL query statement below
#可以利用正则表达式来匹配错误的ip
#任何 8 位字节中包含大于 255 的数字：\b(25[6-9]|2[6-9]\d|[3-9]/d{2})\b
#任何 8 位字节中含有 前导零（如 01.02.03.04）: \b(0\d+)\b
#少于或多于 4 个 8 位字节 ：^(\\d{1,3}\\.){0,2}\\d{1,3}$|^(\\d{1,3}\\.){4,}\\d{1,3}$
#可以利用SUM,IF最后统计

SELECT  ip,
        SUM(IF(ip REGEXP '\\b(25[6-9]|2[6-9]\\d|[3-9]\\d{2})\\b', 1, 0) + 
            IF(ip REGEXP '\\b0\\d+\\b', 1, 0) + 
            IF(ip REGEXP '^(\\d{1,3}\\.){0,2}\\d{1,3}$|^(\\d{1,3}\\.){4,}\\d{1,3}$', 1, 0) 
        ) AS invalid_count
FROM logs
GROUP BY ip
HAVING invalid_count > 0
ORDER BY invalid_count DESC, ip DESC;

/*
表：logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| log_id      | int     |
| ip          | varchar |
| status_code | int     |
+-------------+---------+
log_id 是这张表的唯一主键。
每一行包含服务器访问日志信息，包括 IP 地址和 HTTP 状态码。
编写一个解决方案来查找 无效的 IP 地址。一个 IPv4 地址如果满足以下任何条件之一，则无效：

任何 8 位字节中包含大于 255 的数字
任何 8 位字节中含有 前导零（如 01.02.03.04）
少于或多于 4 个 8 位字节
返回结果表分别以 invalid_count，ip 降序 排序。
*/
