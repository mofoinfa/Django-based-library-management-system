## 基于django的图书管理系统

### 项目要求：

数据库名统一使用book

注意：前端美观没有要求、但是数据保证正确

+ 登录、注册（应用）
  + 项目应用（user）
  + 登录、注册页面
  + 用户表（用户名、密码、………………）

+ 首页（应用）
  + 搜索框（根据书名或者作者搜索书籍）==》书籍列表页
  + 书籍分类（4类或以上），点击其中一个分类，去到一个页面，展示关于这个分类的所有书籍（每页展示3本书籍即可）
  + 最新书籍（按照添加到数据库的时间）（展示5个）（书籍封面、书名、作者）
  + 图书表（需要有一个外键关联到分类表的主键）（id，书名、作者、出版社、上传时间）
  + 分类表（id，分类的名称）

+ 图书管理（增删改）
+ 添加图书（书名、作者、出版社）
+ 删除图书
+ 修改图书（书名、作者、出版社）

作业提交：提交项目代码（整个文件）（数据库的备份：就是.sql文件）

时间：2023年6月16号晚上8点之前

使用说明：
因为符合逻辑设置，管理员账号无法被注册，故提供一个管理员测试账号：
username:admin
password:123456

数据库密码：需要改（setting设置为自己的数据库密码）