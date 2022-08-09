-- 3.Run SQL command to see the structure of table
USE ecommerce;
DESC users_data;

-- 4.Run SQL command to select first 100 rows of the database
USE ecommerce;
SELECT * FROM users_data LIMIT 100;

-- 5.How many distinct values exist in table for field country and language
USE ecommerce;
SELECT COUNT(DISTINCT country) as dist_country,COUNT(DISTINCT language) as dist_language FROM users_data;

-- 6.Check whether male users are having maximum followers or female users.
USE ecommerce;
SELECT SUM(socialNbFollowers),gender FROM users_data GROUP BY gender;

-- 7.Calculate the total users those
-- Uses Profile Picture in their Profile
-- Uses Application for Ecommerce platform
-- Uses Android app
-- Uses ios app

-- (a)Uses Profile Picture in their Profile
USE ecommerce;
SELECT COUNT(*) FROM users_data WHERE hasProfilePicture ="True";
-- (b)Uses Application for Ecommerce platform
USE ecommerce;
SELECT COUNT(*) FROM users_data WHERE hasAnyApp ="True";
-- (c)Uses Android app
USE ecommerce;
SELECT COUNT(*) FROM users_data WHERE hasAndroidApp ="True";
-- (d)Uses ios app
USE ecommerce;
SELECT COUNT(*) FROM users_data WHERE hasIosApp ="True";

-- 8.Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
USE ecommerce;
SELECT country,SUM(productsBought) FROM users_data GROUP BY country ORDER BY SUM(productsBought) DESC;

-- 9.Calculate the average number of sellers for each country and sort the result in ascending order of total number of sellers
USE ecommerce;
SELECT country,AVG(productsSold) FROM users_data GROUP BY country ORDER BY AVG(productsSold) ASC;

-- 10.Display name of top 10 countries having maximum products pass rate.
USE ecommerce;
SELECT country,SUM(productsPassRate) FROM users_data GROUP BY country ORDER BY SUM(productsPassRate) DESC LIMIT 10;

-- 11.Calculate the number of users on an ecommerce platform for different language choices.
USE ecommerce;
SELECT language, COUNT(*) FROM users_data GROUP BY language;

-- 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
USE ecommerce;
SELECT SUM(productsWished),SUM(socialProductsLiked) FROM users_data WHERE gender='F'

-- 13.Check the choice of male users about being seller or buyer.
USE ecommerce;
SELECT SUM(productsSold),SUM(productsBought) FROM users_data WHERE gender='M'

-- 14.Which country is having maximum number of buyers?
USE ecommerce;
SELECT country,SUM(productsBought) FROM users_data GROUP BY country ORDER BY SUM(productsBought) DESC;

-- 15.List the name of 10 countries having zero number of sellers.
USE ecommerce;
SELECT productsSold,country FROM users_data WHERE productsSold=0 LIMIT 10;

-- 16.Display record of top 110 users who have used ecommerce platform recently.
USE ecommerce;
SELECT daysSinceLastLogin FROM users_data ORDER BY daysSinceLastLogin ASC LIMIT 110;

-- OR

USE ecommerce;
SELECT * FROM users_data ORDER BY daysSinceLastLogin LIMIT 110;

-- 17.Calculate the number of female users those who have not logged in since last 100 days.
USE ecommerce;
SELECT gender,COUNT(daysSinceLastLogin) FROM users_data WHERE gender='F' AND daysSinceLastLogin >100;

-- 18.Display the number of female users of each country at ecommerce platform.
USE ecommerce;
SELECT country, COUNT(*) FROM  users_data WHERE gender='F' ORDER BY country;

-- 19.Display the number of male users of each country at ecommerce platform.
USE ecommerce;
SELECT country, COUNT(*) FROM  users_data WHERE gender='M' GROUP BY country;

-- 20.Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
USE ecommerce;
SELECT AVG(productsSold),AVG(productsBought),country FROM users_data WHERE gender='M' GROUP BY country;
