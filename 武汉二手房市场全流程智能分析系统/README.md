# 武汉二手房市场全流程智能分析系统

**数据爬虫**
**数据清洗**
**基于powerbi构建看板**
**房价预测**

爬虫来源网站房天下


### 项目概述
本项目通过爬虫获取武汉二手房市场数据，结合特征工程与机器学习建模，构建房价预测模型，为购房者提供价格参考，为房产投资者提供市场分析依据。
### 技术栈
Python、DrissionPage、BeautifulSoup、Pandas、Scikit-learn、RandomForest、PowerBI

### 项目成果：
#### 数据采集与清洗：

基于DrissionPage构建异步爬虫，突破反爬限制，采集超5000条房源数据
设计动态解析逻辑处理异构页面结构，缺失值清洗率提升40%
开发正则表达式引擎提取15+关键字段，结构化存储率超92%
#### 特征工程与建模：

创新性拆分户型特征（室/厅/卫），构建房龄、地铁距离等衍生特征
采用有序编码处理装修、楼层等分类变量，优化模型特征空间
通过网格搜索优化随机森林参数，测试集R²达0.86，较基线模型提升23%
#### 业务应用与验证：

开发预测接口支持单房源估价，误差率控制在8%以内
通过特征重要性分析发现：房龄、地铁距离、建筑面积为TOP3价格影响因素
为典型购房场景提供多模型加权预测方案（案例预测价114.7万 vs 实际成交价118万）
#### 数据可视化体系：

使用PowerBI构建6大主题看板，涵盖价格分布、户型需求、地铁效应等维度
