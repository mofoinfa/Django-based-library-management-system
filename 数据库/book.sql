/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 8.0.26 : Database - book
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `book`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add book category',7,'add_bookcategory'),
(26,'Can change book category',7,'change_bookcategory'),
(27,'Can delete book category',7,'delete_bookcategory'),
(28,'Can view book category',7,'view_bookcategory'),
(29,'Can add user identity',8,'add_useridentity'),
(30,'Can change user identity',8,'change_useridentity'),
(31,'Can delete user identity',8,'delete_useridentity'),
(32,'Can view user identity',8,'view_useridentity'),
(33,'Can add user',9,'add_user'),
(34,'Can change user',9,'change_user'),
(35,'Can delete user',9,'delete_user'),
(36,'Can view user',9,'view_user'),
(37,'Can add book',10,'add_book'),
(38,'Can change book',10,'change_book'),
(39,'Can delete book',10,'delete_book'),
(40,'Can view book',10,'view_book');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `database_book` */

DROP TABLE IF EXISTS `database_book`;

CREATE TABLE `database_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `descrition` varchar(200) NOT NULL,
  `category_id` int NOT NULL,
  `author` varchar(128) DEFAULT NULL,
  `bookImage` varchar(100) DEFAULT NULL,
  `bookname` varchar(128) DEFAULT NULL,
  `bookprice` double DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `inventory` int DEFAULT NULL,
  `press` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `database_book_category_id_3ac2d48b_fk_database_bookcategory_id` (`category_id`),
  CONSTRAINT `database_book_category_id_3ac2d48b_fk_database_bookcategory_id` FOREIGN KEY (`category_id`) REFERENCES `database_bookcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `database_book` */

insert  into `database_book`(`id`,`is_delete`,`descrition`,`category_id`,`author`,`bookImage`,`bookname`,`bookprice`,`created_time`,`inventory`,`press`) values 
(1,0,'《西游记》是中国古代小说四大名著之一，也是中国文学史上的经典之作。它讲述了唐朝年间，唐僧师徒四人历经九九八十一难，历尽艰险，取得真经，最终成功西天取经的故事。其中包含了丰富的神话传说和民间传说，描绘了各种各样的人物形象，具有极高的文学价值和艺术价值。《西游记》被誉为中国古代小说的巅峰之作，也是中华文化的瑰宝之一。',2,'吴承恩','1.jpg','西游记',15,'2023-06-12 14:50:37.332890',10,'吉林书籍出版有限公司'),
(2,0,'红楼梦》，原名《石头记》，是中国古代章回体长篇小说，中国古典四大名著之首。其通行本共120回，一般认为前80回是清代作家曹雪芹所著，后40回作者为无名氏，由高鹗，程伟元整理。',4,'曹雪芹','4.jpg','红楼梦',20,'2023-06-13 09:03:17.612972',10,'人民文学出版社'),
(3,0,'《诡秘之主》是阅文集团白金作家爱潜水的乌贼所著的西方玄幻类小说，融汇了克苏鲁风格、西方魔幻元素、第一次工业革命时代风情和蒸汽朋克情怀。这是一个蒸汽与机械的世界，这是一段“愚者”的传说。\r\n',2,'爱潜水的乌贼','3.jpg','诡秘之主',50,'2023-06-14 23:22:25.000000',10,'阅文集团'),
(4,0,'多年前很火的一本玄幻小说，哪怕到现在依然让人津津乐道，讲述了一个天才少年的崛起之路，那句“三十年河东，三十年河西，莫欺少年穷！”可以说震惊了当时的网文圈，风头一时无两',2,'天蚕土豆','4_I1MZsXf.jpg','斗破苍穹',20,'2023-06-15 23:35:43.000000',10,'阅文集团'),
(5,0,'故事在猪八戒、孙悟空、唐僧三者之间不断的转换，沙和尚估计哭晕在厕所，为什么无论到哪，他的戏份都最少，这不欺负老实人吗，或许这也是本书的一个隐喻，勤劳的老实人没什么话语权，到哪都被无视。',2,'今何在','5.jpg','悟空传',70,'2023-06-14 23:37:45.000000',10,'阅文报社'),
(6,0,'世界在次元风暴之后，各种异次元生命出现，人类通过猎杀异次元生物获取他们的次元结晶为自己所用，就能够加速进化，而主角厉害了，他可以滴血成血色小人在游戏里杀怪获取次元结晶，提升自身的属性值，还能学习元气技，还能爆出伴生宠，而游戏一滴血就是一条命，简直就是低付出高回报呀，',2,'十二翼黑暗炽天使','6.jpg','我只想安静地打游戏',45,'2023-06-14 23:46:07.000000',10,'书旗小说集团'),
(7,0,'《傲慢与偏见》是英国作家简·奥斯汀的代表作之一，讲述了伊丽莎白·班内特和达西先生之间的爱情故事。',3,'简·奥斯汀','7.jpg','傲慢与偏见',29.99,'2023-06-15 23:46:34.000000',100,'人民文学出版社'),
(8,0,'《红楼梦》是中国古典文学的巅峰之作，讲述了贾宝玉、林黛玉等人的爱情和悲剧故事。',3,'曹雪芹','8.jpg','红楼梦',49.99,'2023-06-08 23:46:38.000000',50,'人民文学出版社'),
(9,0,'《简爱》是英国小说家夏洛蒂·勃朗特的代表作之一，讲述了简·爱和罗切斯特先生之间的爱情故事。',3,'夏洛蒂·勃朗特','9.jpg','简爱',19.99,'2023-06-09 23:46:42.000000',80,'人民文学出版社'),
(10,0,'《挪威的森林》是日本作家村上春树的代表作之一，讲述了主人公渡边和他的朋友们在上世纪六十年代末期的东京生活中的爱情和友情。',3,'村上春树','10.jpg','挪威的森林',39.99,'2023-06-07 23:46:46.000000',60,'上海译文出版社'),
(11,0,'《时间旅行者的妻子》是美国作家奥黛丽·尼芬格的代表作之一，讲述了时间旅行者亨利和他妻子克莱尔之间的爱情故事。',3,'奥黛丽·尼芬格','11.jpg','时间旅行者的妻子',35.99,'2023-06-06 23:46:50.000000',70,'上海人民出版社'),
(12,0,'这本书是经典的计算机科学教材，以系统的方式介绍了计算机系统的各个方面，包括处理器体系结构、操作系统、内存管理、虚拟内存、网络编程等等。',5,'Randal E. Bryant, David R. O\'Hallaron','12.jpg','深入理解计算机系统',59.99,'2023-06-14 23:53:12.000000',100,'机械工业出版社'),
(13,0,'这本书是一本关于软件开发的实践指南，涵盖了软件开发的各个方面，包括需求分析、设计、编码、测试、调试等等。它提供了许多实用的技巧和经验，可以帮助开发人员提高代码质量和开发效率。',5,'Steve McConnell','13.jpg','代码大全',49.99,'2023-06-13 23:53:15.000000',80,'人民邮电出版社'),
(14,0,'这本书是一本经典的人工智能教材，介绍了人工智能的各个方面，包括搜索、知识表示、规划、机器学习、自然语言处理等等。它涵盖了人工智能的最新进展和应用，并提供了许多实用的算法和工具。',5,'Stuart Russell, Peter Norvig','14.jpg','人工智能：一种现代方法',89.99,'2023-06-14 23:53:19.000000',50,'机械工业出版社'),
(15,0,'这本书是一本经典的计算机网络教材，介绍了计算机网络的各个方面，包括物理层、数据链路层、网络层、传输层、应用层等等。它以应用为导向，从高层次的应用开始，逐步深入到底层的物理层。',5,'James F. Kurose, Keith W. Ross','15.jpg','计算机网络：自顶向下方法',69.99,'2023-06-14 23:53:22.000000',60,'人民邮电出版社'),
(16,0,'这本书是一本经典的算法教材，介绍了算法设计和分析的基本原理和技术，包括排序、图算法、动态规划、贪心算法等等。它提供了许多实用的算法和数据结构，并讲解了它们的实现和应用。',5,'Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein','16.jpg','算法导论',79.99,'2023-06-14 23:53:25.000000',70,'机械工业出版社'),
(17,0,'这是一系列魔幻小说，讲述了一个孤儿哈利波特在霍格沃茨魔法学校的冒险故事，他在这里学习魔法，并与他的朋友们一起对抗邪恶的黑巫师。',7,'J.K.罗琳','17.jpg','哈利波特',20,'2023-06-14 23:53:25.000000',20,'人民文学出版社'),
(18,0,'这是一本经典的儿童故事书，主角是一只可爱的小熊维尼，他和他的朋友们在森林里度过了许多有趣的时光。',7,'A.A.米尔恩','18.jpg','小熊维尼',20,'2023-06-14 23:53:25.000000',20,'人民文学出版社'),
(19,0,'这是一本收录了许多经典童话故事的书，包括《灰姑娘》、《小红帽》、《白雪公主》等，这些故事都是孩子们最喜欢的故事之一。',7,'雅各布和威廉·格林','19.jpg','格林童话',20,'2023-06-14 23:53:25.000000',20,'人民文学出版社'),
(20,0,'这是一本非常受欢迎的儿童图画书，讲述了一只小猪佩奇和她的家人和朋友们的生活故事，这些故事充满了幽默和趣味，适合年龄较小的孩子阅读。',7,'内维尔·阿斯特利','20.jpg','小猪佩奇',10,'2023-06-14 23:53:25.000000',20,'人民文学出版社'),
(21,0,'《诗经》是中国最早的诗歌总集，收录了周代以前的诗歌，是中国古代文化的重要组成部分。',1,'无名氏','21.jpg','诗经',50,'2023-06-14 23:53:25.000000',100,'中国文化出版社'),
(22,0,'《唐诗三百首》是唐代诗歌的代表作品，包括了李白、杜甫、白居易等众多著名诗人的作品，是中国文化的瑰宝。',1,'李白、杜甫、白居易等','22.jpg','唐诗三百首',60,'2023-06-15 23:53:25.000000',120,'人民文学出版社'),
(23,0,'《论语》是孔子及其弟子的言行录，是中国传统文化中的重要经典之一，对中国的思想、文化和社会产生了深远的影响。',1,'孔子及其弟子','23.jpg','论语',45,'2023-06-16 23:53:25.000000',80,'中华书局'),
(24,0,'《道德经》是中国古代哲学经典之一，是老子的著作，对中国传统文化和哲学思想产生了深远的影响。',1,'老子','24.jpg','道德经',55,'2023-06-14 23:53:25.000000',90,'商务印书馆'),
(25,0,'《史记》是中国古代第一部纪传体通史，详细记载了中国历史上的政治、军事、文化等方面的事件和人物，是中国历史文化的重要组成部分。',1,'司马迁','25.jpg','史记',70,'2023-06-14 23:53:25.000000',150,'人民出版社'),
(26,0,'福尔摩斯是一位聪明绝顶的侦探，通过细致入微的观察和推理能力，解决了许多复杂的案件。',6,'阿瑟·柯南·道尔','26.jpg','福尔摩斯探案集',35.99,'2023-06-14 23:53:25.000000',100,'某出版社'),
(27,0,'讲述了一起在火车上发生的谋杀案，主人公赫尔克里·波洛利利用自己的智慧和洞察力，最终揭开了真相。',6,'阿加莎·克里斯蒂','27.jpg','东方快车谋杀案',28.99,'2023-06-15 23:53:25.000000',80,'某出版社'),
(28,0,'讲述了一起在游轮上发生的谋杀案，主人公赫尔克里·波洛利通过推理和分析，最终找出了真凶。',6,'阿加莎·克里斯蒂','28.jpg','尼罗河上的惨案',32.99,'2023-06-14 23:53:25.000000',90,'某出版社'),
(29,0,'讲述了两个孩子之间的故事，以及他们的命运和真相。小说中充满了悬疑和推理的元素，让人难以放下。',6,'东野圭吾','29_av3h6lq.jpg','白夜行',26.99,'2023-06-14 23:53:25.000000',120,'某出版社'),
(30,0,'讲述了一个高中生和他的同学们一起解决各种奇怪的事件的故事。小说中充满了推理和解谜的元素，非常有趣。',6,'笔坂明弘','30.jpg','推理笔记',23.99,'2023-06-14 23:53:25.000000',70,'某出版社'),
(31,0,'这是一本关于成长和青春的小说，主人公是一个十七岁的男孩，他在纽约市度过了一个周末，这个周末改变了他的一生。',4,'J·D·塞林格','31.jpg','麦田里的守望者',39.99,'2023-06-14 23:53:25.000000',100,'出版社A'),
(32,0,'这是一本描写20世纪20年代美国社会的小说，主要讲述了一个神秘的富豪盖茨比和他对爱情的执着追求。',4,'F·S·菲茨杰拉德','32.jpg','了不起的盖茨比',49.99,'2023-06-14 23:53:25.000000',120,'出版社B'),
(33,0,'这是一本反乌托邦小说，描绘了一个被极权主义统治的世界，主人公温斯顿·史密斯试图反抗这种统治。',4,'乔治·奥威尔','33.jpg','1984',45.99,'2023-06-14 23:53:25.000000',80,'出版社C'),
(34,0,'这是一本描写南部种族歧视和成长的小说，主人公是一个小女孩，她目睹了南方的不公正和偏见，最终学会了勇敢和正义。',4,'哈珀·李','34.jpg','荆棘鸟',42.99,'2023-06-16 23:53:25.000000',90,'出版社D'),
(35,0,'这是一本关于阿富汗历史和家庭的小说，主人公是一个男孩，他在阿富汗和美国之间穿梭，寻找他失散的朋友和家人。',4,'卡勒德·胡赛尼','35.jpg','追风筝的人',37.99,'2023-06-14 23:53:25.000000',110,'出版社E'),
(36,1,'一本描述描述三国的书',4,'罗贯中','36.jpg','三国演义',30,'2023-06-15 13:36:20.251528',10,'人民文学出版社'),
(37,1,'一本讲述好汉的书籍',7,'罗贯中','7_sVGgQYt.jpg','水浒传',20,'2023-06-16 10:59:53.976701',10,'北京出版社');

/*Table structure for table `database_bookcategory` */

DROP TABLE IF EXISTS `database_bookcategory`;

CREATE TABLE `database_bookcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `database_bookcategory` */

insert  into `database_bookcategory`(`id`,`name`) values 
(7,'儿童类'),
(1,'古诗文'),
(6,'推理类'),
(4,'文学类'),
(3,'爱情小说'),
(2,'玄幻小说'),
(5,'编程类');

/*Table structure for table `database_user` */

DROP TABLE IF EXISTS `database_user`;

CREATE TABLE `database_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `identity_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `database_user_identity_id_18b26fd4_fk_database_useridentity_id` (`identity_id`),
  CONSTRAINT `database_user_identity_id_18b26fd4_fk_database_useridentity_id` FOREIGN KEY (`identity_id`) REFERENCES `database_useridentity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `database_user` */

insert  into `database_user`(`id`,`username`,`email`,`password`,`created_time`,`name`,`birthday`,`identity_id`) values 
(1,'admin','111@qq.co','1234567','2023-05-05 14:44:06.000000','张三','1994-06-23',3),
(2,'2116190076','123@qq','aaaaaa','2023-06-12 09:26:32.465972','王五',NULL,1),
(3,'123456','111@111','ssssss','2023-06-12 12:31:07.209495','往往',NULL,1),
(4,'admin123','472260102@qq.com','zzzzzz','2023-06-16 10:56:44.067522','张三峰',NULL,1);

/*Table structure for table `database_useridentity` */

DROP TABLE IF EXISTS `database_useridentity`;

CREATE TABLE `database_useridentity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `database_useridentity` */

insert  into `database_useridentity`(`id`,`name`) values 
(1,'用户'),
(2,'管理员'),
(3,'全部');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(10,'database','book'),
(7,'database','bookcategory'),
(9,'database','user'),
(8,'database','useridentity'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-06-12 06:42:16.515244'),
(2,'auth','0001_initial','2023-06-12 06:42:16.996485'),
(3,'admin','0001_initial','2023-06-12 06:42:17.156525'),
(4,'admin','0002_logentry_remove_auto_add','2023-06-12 06:42:17.164527'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-06-12 06:42:17.173549'),
(6,'contenttypes','0002_remove_content_type_name','2023-06-12 06:42:17.255577'),
(7,'auth','0002_alter_permission_name_max_length','2023-06-12 06:42:17.307640'),
(8,'auth','0003_alter_user_email_max_length','2023-06-12 06:42:17.329638'),
(9,'auth','0004_alter_user_username_opts','2023-06-12 06:42:17.338651'),
(10,'auth','0005_alter_user_last_login_null','2023-06-12 06:42:17.386648'),
(11,'auth','0006_require_contenttypes_0002','2023-06-12 06:42:17.390651'),
(12,'auth','0007_alter_validators_add_error_messages','2023-06-12 06:42:17.398655'),
(13,'auth','0008_alter_user_username_max_length','2023-06-12 06:42:17.450664'),
(14,'auth','0009_alter_user_last_name_max_length','2023-06-12 06:42:17.539682'),
(15,'auth','0010_alter_group_name_max_length','2023-06-12 06:42:17.557687'),
(16,'auth','0011_update_proxy_permissions','2023-06-12 06:42:17.567691'),
(17,'auth','0012_alter_user_first_name_max_length','2023-06-12 06:42:17.617700'),
(18,'database','0001_initial','2023-06-12 06:42:17.839750'),
(19,'sessions','0001_initial','2023-06-12 06:42:17.872758'),
(20,'database','0002_auto_20230612_2116','2023-06-12 13:17:43.514119'),
(21,'database','0003_auto_20230612_2250','2023-06-12 14:50:37.379904'),
(22,'database','0004_book_press','2023-06-12 15:01:18.362863');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('yfz00xpas5zy84s5vdtb33bnt8t9wkjd','eyJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIxMjM0NTY3IiwiaWQiOjF9:1qA7Cs:pGAUUgI0Oqlz2nmYCXcEnzTpE0S1rwnV8q3ofRW-dV4','2023-06-30 11:01:30.206873');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
