-- Query 0
SELECT * FROM analytics;

--Find the entire record for the app with an ID of `1880`.
1.  SELECT app_name FROM analytics WHERE id = 1880;

--Find the ID and app name for all apps that were last updated on August 01, 2018.
2. SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

--Count the number of apps in each category, e.g. "Family | 1972".
3.SELECT category, COUNT(category) FROM analytics GROUP BY category;
Correct: SELECT category, COUNT(*) FROM analytics GROUP BY category;

4.SELECT app_name, SUM(reviews) FROM analytics GROUP BY app_name ORDER BY SUM(reviews) desc LIMIT 5;

--Find the top 5 most-reviewed apps and the number of reviews for each.
5.SELECT * FROM analytics WHERE rating > 4.8 ORDER BY reviews desc LIMIT 1;

--Find the average rating for each category ordered by the highest rated to lowest rated.
6. SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG(rating) desc;

--Find the name, price, and rating of the most expensive app with a rating that's less than 3
7.SELECT app_name, price, rating FROM analytics WHERE rating < 3 GROUP BY rating, app_name, price ORDER BY price desc LIMIT 1;

--Find all records with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
8. SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

--Find the names of all apps that are rated less than 3 with at least 10000 reviews.
9. SELECT app_name, rating FROM analytics GROUP BY app_name, rating HAVING rating < 3 AND SUM(reviews) >=10000;

--Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
10. SELECT * FROM analytics WHERE price BETWEEN 0.10 AND 1.00 ORDER BY reviews LIMIT 10;

--Find the most out of date app. 
11.SELECT app_name, last_updated FROM analytics GROUP BY last_updated, app_name ORDER BY last_updated Asc LIMIT 1; 
or: SELECT * FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

--Find the most expensive app (the query is very similar to #11).
12. SELECT app_name, price FROM analytics ORDER BY price desc LIMIT 1;
-- Option 1: with a subquery
SELECT * FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

--Count all the reviews in the Google Play Store.
13. SELECT SUM(reviews) FROM analytics;

--Find all the categories that have more than 300 apps in them.
14. SELECT category, COUNT(category) FROM analytics GROUP BY category HAVING COUNT(category) > 300;

--Find the app that has the highest proportion of reviews to min_installs,
-- among apps that have been installed at least 100,000 times. Display the name of the app
-- along with the number of reviews, the min_installs, and the proportion.
15. SELECT app_name, min_installs, reviews, (min_installs/reviews) AS proportion FROM analytics WHERE min_installs > 100000 ORDER BY p[roportion DESC LIMIT 1;

--Find the name and rating of the top rated apps in each category, 
-- among apps that have been installed at least 50,000 times.
FS1. SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;

--Find all the apps that have a name similar to "facebook".
FS2. SELECT app_name FROM analytics WHERE app_name ILIKE '%facebook%';
