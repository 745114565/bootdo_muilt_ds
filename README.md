# bootdo_muilt_ds

#### 项目介绍
特别感谢[bootdo](http://bootdo.com/)原创作者！
该项目是将开源项目bootdo做了二次开发，主要做了多数据源处理（spring boot 多数据源）：将原来的数据库按照功能模块**分解为5个数据库**。其他部分没有做任何处理。

#### 操作思路（修改的地方）

* 将原来的表按照模块分成五个sql文件(每个文件都是单独的数据库) ：`bd-activitir.sql` 、 `bd-blog.sql` 、 `bd-common.sql` 、 `bd-oa.sql` 、 `bd-system.sql`
* 修改配置文件 `application-dev.yml` 中数据源配置,生产环境需配置 `application-pro.yml`
* 原数据源中配置文件 `DruidDBConfig.java` 中关于数据源的部分注释掉，保留关于Druid的部分
* 新建多数据源配置文件 `MultiDataSourceConfig.java`
* 配置多数据源,具体见 ： `ActivitiDataSourceConfig.java` 、 `BlogDataSourceConfig.java` 、 `CommonDataSourceConfig.java` 、 `OaDataSourceConfig.java` 、 `SystemDataSourceConfig.java`
* 启动文件 `BootdoApplication.java` 中将 `@MapperScan("com.xxxx.xxx.xxx")`注释

#### 软件架构
框架请参见：[bootdo](https://gitee.com/lcg0124/bootdo)


#### 安装教程(使用说明)

1. git clone https://github.com/745114565/bootdo_muilt_ds.git 
2. 根据提供的sql脚本创建数据库及表
3. 运行 BootdoApplication 
1. 新人报道，请大家多多指教！
