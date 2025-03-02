#即是对blog_url进行提取，可以使用SUBTRING_INDEX()来提取
#选择倒着找第一个出现的/后面的内容

SELECT  device_id,
        SUBSTRING_INDEX(blog_url,"/",-1) AS user_name
FROM user_submit

/*
描述
题目：对于申请参与比赛的用户，blog_url字段中url字符后的字符串为用户个人博客的用户名，现在运营想要把用户的个人博客用户字段提取出单独记录为一个新的字段，请取出所需数据。

示例：user_submit
device_id
profile
blog_url
2138	180cm,75kg,27,male
http:/url/bisdgboy777
3214	165cm,45kg,26,female
http:/url/dkittycc
6543	178cm,65kg,25,male
http:/url/tigaer
4321	171 cm,55kg,23,female
http:/url/uhksd
2131	168cm,45kg,22,female
http:/url/sydney

根据示例，你的查询应返回以下结果：
device_id
user_name
2138	bisdgboy777
3214	dkittycc
6543	tigaer
4321	uhsksd
2131	sydney
*/
