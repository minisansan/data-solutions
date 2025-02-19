# Write your MySQL query statement below

#顺着题目要求tiv_2015应该在，按照tiv_2015聚合之后的COUNT(*)>1的里面
#tiv_2016应该在,按照lat,lon聚合之后COUNT(*)=1的里面

SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN(
        SELECT  tiv_2015
        FROM Insurance
        GROUP BY tiv_2015
        HAVING COUNT(*)>1
    )  AND
     tiv_2016 IN (
        SELECT tiv_2016
        FROM Insurance
        GROUP BY lat,lon
        HAVING COUNT(*)=1
     );

/*

Insurance 表：

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+-------------+-------+
pid 是这张表的主键(具有唯一值的列)。
表中的每一行都包含一条保险信息，其中：
pid 是投保人的投保编号。
tiv_2015 是该投保人在 2015 年的总投保金额，tiv_2016 是该投保人在 2016 年的总投保金额。
lat 是投保人所在城市的纬度。题目数据确保 lat 不为空。
lon 是投保人所在城市的经度。题目数据确保 lon 不为空。
 

编写解决方案报告 2016 年 (tiv_2016) 所有满足下述条件的投保人的投保金额之和：

他在 2015 年的投保额 (tiv_2015) 至少跟一个其他投保人在 2015 年的投保额相同。
他所在的城市必须与其他投保人都不同（也就是说 (lat, lon) 不能跟其他任何一个投保人完全相同）。
tiv_2016 四舍五入的 两位小数 。
*/
