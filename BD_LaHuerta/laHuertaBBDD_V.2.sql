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
