-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: vitality_coach
-- ------------------------------------------------------
-- Server version	8.0.33

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

--
-- Current Database: `vitality_coach`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vitality_coach` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vitality_coach`;

--
-- Table structure for table `dietary_restrictions`
--

DROP TABLE IF EXISTS `dietary_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietary_restrictions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietary_restrictions`
--

LOCK TABLES `dietary_restrictions` WRITE;
/*!40000 ALTER TABLE `dietary_restrictions` DISABLE KEYS */;
INSERT INTO `dietary_restrictions` VALUES (1,'vegan'),(2,'vegetarian'),(3,'gluten-free'),(4,'lactose-free'),(5,'pescatarian'),(6,'beef-free'),(7,'pork-free');
/*!40000 ALTER TABLE `dietary_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_dietary_restrictions`
--

DROP TABLE IF EXISTS `dish_dietary_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_dietary_restrictions` (
  `dish_id` int NOT NULL,
  `dietary_restriction_id` int NOT NULL,
  PRIMARY KEY (`dish_id`,`dietary_restriction_id`),
  KEY `dietary_restriction_id` (`dietary_restriction_id`),
  CONSTRAINT `dish_dietary_restrictions_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`),
  CONSTRAINT `dish_dietary_restrictions_ibfk_2` FOREIGN KEY (`dietary_restriction_id`) REFERENCES `dietary_restrictions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_dietary_restrictions`
--

LOCK TABLES `dish_dietary_restrictions` WRITE;
/*!40000 ALTER TABLE `dish_dietary_restrictions` DISABLE KEYS */;
INSERT INTO `dish_dietary_restrictions` VALUES (1,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(13,1),(14,1),(15,1),(17,1),(20,1),(21,1),(23,1),(24,1),(26,1),(27,1),(28,1),(29,1),(30,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(13,2),(14,2),(15,2),(17,2),(20,2),(21,2),(23,2),(24,2),(26,2),(27,2),(28,2),(29,2),(30,2),(1,3),(2,3),(3,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(12,3),(13,3),(14,3),(15,3),(16,3),(18,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(1,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(17,4),(18,4),(20,4),(21,4),(22,4),(23,4),(24,4),(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(17,5),(18,5),(19,5),(20,5),(21,5),(22,5),(23,5),(24,5),(25,5),(26,5),(27,5),(28,5),(29,5),(30,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(12,6),(13,6),(14,6),(15,6),(16,6),(17,6),(18,6),(19,6),(20,6),(21,6),(22,6),(23,6),(24,6),(25,6),(26,6),(27,6),(28,6),(29,6),(30,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(11,7),(12,7),(13,7),(14,7),(15,7),(16,7),(17,7),(18,7),(19,7),(20,7),(21,7),(22,7),(23,7),(24,7),(25,7),(26,7),(27,7),(28,7),(29,7),(30,7);
/*!40000 ALTER TABLE `dish_dietary_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_objectives_unsuitable`
--

DROP TABLE IF EXISTS `dish_objectives_unsuitable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_objectives_unsuitable` (
  `dish_id` int NOT NULL,
  `objective_id` int NOT NULL,
  PRIMARY KEY (`dish_id`,`objective_id`),
  KEY `objective_id` (`objective_id`),
  CONSTRAINT `dish_objectives_unsuitable_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`),
  CONSTRAINT `dish_objectives_unsuitable_ibfk_2` FOREIGN KEY (`objective_id`) REFERENCES `objectives` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_objectives_unsuitable`
--

LOCK TABLES `dish_objectives_unsuitable` WRITE;
/*!40000 ALTER TABLE `dish_objectives_unsuitable` DISABLE KEYS */;
INSERT INTO `dish_objectives_unsuitable` VALUES (8,1),(11,1),(17,1),(19,1),(24,1);
/*!40000 ALTER TABLE `dish_objectives_unsuitable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `place_in_meal` enum('breakfast dish','main dish','dessert','starter','snack','main course') DEFAULT NULL,
  `instructions` varchar(2000) DEFAULT NULL,
  `video_link` varchar(100) DEFAULT NULL,
  `ingredients` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,'Green No-Bean Hummus','main course','Trim ends from zucchini and cut into quarters. Trim out seeds if zucchini are really big. Cut into 1 ½-inch pieces and add to a bowl. Toss thoroughly with 2 tablespoons kosher salt and let sit for 15 to 20 minutes tossing halfway through.\n\nTransfer zucchini to a strainer and rinse off salt very thoroughly. Let drain well before transferring to a bowl.\n\nSet an oven rack about 6 inches from the heat source and preheat the oven\'s broiler. Line a baking sheet with foil.\n\nToss zucchini with 2 tablespoons olive oil, toss, and spread out in a single layer on the prepared baking sheet making sure zucchini pieces touch each other.\nBroil on high heat until zucchini start to brown and are lightly charred 5 to 6 minutes. Remove pan and turn zucchini pieces over. Return and broil until zucchini are tender but not mushy and nicely browned 5 to 6 minutes longer.\n\nTransfer zucchini to a strainer and let drain until cooled to room temperature, about 45 minutes.\nCombine drained zucchini, tahini, garlic, lemon juice, basil, ½ teaspoon salt, cumin, black pepper, and cayenne in a blender. Blend until\nsmooth, and taste for seasoning. You can also use an immersion blender.\nWrap and chill before serving.','https://youtu.be/141eJQmCE58','2 1/2 pounds zucchini\n\n2 tablespoons kosher salt\n\n4 tablespoons olive oil\n3 cloves crushed garlic\n\n3 tablespoons tahini\n\n1/2 lemon\n\n6 leaf basil leaves\n\n1/4 teaspoon ground black pepper\n\n1/4 teaspoon cumin\n\n1 pinch cayenne'),(2,'Parmesan Cheese Crisps','main course','Preheat the oven to 400 degrees F or 200 degrees C. Line a baking sheet with parchment paper or a silicone baking mat.\n\nUsing a tablespoon, create 16 mounds of cheese, about 2 inches in diameter, spaced at least 1 inch apart, on the prepared baking sheet. Press down on the middle of each mound to make them evenly thick.\n\nBake in the preheated oven until cheese is completely melted and edges are browned, 4 to 6 minutes. Remove from the oven to cool for 15 minutes. Remove from baking sheet and store at room temperature in an air-tight container for up to 5 days.','https://youtu.be/TANnk-cJDGg','1 cup shredded Parmesan cheese'),(3,'Air Fryer Sweet Potato','main course','Slice potato into 1/16-inch-thick rounds using a mandoline. Put potato slices in a large bowl of cold water; soak about 20 minutes. Drain and pat dry with paper towels. Wipe out bowl.\n\nReturn potato slices to dried bowl. Add oil, salt, and pepper; toss gently to coat.\n\nPreheat air fryer to 350 degrees F (175 degrees C). Lightly coat air fryer basket with cooking spray. Working in batches if needed, arrange potato slices in an even layer in basket (do not overcrowd).\n\nCook until lightly golden and crispy, 12 to 16 minutes, turning and rearranging chips into an even layer every 4 minutes. Watch closely during the last 2 to 3 minutes of cooking. Check chips about every 30 seconds, using tongs to remove golden chips from the basket as needed to avoid overcooking and ending up with bitter chips.\n\nLet chips cool about 5 minutes. Chips will continue to crisp as they cool.Store in an airtight container up to 3 days.','https://youtu.be/aWAJV2VYwtQ','1 large (8 ounces) sweet potato\n\n1 tablespoon canola oil\n\n1/4 teaspoon sea salt\n\n1/4 teaspoon freshly ground black pepper\n\ncooking spray'),(4,'Whole Wheat Chapati','main course','Mix flour and salt together in a bowl. Stir in water to form a soft dough.\n\nTurn dough out onto a lightly floured work surface and knead several times. Divide into 8 pieces and roll each into a ball. Roll each ball into a very thin round using a rolling pin.\n\nHeat a griddle over medium-high heat. Cook each dough round on griddle until dough bubbles and blisters appear, about 2 minutes. Flip and cook until lightly browned on the other side.','https://youtu.be/JGwcoa1lSZ4','2 ½ cups whole wheat flour\n\n¾ teaspoon salt\n\n1 cup water'),(5,'Sweet and Easy Corn','main course','Fill a large pot about 3/4 full of water and bring to a boil. Stir in sugar and lemon juice until sugar is dissolved.\n\nGently place ears of corn into boiling water, cover the pot, turn off the heat, and let corn cook in the hot water until tender, about 10 minutes.','https://youtube.com/shorts/qskzlscUnHQ?feature=share','2 tablespoons white sugar\n\n1 tablespoon lemon juice\n\n6 ears corn on the cob, husks and silk removed'),(6,'Miso Soup','main course','Combine water and dashi granules in a medium saucepan over medium-high heat; bring to a boil. Reduce heat to medium and whisk in miso paste. Stir in tofu. Separate the layers of green onions, and add them to the soup. Simmer gently for 2 to 3 minutes before serving.\n\n','https://youtu.be/lH7pgsnyGrI','4 cups water\n\n2 teaspoons dashi granules\n\n3 tablespoons miso paste\n\n1 (8 ounce) package silken tofu, diced\n\n2 green onions, sliced diagonally into 1/2 inch pieces'),(7,'Baked Kale Chips','main course','Preheat an oven to 300 degrees F (150 degrees C). Line a rimmed baking sheet with parchment paper.\nWith a knife or kitchen shears carefully remove kale leaves from the thick stems and tear into bite size pieces. \nWash and thoroughly dry kale with a salad spinner.\nDrizzle kale leaves with olive oil and toss to combine. Spread out in an even layer on the baking sheet without overlapping and sprinkle with salt.\nBake until the edges start to brown but are not burnt, 20 to 30 minutes.\n','https://youtu.be/jpJS-Ny1dNI','1 bunch kale\n\n1 tablespoon olive oil\n\n1 teaspoon flaked sea salt'),(8,'Homemade Applesauce','main course','Combine apples, water, sugar, and cinnamon in a saucepan; cover and cook over medium heat until apples are soft, about 15 to 20 minutes.\n\nAllow apple mixture to cool, then mash with a fork or potato masher until it is the consistency you like.','https://youtu.be/iu_6aOqjfnA','4 apples - peeled, cored and chopped\n\n¾ cup water\n\n¼ cup white sugar\n\n½ teaspoon ground cinnamon'),(9,'Crispy Hash Browns','main course','Rinse shredded potatoes until water is clear, then drain and squeeze dry.\n\nPlace shreds in a bowl and mix in the onion, flour, and egg until evenly distributed.\nHeat about 1/4 inch of oil in a large heavy skillet over medium-high heat. When oil is sizzling hot, place potatoes into the pan in a 1/2 inch thick layer. Cover the whole bottom of the pan, or make separate piles like pancakes.\n\nCook until nicely browned on the bottom, then flip over and brown on the other side. It should take at least 5 minutes per side. If you are cooking them in one big piece, it can be cut into quarters for easier flipping.\n\nRemove from pan, and drain on paper towels. Season with salt and pepper and serve immediately.','https://youtu.be/7xDmCLP5mhY','2 medium russet potatoes, shredded\n\n½ medium onion, finely chopped\n\n¼ cup all-purpose flour\n\n1 egg\n\n1 cup oil for frying, or as needed\n\nsalt and pepper to taste'),(10,'Split Pea Soup','main course','Place peas in a large stockpot and cover with several inches of cold water; let soak, 8 hours to overnight. Drain, rinse, and return peas to the pot.\n\nAdd 2 quarts of cold water, ham bone, onion, salt, pepper, and marjoram to the stockpot. Cover, bring to a boil, and simmer for 1 1/2 hours, stirring occasionally.\n\nRemove ham bone; cut off meat, dice, and return meat to soup. Add celery, carrots, and potatoes. Cook slowly, uncovered, until vegetables are tender, about 30 to 40 minutes.','https://youtu.be/LUcWb8eemzs','2 ¼ cups dried split peas\n\n2 quarts cold water, plus more as needed\n\n1 ½ pounds ham bone\n\n2 onions, thinly sliced\n\n½ teaspoon salt\n\n¼ teaspoon ground black pepper\n\n1 pinch dried marjoram\n\n3 stalks celery, chopped\n\n3 carrots, chopped\n\n1 potato, diced'),(11,'Gnocchi','main course','Bring a large pot of salted water to a boil; add potatoes and cook until tender but still firm, about 15 minutes. Drain, cool, and mash with a fork or potato masher.\n\nCombine 1 cup mashed potato, flour, and egg in a large bowl. Knead until dough forms a ball. Shape small portions of the dough into long \"snakes\". On a floured surface, cut snakes into 1/2-inch pieces.\n\nBring a large pot of lightly salted water to a boil. Drop in gnocchi and cook for 3 to 5 minutes or until gnocchi have risen to the top; drain and serve.','https://youtu.be/NCTGmbAnn44','2 potatoes, peeled\n\n2 cups all-purpose flour\n\n1 egg'),(12,'Maple Salmon','main course','Stir maple syrup, soy sauce, garlic, garlic salt, and pepper together in a small bowl.\n\nCut salmon into 4 equal-sized fillets; place in a shallow glass baking dish and coat with maple syrup mixture. Cover the dish and marinate salmon in the refrigerator for 30 minutes, turning once halfway.\n\nPreheat the oven to 400 degrees F (200 degrees C).\n\nPlace the baking dish in the preheated oven and bake salmon uncovered until flesh easily flakes with a fork, about 20 minutes.','https://youtube.com/shorts/oky29PreO3A?feature=share','¼ cup maple syrup\n\n2 tablespoons soy sauce\n\n1 clove garlic, minced\n\n¼ teaspoon garlic salt\n\n⅛ teaspoon ground black pepper\n\n1 pound salmon'),(13,'Roasted New Red Potatoes','main course','Preheat the oven to 400 degrees F (200 degrees C) and adjust the oven rack to the lowest position.\n\nToss potatoes with oil, salt, and pepper in a bowl. Arrange, cut-side down, on a rimmed cookie sheet or jellyroll pan.\n\nRoast potatoes in the preheated oven until tender and golden brown, 20 to 30 minutes. Transfer to a serving dish.','https://youtu.be/oeDyfE9SETU','3 pounds small red new potatoes, halved\n\n¼ cup olive oil\n\n1 teaspoon salt and freshly ground black pepper'),(14,'Black Beans and Rice','main course','Heat oil in a saucepan over medium-high heat. Add onion and garlic; cook and stir until onion has softened, about 4 minutes. Stir in rice to coat; cook and stir for 2 minutes.\n\nAdd vegetable broth and bring to a boil. Cover, reduce to a simmer, and cook until liquid is absorbed, about 20 minutes.\n\nStir in beans, cumin, and cayenne; cook until beans are warmed through.','https://youtu.be/FEaYZl89NqQ','1 teaspoon olive oil\n\n1 onion, chopped\n\n2 cloves garlic, minced\n\n¾ cup uncooked white rice\n\n1 ½ cups low sodium, low fat vegetable broth\n\n3 ½ cups canned black beans, drained\n\n1 teaspoon ground cumin\n\n¼ teaspoon cayenne pepper'),(15,'Refried Beans','main course','Heat canola oil in a heavy skillet over medium heat.\n\nCook garlic cloves in hot oil, turning once, until brown on both sides, 4 to 5 minutes. Smash garlic cloves in the skillet with a fork.\n\nStir pinto beans, cumin, chili powder, and salt into mashed garlic and cook until beans are thoroughly heated, about 5 minutes. Stir occasionally.\n\nSmash bean mixture with a potato masher to desired texture. Squeeze lime juice over smashed beans and stir until combined.','https://youtu.be/fO5BosTSo6I','2 tablespoons canola oil\n\n2 garlic cloves, peeled\n\n2 (15 ounce) cans pinto beans\n\n1 teaspoon cumin\n\n1 teaspoon chili powder\n\nsalt to taste\n\n½ lime, juiced'),(16,'Turkey Chili','main course','Heat oil in a large pot over medium heat. Add turkey; cook and stir until evenly browned, 6 to 8 minutes. Stir in onion and cook until tender.\n\nAdd water; mix in tomatoes, kidney beans, and garlic. Stir in chili powder, paprika, oregano, cayenne pepper, cumin, salt, and pepper.\n\nBring to a boil. Reduce heat to low, cover, and simmer for 30 minutes.','https://youtu.be/msChF4tLnsI','1 ½ teaspoons olive oil\n\n1 pound ground turkey\n\n1 onion, chopped\n\n2 cups water\n\n1 (28 ounce) can canned crushed tomatoes\n\n1 (16 ounce) can canned kidney beans - drained, rinsed, and mashed\n\n1 tablespoon garlic, minced\n\n2 tablespoons chili powder\n\n½ teaspoon paprika\n\n½ teaspoon dried oregano\n\n½ teaspoon ground cayenne pepper\n\n½ teaspoon ground cumin\n\n½ teaspoon salt\n\n½ teaspoon ground black pepper'),(17,'Whole Wheat Bread','main course','Mix warm water, yeast, and 1/3 cup honey in a large bowl to dissolve. Add 5 cups bread flour, and stir to combine. Let sit for 30 minutes, or until big and bubbly.\n\nMix in 3 tablespoons melted butter, remaining 1/3 cup honey, and salt. Stir in 2 cups whole wheat flour. Transfer dough to a floured work surface and gradually knead in remaining 2 cups whole wheat flour. Knead until dough starts to pull away from the work surface, adding more whole wheat flour if necessary; dough should be a bit tacky to the touch, but not too sticky.\n\nPlace in a greased bowl, turning once to coat the surface of the dough. Cover with a dish towel and let rise in a warm place until doubled, 45 minutes to 1 hour.\n\nGrease three 9x5-inch loaf pans. Punch down the dough, and divide it into 3 loaves. Place in the prepared loaf pans, and allow to rise until dough has topped the pans by one inch, another 45 minutes to 1 hour.\n\nMeanwhile, preheat the oven to 350 degrees F (175 degrees C).\n\nBake the risen loaves in the preheated oven until golden brown for 25 to 30 minutes, do not overbake.\n\nLightly brush the tops of the loaves with remaining 2 tablespoons melted butter when done to prevent crust from getting hard. Cool completely.','https://youtube.com/shorts/ZaeJiJ-76-M?feature=share','3 cups warm water (110 degrees F/45 degrees C)\n\n2 (.25 ounce) packages active dry yeast\n\n⅔ cup honey, divided\n\n5 cups bread flour\n\n5 tablespoons butter, melted, divided\n\n1 tablespoon salt\n\n4 cups whole wheat flour, or more as needed'),(18,'Baked Tilapia','main course','Preheat the oven to 375 degrees F (190 degrees F). Grease a 9x13-inch baking dish.\n\nPlace tilapia fillets in the bottom of the baking dish, then dot with butter and season with garlic salt and seafood seasoning.\nTop each fillet with a slice or two of lemon.\nArrange frozen mixed vegetables around fillets and season lightly with salt and pepper. Cover the dish with aluminum foil.\nBake in the preheated oven until vegetables are tender and fish flakes easily with a fork, 25 to 30 minutes.\n\n','https://youtu.be/a9kG5yGDKV4','4 (4 ounce) fillets tilapia\n\n2 teaspoons butter\n\n½ teaspoon garlic salt, or to taste\n\n¼ teaspoon seafood seasoning (such as Old Bay®), or to taste\n\n1 lemon, sliced\n\n1 (16 ounce) package frozen cauliflower with broccoli and red pepper\n\nsalt and ground black pepper to taste'),(19,'Pesto Pasta with Chicken','main course','Bring a large pot of lightly salted water to a boil. Add pasta and cook until al dente, 8 to 10 minutes; drain.\n\nHeat oil in a large skillet over medium heat. Sauté garlic until tender, then stir in chicken and season with red pepper flakes. Cook until chicken is golden and cooked through.\n\nCombine pasta, chicken, pesto, and sun-dried tomatoes in a large bowl; toss to coat evenly.','https://youtu.be/fqLZ5Wmf9YE','1 (16 ounce) package bow tie pasta\n\n1 teaspoon olive oil\n\n2 cloves garlic, minced\n\n2 skinless, boneless chicken breasts, cut into bite-sized pieces\n\n1 pinch crushed red pepper flakes, or to taste\n\n½ cup pesto sauce\n\n⅓ cup oil-packed sun-dried tomatoes, drained and cut into strips'),(20,'Fajita Marinade','main course','Whisk water, lime juice, olive oil, garlic, soy sauce, salt, and liquid smoke flavoring together in a bowl. Stir in cayenne and black pepper until combined.\n\nUse to marinate 2 pounds of meat; marinate in the refrigerator for at least 2 hours to overnight before cooking as desired.\n\n','https://youtu.be/wiw6Ld-KXB4','⅓ cup water\n\n¼ cup lime juice\n\n2 tablespoons olive oil\n\n4 cloves garlic, crushed\n\n2 teaspoons soy sauce\n\n1 teaspoon salt\n\n½ teaspoon liquid smoke flavoring\n\n½ teaspoon cayenne pepper\n\n½ teaspoon ground black pepper'),(21,'Sweet Potato Casserole','main course','Place sweet potatoes in a large pot and cover with salted water; bring to a boil. Reduce heat to medium-low and simmer until tender, about 20 minutes; drain.\n\nPreheat the oven to 375 degrees F (190 degrees C). Grease a deep casserole dish.\n\nMash potatoes with a potato masher in a bowl until no large lumps remain. Stir in both sugars, cinnamon, and butter until well combined, then transfer to the prepared casserole dish. Cover with a layer of miniature marshmallows.\n\nBake in the preheated oven until marshmallows are browned, about 30 minutes.','https://youtu.be/EQoqBJUp6mc','6 large sweet potatoes, peeled and cut into chunks\n\n1 cup white sugar\n\n½ cup brown sugar\n\n2 tablespoons ground cinnamon\n\n1 tablespoon butter, softened\n\n1 cup miniature marshmallows, or as needed'),(22,'Quick Slow Cooker Turkey Chili','main course','Heat oil in a skillet over medium heat. Place turkey in the skillet, and cook until evenly brown; drain.\n\nCoat the inside of a slow cooker with cooking spray, and mix in turkey, tomato soup, kidney beans, black beans, and onion. Season with chili powder, garlic powder, cumin, red pepper flakes, black pepper, allspice, and salt.\n\nCover, and cook on Low for 8 hours, or on High for 4 hours.','https://youtu.be/7mafcwYU7CY','1 tablespoon vegetable oil\n\n1 pound ground turkey\n\ncooking spray\n\n2 (10.75 ounce) cans low sodium tomato soup\n\n2 (15 ounce) cans kidney beans, drained\n\n1 (15 ounce) can black beans, drained\n\n½ medium onion, chopped\n\n2 tablespoons chili powder\n\n½ tablespoon garlic powder\n\n½ tablespoon ground cumin\n\n1 teaspoon red pepper flakes\n\n1 pinch ground black pepper\n\n1 pinch ground allspice\n\nsalt to taste'),(23,'Brazilian Grilled Pineapple','main course','Preheat an outdoor grill for medium-high heat and lightly oil the grate.\n\nWhisk brown sugar and cinnamon together in a bowl.\n\nTransfer into a large resealable plastic bag. Add pineapple wedges to the bag; shake well to coat each wedge.\n\nGrill pineapple wedges on the preheated grill until heated through, 3 to 5 minutes per side.','https://youtu.be/qc2_FUa83j4','1 cup brown sugar\n\n2 teaspoons ground cinnamon\n\n1 pineapple - peeled, cored, and cut into 6 wedges'),(24,'German Potato Pancakes','main course','Beat eggs, flour, baking powder, salt, and pepper together in a large bowl; stir in potatoes and onion.\n\nHeat oil in a large skillet over medium heat. Drop heaping tablespoonfuls of potato mixture into hot oil in batches. Press to flatten. Cook until browned and crisp, about 3 minutes on each side. Transfer to a paper towel-lined plate to drain. Repeat with remaining potato mixture.','https://youtu.be/obs5MhNA4Rs','2 large eggs\n\n2 tablespoons all-purpose flour\n\n¼ teaspoon baking powder\n\n½ teaspoon salt\n\n¼ teaspoon pepper\n\n6 medium potatoes, peeled and shredded\n\n½ cup finely chopped onion\n\n¼ cup vegetable oil'),(25,'Baked Honey Mustard Chicken','main course','Preheat the oven to 350 degrees F (175 degrees C). Lightly grease a 9x13-inch baking dish with cooking spray.\n\nSeason chicken breasts with salt and pepper. Place in the prepared baking dish.\n\nCombine honey, mustard, basil, paprika, and parsley in a small bowl; mix well. Pour 1/2 of the honey mustard mixture over chicken and brush to cover.\n\nBake in the preheated oven for 30 minutes. Turn chicken pieces over and brush with remaining honey mustard mixture. Continue baking until chicken is no longer pink and juices run clear, 10 to 15 minutes more. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).\n\nLet cool 10 minutes before serving.','https://youtu.be/3o-8TT-E0Y4','cooking spray\n\n6 skinless, boneless chicken breast halves\n\nsalt and pepper to taste\n\n½ cup honey\n\n½ cup prepared mustard\n\n1 teaspoon dried basil\n\n1 teaspoon paprika\n\n½ teaspoon dried parsley'),(26,'Puerto Rican Tostones (Fried Plantains)','main course','Peel plantain and cut into 1-inch slices. Fill a bowl with 3 cups of cold water.\n\nHeat oil in a large deep skillet over medium-high heat; add plantain slices in an even layer and fry on both sides until golden brown, about 3 1/2 minutes per side. Set skillet aside.\n\nTransfer plantain slices to a chopping board; flatten each one by placing a small plate on top and pressing down. Dip plantain slices in cold water.\n\nReheat oil in the skillet over medium heat; cook plantain slices for 1 minute on each side. Season to taste with salt and serve immediately.','https://youtu.be/v6RNXM1RA-E','1 green plantain\n\n5 tablespoons oil for frying\n\n3 cups cold water\n\nsalt to taste'),(27,'Pan Fried Brussels Sprouts','main course','Heat olive oil in a cast-iron skillet over medium-low heat. Add garlic and stir until golden brown and fragrant, about 2 to 3 minutes. Add onion and cook until soft, stirring often, about 5 minutes.\n\nAdd Brussels sprouts and cook until one side of the sprouts turns golden brown, 5 to 7 minutes. Stir to turn sprouts over and cook until evenly golden brown, another 5 to 7 minutes. Season with salt, black pepper, and garlic powder.','https://youtu.be/jDulZ6GAIZo','1 tablespoon olive oil\n\n2 teaspoons crushed garlic\n\n¼ white onion\n\n1 pound trimmed Brussels sprouts\n\nsalt and ground black pepper to taste\n\n1 pinch garlic powder, or to taste'),(28,'Bean Salad','main course','Combine garbanzo beans, kidney beans, black beans, green beans, wax beans, green pepper, onion, and celery in a large bowl; toss to mix.\n\nWhisk together sugar, oil, vinegar, salt, and pepper in a separate bowl until sugar is dissolved; pour over bean mixture. Mix well.\n\nRefrigerate salad for 8 hours to overnight before serving.','https://youtu.be/ytk6OEiQGIA','1 (15.5 ounce) can garbanzo beans, drained\n\n1 (14.5 ounce) can kidney beans, drained\n\n1 (14.5 ounce) can black beans, drained\n\n1 (14.5 ounce) can green beans, drained\n\n1 (14.5 ounce) can wax beans, drained\n\n½ cup chopped green pepper\n\n½ cup chopped onion\n\n½ cup chopped celery\n\n¾ cup white sugar\n\n½ cup salad oil\n\n½ cup vinegar\n\n½ teaspoon salt\n\n½ teaspoon ground black pepper'),(29,'Roasted Garlic Lemon Broccoli','main course','Preheat the oven to 400 degrees F (200 degrees C).\n\nToss broccoli florets with extra virgin olive oil, sea salt, pepper, and garlic in a large bowl. Spread the broccoli out in an even layer on a baking sheet.\n\nBake in the preheated oven until florets are tender enough to pierce the stems with a fork, 15 to 20 minutes. Remove and transfer to a serving platter.\n\nSqueeze lemon juice liberally over broccoli before serving for a refreshing, tangy finish.','https://youtu.be/dD-NPrBauck','2 heads broccoli, separated into florets\n\n2 teaspoons extra-virgin olive oil\n\n1 teaspoon sea salt\n\n½ teaspoon ground black pepper\n\n1 clove garlic, minced\n\n½ teaspoon lemon juice'),(30,'Black Bean Veggie Burgers','main course','Preheat an outdoor grill for high heat. Lightly oil a sheet of aluminum foil with cooking spray.\n\nMash black beans in a medium bowl with a fork until thick and pasty.\n\nFinely chop bell pepper, onion, and garlic in a food processor. Stir chopped vegetables into mashed beans.\n\nStir together egg, chili powder, cumin, and chili sauce in a small bowl. Add to the mashed beans and stir to combine. Mix in bread crumbs until the mixture is sticky and holds together.\n\nDivide the mixture into four patties and place on the prepared foil.\n\nGrill on the preheated grill for about 8 minutes on each side.','https://youtu.be/9OMunBJ8egE','cooking spray\n\n1 (16 ounce) can black beans, drained and rinsed\n\n½ green bell pepper, cut into 2 inch pieces\n\n½ onion, cut into wedges\n\n3 cloves garlic, peeled\n\n1 egg\n\n1 tablespoon chili powder\n\n1 tablespoon cumin\n\n1 teaspoon Thai chili sauce or hot sauce\n\n½ cup bread crumbs');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_objectives`
--

DROP TABLE IF EXISTS `exercise_objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_objectives` (
  `exercise_id` int NOT NULL,
  `objective_id` int NOT NULL,
  PRIMARY KEY (`exercise_id`,`objective_id`),
  KEY `objective_id` (`objective_id`),
  CONSTRAINT `exercise_objectives_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`),
  CONSTRAINT `exercise_objectives_ibfk_2` FOREIGN KEY (`objective_id`) REFERENCES `objectives` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_objectives`
--

LOCK TABLES `exercise_objectives` WRITE;
/*!40000 ALTER TABLE `exercise_objectives` DISABLE KEYS */;
INSERT INTO `exercise_objectives` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(17,4),(18,4),(19,4),(20,4),(21,4),(22,4),(23,4),(24,4),(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(17,5),(18,5),(19,5),(20,5),(21,5),(22,5),(23,5),(24,5),(25,5),(26,5),(27,5),(28,5),(29,5),(30,5);
/*!40000 ALTER TABLE `exercise_objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_physical_limitations`
--

DROP TABLE IF EXISTS `exercise_physical_limitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_physical_limitations` (
  `exercise_id` int NOT NULL,
  `physical_limitation_id` int NOT NULL,
  PRIMARY KEY (`exercise_id`,`physical_limitation_id`),
  KEY `physical_limitation_id` (`physical_limitation_id`),
  CONSTRAINT `exercise_physical_limitations_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`),
  CONSTRAINT `exercise_physical_limitations_ibfk_2` FOREIGN KEY (`physical_limitation_id`) REFERENCES `physical_limitations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_physical_limitations`
--

LOCK TABLES `exercise_physical_limitations` WRITE;
/*!40000 ALTER TABLE `exercise_physical_limitations` DISABLE KEYS */;
INSERT INTO `exercise_physical_limitations` VALUES (1,3),(25,3),(27,3),(1,4),(25,4),(1,5);
/*!40000 ALTER TABLE `exercise_physical_limitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `position_in_workout` enum('warmup','cooldown','middle') DEFAULT NULL,
  `sets` int DEFAULT NULL,
  `reps_or_time` varchar(20) DEFAULT NULL,
  `instructions` varchar(1000) DEFAULT NULL,
  `video_link` varchar(100) DEFAULT NULL,
  `muscle_group` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,'Squat, Leg','middle',3,'15','Squat and test. Find your best position that allows for the greatest range of motion. The shape of your pelvis and hip capsule is unique to you. Your femur should freely move up and you should feel totally balanced. If you don\'t, try elevating your heels on plates. Pull yourself under the bar with a close stand placing the bar on top of your traps. Keep the grip close. Hands as close to the shoulders as you can manage. Pinch your back together and pull the bar down into your traps to tension the back. Slide the knees forward placing the hips under the bar. Stand steady then step two steps behind. Tuck and level your hips. Lightly schew the feet into the ground to help stabilize the hips. Breathe deep into your belly and brace like expecting a punch. Slide the hips back. Very slightly sink straight down between your legs. Depth may vary. Keep the bar over the middle of your feet with equal balance from heel to toe. Drive up. The hips and bar should rise at the same rate of speed.','https://youtube.com/shorts/MLoZuAkIyZI?feature=share','leg'),(2,'Bench Press, Chest','middle',3,'15','Rotate your palms in so the bar lays over the wrist. Firm grip. Thumbs wrapped. For the perfect width, place the empty bar at the base of your chest. Adjust your grip so the forearms are vertical at the bottom. This will natually angle the arms downwards. \nWide stance. Drive heels down. Push knees out. Position your eyes just on the edge of the bar. \nLightly drive the feet forward activating the lower body. \nSqueeze the shoulders down lightly pressing your hands into the bar. Inhale deeply and brace the core as if you were about to get punched. \nLower the bar down to the base of your chest. The bar path will be a slight angle or an arc. Make contact and then press up back over the shoulder.','https://youtube.com/shorts/EdDqD4aKwxM?feature=share','chest'),(3,'Lumbar Cable Row, Back','middle',3,'15','D shape handle. Strap up. Kneel side down behind the bench. Stabilize by driving your hand down and holding your hip into the end. \nLean slightly forward and rotate towards your working arm. Hold the shoulder down and then row keeping your arm tucked in. Then, gradually control it back. ','https://youtube.com/shorts/G18ysBYu5Mw?feature=share','back'),(4,'Lateral raise, Arm','middle',3,'15','Instead of pushing the weight directly out to the side, shift your arms forward by about 30 degrees. \nSlightly push forward and imagine that you are pushing the weight away from you out to the walls . ','https://youtube.com/shorts/JIhbYYA1Q90?feature=share','arm'),(5,'Long Overhead Tricep, Arm ','middle',3,'15','Arms down at your side. Angle yourself 45 degree to a cable. Shoulder held in neutral. Arm out 30 degrees. \nExtend to a full lockout. You must keep the cable in line with your arm at the same angle at all times. Never allowing your elbow to rotate away from it. ','https://youtube.com/shorts/rzTapF3new8?feature=share','arm'),(6,'Medial and Lateral Heads, Arm','middle',3,'15','The smith machine JM press with resistance band. Essentially a mix between a close grip bench and a skull crusher down towards the neck or chin exploding up. This movement places the most tension on the triceps.','https://youtube.com/shorts/rzTapF3new8?feature=share','arm'),(7,'Barbell curl,Arm ','middle',3,'15','Take a comfortable shoulder width grip on the bar. Slightly push your hips back and bend at the knees so that your arms hang vertically with the bar lightly in contact with your legs. Tighten your core. \nFlex your pecs. This will keep your elbows held in at your side and create a tight back that will support you.\nPowerfully curl the weight up as far as you possibly can. ','https://youtube.com/shorts/N6paU6TGFWU?feature=share','arm'),(8,'Hammer curl, Arm','middle',3,'15','Take a neutral grip. You can take a grip that is closer to the top as you do the movement. Place your dumbbell on the side. \nPowerfully curls your arms while keeping the elbow stable. ','https://youtube.com/shorts/OPhgvwKBOwI?feature=share','arm'),(9,'Reverse curl, Arm','middle',3,'15','Take a comfortable shoulder width grip on the bar with your knuckles facing upwards. Slightly push your hips back and bend at the knees so that your arms hang vertically with the bar lightly in contact with your legs. Tighten your core. \nPowerfully curl the weight up as far as you possibly can. ','https://youtu.be/nRgxYX2Ve9w','arm'),(10,'Cable wrist Curl, Arm','middle',3,'15','Stand up in front of the machine while adjusting the cable outlet below your waist level. \nHave a neutral grip on the bar facing downward at a shoulder wide length. \nRelease your fingers and pull them back keeping the position.  \n','https://youtu.be/WVAaKJvToe0','arm'),(11,'Shoulder press machine, Arm','middle',3,'15','Adjust the seat depending on your height. Plant your feet into the ground.\nStart with lower weight. Take a neutral grip. Get the back and head nice and flat against the machine. \nLook forward and lift the handles all the way up and bring them all the way down. Keep the forearm in a straight line for not putting too much stress on the shoulder. ','https://youtu.be/3R14MnZbcpw','arm'),(12,'Reverse cable  fly, Arm','middle',3,'15','Adjust the cable machine putting it over your head level. \nGrab the cable and form an angle with your forearm with the cable. \nSlightly move away from the machine. While keeping stability with your other hand holding the machine, pull the cable on your working arm keeping it straight. ','https://youtube.com/shorts/t-pThnY7ZH4?feature=share','arm'),(13,'Incline cable press, Chest','middle',3,'15','Adjust the cable machine. Grab the seat and place it facing forward in front of the machine.\nPut your back and head flat on the seat. Pull the cable and put your arms up making the chest area poping forward out of the body. The upper arm must be going through a part of motion in line with how the clavicular division is pulling. ','https://youtu.be/CNvSbud0HgM','chest'),(14,'Chest press, Chest','middle',3,'15','Take proper sitting position on the machine. \nRest your head on the seat. Scoop your hip forward to keep your chest high and the elbows are going to comback at about 45 degrees. \nPowerfully push forward the handles. Bring them back. Control the motion. ','https://youtube.com/shorts/wqdBSFqiw0g?feature=share','chest'),(15,'Incline cable fly, Chest','middle',3,'15','Bring your bench and place it directly in the center of the cable system. You\'re\ngoing to be using the D handles. Take a seat with feet firmly on the floor.\nLay back on the bench. Keep your back nice and flat. \nSlightly bending your elbows, bring the weight straight around to the middle of the chest. Exhale.\nInhale all the way back. Exhale.\nStay in control.\n','https://youtu.be/GtHNC-5GtR0','chest'),(16,'T bar row, Back','middle',3,'15','Prepare your bar and weights. Grab the bar with weight on it. Brace your core tight. Get your hips back. \nLift while trying to be as parallel with the floor as you can to get the most out of this exercise\nStay in control of the motion.','https://youtube.com/shorts/8c23NBbwLBc?feature=share','back'),(17,'Pull down, Back','middle',3,'15','Sit on the seat that comes with the machine. \nGrab the bar for a pulling position. Place your shoulders in a position where they are not compromised. So you don\'t have to worry about shoulder issues.  \nKeep your chest up. Pull down while maintaining your elbows not to be drawn back. Keep your elbows slightly in front of you and in line with your hips as you pull down. Do not focus on your biceps.','https://youtu.be/CAwf7n6Luuc','back'),(18,'Low row, Back','middle',3,'15','Adjust the weight on the machine. Take position. \nSlightly bend in your knees. Maintain a neutral spine.\nMake sure the shoulders  are down and the chest is out maintaining an arch of your back.\nPull your hands towards your torso squeezing everything  tight. Keep squeezing until you comes back to 90 degree angle. Breathe out. \nPull again while breathing in.','https://youtu.be/GZbfZ033f74','back'),(19,'Deadlift, Back','middle',3,'15','Approach the bar so that your shins are one inch away from the barbell putting it directly in the middle of your foot.\nWithout bending your shins, grab the barbell. \nPush your knees forwards until your shins meet the barbell dropping your hips down into position.\nPush your chest through and pull your shoulders down towards your hips.\nPush your knees out into your forearms and drag the barbell directly up your legs.\nPush your hips back and lower the bar down the floor.','https://youtube.com/shorts/vfKwjT5-86k?feature=share','back'),(20,'Pull up, Back','middle',3,'15','Take position on the pull bar. Make sure to pull your shoulder down and hold that position the entire movement.\nScoop your shoulder blades underneath and pull up. \nKeep the position and breathing along the way.\n','https://youtube.com/shorts/dvG8B2OjfWk?feature=share','back'),(21,'Trap bar deadlift, Leg','middle',3,'15','It keeps the load more in line with the center of the mask than a straight bar.\nTake the position. Focus on the top down variation.\nArch your back with neutral position. Lift it. Knees are slightly unlocked.\nNo squatting. All the movement comes from the hips.','https://youtu.be/ud5SXOI-b70','leg'),(22,'Cross body RDL, Leg','middle',3,'15','Grab a dumbbell. Hold it with a hand. \nShoulder length leg position. From a standing up position, lean forward with a dumbbell across the body. \nKnees are slightly unlocked. All movement comes from the hips.\n\n','https://youtu.be/1izeGIHHbTg','leg'),(23,'Cable kickback, Leg','middle',3,'15','Cable down nice and low. Attach the cable to one leg. \nLean into the cable system. Shoulder down. Arch through the back.\nSlight bend in the knees.\nBring the foot up and back. Squeeze in the glute. Lower back down.\nYou can add extra rotation focusing the glute area. ','https://youtu.be/ifP5sFBT7IE','leg'),(24,'Standing calf raises, Leg','middle',3,'15','Stand next to a step or block. Place the feet on the edge. \nLet your heels drop down towards the floor as far as possible. \nSlowly raise the heels up as high as possible squeezing your calves at the top of the range of motion.\nHold for a second and slowly return back to the starting position.','https://youtu.be/k8ipHzKeAkQ','leg'),(25,'Staggered stance deadlift, Leg','middle',3,'15','Grab the dumbbells and take the stance.\nSlide the left leg back. Most of the weight should still be in the front foot.\nFold at the hip keeping the balance over the front leg. Feel the stretch coming back up.\nMake sure you are using a little bit of pressure in the back foot.\nMake sure the hips does not open so both hips should go back together.\n','https://youtu.be/Th4QdA2BOyg','leg'),(26,'Seated leg curl, Leg','middle',3,'15','Sit down on the machine. Adjust the back rest.\nYou want to be a little more forward because your feet are to be on the pat and your legs are to be coming down towards you. \nWhen you are  ready, curl your leg. Maintain the motion, not too fast, not too slow. ','https://youtu.be/fK0uZ3KRZRI','leg'),(27,'Leg press, Leg','middle',3,'15','Take position on the machine with your feet slightly angled out. Position a tiny bit wider and mayble higher. \nAdjust the seat. The range of motion is important. Make it a slightly close to the pads.\nExtend your leg and feel the press along the motion. \n','https://youtu.be/ZDsiwCn6zA4','leg'),(28,'Adductor machine, Leg','middle',3,'15','Take position on the seat. Bring yourself up first, grab the adjuster and bring it out. \nUse the hands to press in the pads. \nEnsure the feet are pressing into the floor.\nUse the adductor to control the resistance as much as possible.\nKeep yourself upright.\nAllow the weight to stretch. Use the inside of your legs to drive the weight in.\n','https://youtube.com/shorts/LM_NZjWAsSo?feature=share','leg'),(29,'Sissy squat machine, Leg','middle',3,'15','Adjust the pads height, straight up right and another one to rest your feet. \nThe set up should give you a solid range of motion.\nSlide your feet, stand up straight and sit back. Don\'t bend your knees forward.\nMake sure you are doing a slow controlled fashion stand all the way up and go as low as you can.','https://youtu.be/nd6J1SgfKlY','leg'),(30,'Leg extension, Leg','middle',3,'15','Sit down on the machine. Adjust the pads height. Hands on the handle to get more support.\nThe set up should give you a solid range of motion.\nSlide your feet under the pads. Slightly lean forwards for better contraction in your quads\nMake sure you are doing a slow controlled movement.','https://youtube.com/shorts/fP6uMgfwqOA?feature=share','leg');
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_dishes`
--

DROP TABLE IF EXISTS `meal_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_dishes` (
  `meal_id` int NOT NULL,
  `dish_id` int NOT NULL,
  PRIMARY KEY (`meal_id`,`dish_id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `meal_dishes_ibfk_1` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`),
  CONSTRAINT `meal_dishes_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_dishes`
--

LOCK TABLES `meal_dishes` WRITE;
/*!40000 ALTER TABLE `meal_dishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meal_of_day` enum('Breakfast','Lunch','Dinner/Supper','Mid-morning Snack','Mid-afternoon Snack') DEFAULT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `meals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectives`
--

DROP TABLE IF EXISTS `objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectives`
--

LOCK TABLES `objectives` WRITE;
/*!40000 ALTER TABLE `objectives` DISABLE KEYS */;
INSERT INTO `objectives` VALUES (1,'lose fat'),(2,'gain muscle'),(3,'imporve overall athletic ability'),(4,'improve cardiovascular conditioning'),(5,'general wellbeing');
/*!40000 ALTER TABLE `objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_limitations`
--

DROP TABLE IF EXISTS `physical_limitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physical_limitations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_limitations`
--

LOCK TABLES `physical_limitations` WRITE;
/*!40000 ALTER TABLE `physical_limitations` DISABLE KEYS */;
INSERT INTO `physical_limitations` VALUES (1,'asthma'),(2,'heart condition'),(3,'acid reflux'),(4,'joint issues'),(5,'overweight'),(6,'flat feet');
/*!40000 ALTER TABLE `physical_limitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dietary_restrictions`
--

DROP TABLE IF EXISTS `user_dietary_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dietary_restrictions` (
  `user_id` int NOT NULL,
  `dietary_restriction_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`dietary_restriction_id`),
  KEY `dietary_restriction_id` (`dietary_restriction_id`),
  CONSTRAINT `user_dietary_restrictions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_dietary_restrictions_ibfk_2` FOREIGN KEY (`dietary_restriction_id`) REFERENCES `dietary_restrictions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dietary_restrictions`
--

LOCK TABLES `user_dietary_restrictions` WRITE;
/*!40000 ALTER TABLE `user_dietary_restrictions` DISABLE KEYS */;
INSERT INTO `user_dietary_restrictions` VALUES (1,1),(4,2),(1,3),(3,4),(2,5),(3,6),(5,7);
/*!40000 ALTER TABLE `user_dietary_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_objectives`
--

DROP TABLE IF EXISTS `user_objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_objectives` (
  `user_id` int NOT NULL,
  `objective_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`objective_id`),
  KEY `objective_id` (`objective_id`),
  CONSTRAINT `user_objectives_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_objectives_ibfk_2` FOREIGN KEY (`objective_id`) REFERENCES `objectives` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_objectives`
--

LOCK TABLES `user_objectives` WRITE;
/*!40000 ALTER TABLE `user_objectives` DISABLE KEYS */;
INSERT INTO `user_objectives` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_physical_limitations`
--

DROP TABLE IF EXISTS `user_physical_limitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_physical_limitations` (
  `user_id` int NOT NULL,
  `physical_limitation_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`physical_limitation_id`),
  KEY `physical_limitation_id` (`physical_limitation_id`),
  CONSTRAINT `user_physical_limitations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_physical_limitations_ibfk_2` FOREIGN KEY (`physical_limitation_id`) REFERENCES `physical_limitations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_physical_limitations`
--

LOCK TABLES `user_physical_limitations` WRITE;
/*!40000 ALTER TABLE `user_physical_limitations` DISABLE KEYS */;
INSERT INTO `user_physical_limitations` VALUES (1,1),(5,1),(2,2),(5,2),(3,3),(1,4),(5,4),(3,5),(4,6);
/*!40000 ALTER TABLE `user_physical_limitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Michael',34),(2,'Ana',18),(3,'Alex',25),(4,'Sofia',40),(5,'David',55);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_exercises`
--

DROP TABLE IF EXISTS `workout_exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_exercises` (
  `workout_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  PRIMARY KEY (`workout_id`,`exercise_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `workout_exercises_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`),
  CONSTRAINT `workout_exercises_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_exercises`
--

LOCK TABLES `workout_exercises` WRITE;
/*!40000 ALTER TABLE `workout_exercises` DISABLE KEYS */;
/*!40000 ALTER TABLE `workout_exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workouts`
--

DROP TABLE IF EXISTS `workouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `workouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workouts`
--

LOCK TABLES `workouts` WRITE;
/*!40000 ALTER TABLE `workouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `workouts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-31 21:07:19
