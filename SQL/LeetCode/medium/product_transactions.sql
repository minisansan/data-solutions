#查找购买个数超过20,质量小于50的商品，按照商品id升序排序
#连接两张表，按要求处理

WITH CET1 AS(
    SELECT  goods_id,
            SUM(count) AS total
    FROM trans
    GROUP BY goods_id
)

SELECT  g.id,
        g.name,
        g.weight,
        c.total
FROM CET1 AS c
JOIN goods AS g
ON c.goods_id=g.id
WHERE c.total>20 AND g.weight<50
ORDER BY c.goods_id,weight,total;


/*
描述
如下有一张商品表（goods），字段依次为：商品id、商品名、商品质量
id	name	weight
1	A1	100
2	A2	20
3	B3	29
4	T1	60
5	G2	33
6	C0	55
还有一张交易表（trans），字段依次为：交易id、商品id、这个商品购买个数
id	goods_id	count
1	3	10
2	1	44
3	6	9
4	1	2
5	2	65
6	5	23
7	3	20
8	2	16
9	4	5
10	1	3
查找购买个数超过20,质量小于50的商品，按照商品id升序排序,如:
id	name	weight	total
2	A2	20	81
3	B3	29	30
5	G2	33	23
*/
