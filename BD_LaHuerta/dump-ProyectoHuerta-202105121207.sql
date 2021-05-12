-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: huerta.c2iy07imwo9h.us-east-2.rds.amazonaws.com    Database: ProyectoHuerta
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `idchat` int NOT NULL AUTO_INCREMENT,
  `idmessenger1` int DEFAULT NULL,
  `idmessenger2` int DEFAULT NULL,
  PRIMARY KEY (`idchat`),
  KEY `iduser_idx` (`idmessenger1`,`idmessenger2`),
  KEY `iduserreciever_idx` (`idmessenger2`),
  CONSTRAINT `idmessenger1` FOREIGN KEY (`idmessenger1`) REFERENCES `user` (`iduser`),
  CONSTRAINT `idmessenger2` FOREIGN KEY (`idmessenger2`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (68,1,3),(69,1,4),(78,2,3);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `idmessage` int NOT NULL AUTO_INCREMENT,
  `idchat` int DEFAULT NULL,
  `idsender` int DEFAULT NULL,
  `idreciever` int DEFAULT NULL,
  `messageText` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idmessage`),
  KEY `idchat_idx` (`idchat`),
  KEY `idsender_idx` (`idsender`),
  KEY `idreciever_idx` (`idreciever`),
  CONSTRAINT `idchat` FOREIGN KEY (`idchat`) REFERENCES `chat` (`idchat`),
  CONSTRAINT `idreciever` FOREIGN KEY (`idreciever`) REFERENCES `user` (`iduser`),
  CONSTRAINT `idsender` FOREIGN KEY (`idsender`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (79,69,1,NULL,'Hola Javi, aceptas truque, yo tengo 5 kg de naranjas, quieres?'),(86,78,2,NULL,'Hola, Carmen! estas interesada en el trueque?');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idproduct` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(45) DEFAULT NULL,
  `productType` varchar(45) DEFAULT NULL,
  `productAmount` decimal(10,0) DEFAULT NULL,
  `productLocality` varchar(45) DEFAULT NULL,
  `productPrice` decimal(10,0) DEFAULT NULL,
  `productEco` varchar(45) DEFAULT NULL,
  `productChange` varchar(45) DEFAULT NULL,
  `iduser` int DEFAULT NULL,
  `productImg` varchar(400) DEFAULT NULL,
  `productDescription` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'tomate','fruta',2,'Madrid',3,'si','si',1,'https://www.hola.com/imagenes/cocina/noticiaslibros/20190711145611/tomate-fruta-verdura-curiosidades/0-700-312/curiosidades-tomate-m.jpg','Con un color rojo poderoso característico y un sabor intenso. El tomate tiene el mismo gusto que los tomates raff pero con la piel más dura y un grado de consistencia mayor que un tomate normal.'),(2,'pera','fruta',2,'Madrid',4,'no','si',1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOlTf68JpzrAa4VIYuXKVmasoT9FoQsv2n2A&usqp=CAU','La pulpa de la pera es dura y muy ácida o astringente cuando aún esta verde. Así que madura, se madura y endulzado. Su componente mayoritario es el agua. '),(4,'berenjena','verdura',20,'Madrid',1,'si','si',2,'https://www.diet-health.info/images/recipes/1400/augergine-an-pflanze-eggplant-by-hansenn-fotolia-127113291.jpg','las berenjenas más sabrosas son las más tiernas y firmes, con la cáscara lisa y brillante, de color morado oscuro y de mayor peso en proporción a su tamaño.'),(5,'lechuga roble','verdura',2,'Merida',1,'no','si',2,'https://cdn.shopify.com/s/files/1/0302/1288/2569/products/hojaroble1_1024x1024@2x.png?v=1612946369','Unidad lechuga roble rojo, de nuestros compañeros de Villalprado, de sabor suave, deliciosa ¡ De la huerta a tu puerta !'),(7,'naranja','fruta',3,'Valencia',4,'si','si',3,'https://www.ecestaticos.com/image/clipping/557/418/2a35252e412794e91fd7e9d4773ae459/los-trucos-para-comprar-las-mejores-naranjas-en-el-mercado.jpg','Nuestras naranjas las cultivamos de forma tradicional, como lo hacían nuestros abuelos, de forma natural, recién recolectadas y sin tratamientos post cosecha.'),(15,'puerros','verdura',7,'Barcelona',9,'no','si',5,'https://www.tuberculos.org/wp-content/uploads/2018/10/puerro.jpg','Los mejores puerros con el sabor de siempre, directo de la huerta.'),(17,'peras Conferencia','Fruta',10,'Madrid',0,'no','si',2,'https://www.frutadelasarga.com/server/Portal_0008706/img/products/pera-conferencia_1184250.jpg','Peras Conferencia de origen ecológico , dulces en su grado de maduración.'),(20,'alcachofas','Verdura',20,'Getafe',20,'no','no',1,'https://as01.epimg.net/deporteyvida/imagenes/2018/06/18/portada/1529331598_220993_1529331742_noticia_normal.jpg',NULL),(22,'alcachofas','Verdura',10,'Getafe',1,'si','no',3,'https://www.flickr.com/photos/bambolia/3038779775/',NULL),(23,'alcachofas','Verdura',10,'Alcobendas',1,'si','no',2,'https://imagesph.global.ssl.fastly.net/estaticos/imagenes/articulo_revista/186/186_620x465.jpg',NULL),(26,'mango','Fruta',10,'Getafe',1,'si','si',1,'https://frutasyverduras.info/wp-content/uploads/2018/08/mango-1024x683.jpg',NULL),(27,'mango','Fruta',10,'Getafe',1,'si','si',2,'https://upload.wikimedia.org/wikipedia/commons/a/af/Mango_TommyAtkins04_Asit.jpg',NULL),(28,'papaya','Fruta',10,'Madrid',1,'si','si',4,'https://hdstatic.net/gridfs/holadoctor/837x0_52096b04b93795903b517b13_6_41-1573504581,517.jpg?fmt=webp',NULL),(32,'fresas','Fruta',7,'Segovia',3,'si','no',1,'https://www.lafruteria.es/blog/wp-content/uploads/2019/02/diferencias-fresas-fresones-color-sabor-tamano.jpg','Fresas ecológicas. Una de las frutas donde más se nota la producción en ecológico dado que es donde normalmente tienen que incorporar más pesticidas.'),(35,'fresas','Fruta',25,'Huelva',0,'no','si',2,'https://cdn.pixabay.com/photo/2016/04/29/16/03/strawberries-1361202_960_720.jpg','El fruto de Fresón de Palos se caracteriza por tener un gran tamaño y un natural color rojo, además por su tersura y consistencia'),(37,'brocoli','verdura',10,'Toledo',1,'si','no',3,'https://imagesph.global.ssl.fastly.net/estaticos/imagenes/articulo_revista/164/164_620x465.jpg','Brócoli de Aranjuez de exquisito sabor y agradable textura, es uno de los máximos exponentes de las crucíferas, fuente de salud.'),(38,'pera de agua','Fruta',1,'Madrid',1,'no','no',2,'https://frutascharito.es/117-thickbox_default/peras-de-agua.jpg',NULL),(39,'acelgas','verdura',25,'Getafe',2,'si','si',4,'https://ep01.epimg.net/elpais/imagenes/2020/03/18/buenavida/1584528342_097774_1584528947_noticia_normal_recorte1.jpg',NULL),(41,'acelgas','Verdura',4,'Getafe',1,'no','no',4,'https://gdegastronomia.es/wp-content/uploads/2017/11/ThinkstockPhotos-578089024-750x584.jpg',NULL),(43,'manzana','Fruta',10,'Getafe',2,'si','si',2,'https://www.iagua.es/sites/default/files/styles/thumbnail-830x455/public/manzanas-irta.jpg?itok=s0BjFOnh',NULL),(44,'manzana','Fruta',5,'Getafe',2,'si','no',4,'https://mejorconsalud.as.com/wp-content/uploads/2015/04/una-manzana-dia-500x333.jpg',NULL),(45,'manzana reineta','Fruta',2,'Getafe',2,'si','si',3,'https://img.interempresas.net/fotos/494624.jpeg',NULL),(51,'pera','Fruta',4,'Alcobendas',2,'si','si',3,'https://arbolesfrutales.online/wp-content/uploads/2018/11/pyrus-fruta.jpg',NULL),(56,'platanos','Fruta',6,'Malaga',5,'no','si',3,'https://cdn.pixabay.com/photo/2011/03/24/10/12/banana-5734_960_720.jpg',NULL),(58,'platano','Fruta',4,'Alcorcon',5,'si','no',3,'https://freshfruit.pe/wp-content/uploads/2020/12/exportaciones-banano-768x403.png',NULL),(60,'judia verde','Verdura',8,'Alcorcon',2,'si','si',3,'https://www.frutadelasarga.com/server/Portal_0008706/img/products/judia-verde-plana_1221814.jpg',NULL),(61,'pera','fruta',2,'Madrid',5,'no','si',2,'https://img.interempresas.net/fotos/1631854.jpeg','La pulpa de la pera es dura y muy ácida o astringente cuando aún esta verde. Así que madura, se madura y endulzado. Su componente mayoritario es el agua. '),(65,'coliflor','Verdura',25,'Albacete',2,'si','no',3,'https://www.cocinacaserayfacil.net/wp-content/uploads/2019/12/cocer-coliflor-al-vapor-en-olla-expres.jpg','Una verdura muy sana, deliciosa y fácil de cocinar de mil maneras diferentes. Disfruta de la coliflor mientras está de temporada.'),(67,'esparragos','Verdura',25,'Tres Cantos',2,'no','no',5,'https://www.pequerecetas.com/wp-content/uploads/2014/03/esparragos.jpg','stos espárragos son todavía más naturales y esa es una característica que repercute de manera muy positiva en todos los beneficios que te aportan.'),(77,'coco','Fruta',2,'Zamora',1,'si','si',5,'https://haycosasmuynuestras.com/wp-content/uploads/2018/07/coco-abierto.jpg','El coco es un fruto redondo y alargado con una carne blanca en su interior de textura fibrosa y aceitosa, cubierta por una cáscara peluda y dura, de color marrón.'),(78,'judias verdes','Verdura',25,'Madrid',2,'si','no',5,'https://media.ecotierra.es/c/product/judias-verdes-planas-ecologicas-1-kg-520x520.jpeg','¿Vas a hacer judías verdes con patatas? ¿Te decantas por unas judías verdes con jamón? ¿O eres de las que prefiere unas buenas judías verdes con tomate? Sea la receta que elijas lo que está más claro que el agua es que necesitarás una materia prima de gran calidad. ¿O no es cierto?'),(80,'miel ','Otros',30,'Guadalajara',9,'si','si',3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDb2sXP9HxnO710bgwMX_ghOTEWO6YFinfcA&usqp=CAU','La miel de La Alcarria cuenta con unas características que la hacen única. Es por ello que el 11 de noviembre de 1992 recibió la calificación de Denominación de Origen'),(82,'champiñones','Verdura',7,'Segovia',7,'Sí','Sí',26,'https://www.tododisca.com/wp-content/uploads/2020/10/Beneficios-Champinones.jpg','Champiñón natural. Su aspecto ya resulta llamativo. El sombrero de este champiñón es intensamente marrón que contrasta con el color blanco puro que se descubre al trocearlo.'),(83,'berenjena','Verdura',10,'San Sebastian',5,'si','si',2,'https://ep01.epimg.net/elpais/imagenes/2020/04/28/buenavida/1588072839_500171_1588074569_noticia_normal_recorte1.jpg','La berenjena, como ingrediente, es una de las verduras más versátiles de la gastronomía española'),(84,'lichis','Fruta',12,'Teruel',1,'si','no',2,'https://okdiario.com/img/2019/07/28/propiedades-y-recetas-de-litchi-655x368.jpg','El Lichi es una fruta tropical también conocida como Litchi, Lichee o Lychee.'),(118,'mango','Fruta',6,'El Molar',7,'si','si',2,'','Mangos de la sierra de Madrid');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `idtransaction` int NOT NULL AUTO_INCREMENT,
  `id_buyer` int DEFAULT NULL,
  `id_seller` int DEFAULT NULL,
  `id_product` int DEFAULT NULL,
  `transactionAmount` decimal(65,0) DEFAULT NULL,
  PRIMARY KEY (`idtransaction`),
  KEY `idproduct_idx` (`id_product`),
  KEY `iduser_idx` (`id_buyer`),
  KEY `iduserseller_idx` (`id_seller`),
  CONSTRAINT `idproduct` FOREIGN KEY (`id_product`) REFERENCES `product` (`idproduct`),
  CONSTRAINT `iduserbuyer` FOREIGN KEY (`id_buyer`) REFERENCES `user` (`iduser`),
  CONSTRAINT `iduserseller` FOREIGN KEY (`id_seller`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,4,1,1,2),(2,5,1,2,2),(3,3,2,4,4),(4,1,2,5,2),(5,2,3,7,3),(6,2,5,15,7),(7,1,3,37,5),(8,4,2,35,2),(9,1,1,NULL,7),(10,1,2,NULL,12),(11,1,2,NULL,12),(12,1,2,84,12),(13,1,2,84,12),(14,1,2,83,10),(15,1,2,84,12),(16,1,3,80,30),(17,1,2,83,10),(18,1,26,82,7),(19,1,4,28,10),(20,1,2,83,10),(21,1,2,17,10),(22,1,26,82,7),(24,NULL,2,84,12),(25,NULL,2,83,10),(26,NULL,3,80,30),(27,2,3,80,30),(28,1,26,82,7),(29,1,2,4,20),(30,1,2,4,20),(31,1,3,80,30),(32,1,2,84,12),(33,1,3,80,30),(34,1,4,28,10),(35,NULL,2,17,10),(36,1,1,2,2),(40,2,4,39,25),(45,2,3,60,8),(46,NULL,1,1,2);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname1` varchar(45) DEFAULT NULL,
  `birthyear` int DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `userImg` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Pascual','Bolullo',1991,'Pascual Code','Madrid',679510188,'eren@gmail.com','liderhuerta','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgVFRYYGRgZGRweGBwaGBgaGRkcHBwaHBwcGBgcIS4lHB4rHxgYJjgnKy8xNTU1GiQ7QDszPy40NTEBDAwMEA8QGhISHjQhJCQ0NDExNDQ0NDQxNDQ0NDQ0NDQxNDQ0NDE0NDQ0NDQ0NDQ0NDE0ND8/MTQ0PzExNDE0Mf/AABEIAMIBAwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAEBQMGAAIHAQj/xABAEAACAAQDBQUGBAMIAgMAAAABAgADBBESITEFQVFhcQYiMoGRE1KhscHRQnLh8BQjYgczgpKissLxJGMVFkP/xAAZAQADAQEBAAAAA'),(2,'Natalia','Sainz',1992,'nataVeggie','Madrid',679234987,'nataliaLopez@gmail.com','lasfrutas','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGBxMUExYUFBQXFhYYGSAcGRkYGhocIBwhICIcGR8hIiAfHyoiHyEnIiIcIzQjKS0uMTExHyE2OzYwOiowMS4BCwsLDw4PHRERHTAkIicwMDAyMjAwMDAyMDIwMDAwMDAwMjAwMDAwMDAwMDAwMjAwMDAwMDAwMDAwMDAwMDAwMP/AABEIALkBEQMBIgACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAAFBgMEAAIHAf/EAEkQAAIBAgQDBQQGBwUIAQUBAAECEQMhAAQSMQVBUQYTImFxMoGRoUJSscHR8AcUIzNicuEVNFOS8RZUc4KTosLSskNEZHTTJP/EABkBA'),(3,'Carmen','Menchu',1989,'Menx89','Madrid',676096743,'cmx89@gmail.com','blas89','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz5k26Cje0wzROjn1zdSGbbJLNMbGRaz5qSg&usqp=CAU'),(4,'Javier','Huertado',1996,'Javierta','calle tortola N11 1A',692540966,'javierhurtado98@gmail.com','churchill','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPQqNsvD_VDvV5Gok4d5pT6zDySnkoIILFvQ&usqp=CAU'),(5,'Lichi','Bambu',2015,'Gatonat','Madrid',693238794,'miau@gmail.com','sardinilla','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkC09aGpLr8jkJcfVO2moxO8v3RSV_5zvmaA&usqp=CAU'),(20,'Pascual','asdfsadfa',2014,'ArminHarvest','Calle Medinaceli 6, 1',679510188,'armin@gmail.com','qwqwqwqw',NULL),(22,'Levi','Akerman',1991,'LeviGod','MariaWall',987654321,'levi@gmail.com','qwqwqwqw',NULL),(23,'Anne','Leonhart',1997,'AnneTitan','Britania',987654321,'anne@gmail.com','qwqwqwqw',NULL),(24,'Adrian','Garcia',1989,'AdrianPlantar','Granada',987654321,'adrian@gmail.com','qwqwqwqw',NULL),(25,'Naofumi','Iwtani',2000,'Tate no Yuusha','Isekai',987654321,'naofumi@gmail.com','qwqwqwqw',NULL),(26,'Michael','Michels',1991,'MicHarvest','Michigan',987654321,'mic@gmail.com','liderhuerta',NULL),(29,'Pascual','Pera Matinera',1991,'Pascu Harvest','Calle Medinaceli 6, 1',679510188,'agricultor@gmail.com','qwqwqwqw',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ProyectoHuerta'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-12 12:07:24
