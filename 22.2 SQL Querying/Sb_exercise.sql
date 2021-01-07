////Codewars///

1.For this challenge you need to create a simple SELECT statement that will return all columns from the people table WHERE their age is over 50
SELECT * FROM people WHERE age > 50

2.For this challenge you need to create a simple SUM statement that will sum all the ages.
SELECT SUM(age) AS age_sum FROM people 

3. For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people.
SELECT MIN(age) AS age_min, MAX(age) AS age_max FROM people

4.Create a simple SELECT query to display student information of all ACTIVE students.
SELECT * FROM students WHERE IsActive 

5. For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.
SELECT age, COUNT(people) AS people_count FROM people
GROUP BY age

6.For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age and return the groups with 10 or more people who have that age.
SELECT age, COUNT(age) AS total_people FROM people GROUP BY age HAVING COUNT(age) >= 10

////SQL Zoo: SUM_and_COUNT////

1.SELECT SUM(population) FROM world

2.SELECT continent FROM world GROUP BY continent

3.  SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

4.SELECT COUNT(area) FROM world WHERE area > 1000000

5.SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

6.SELECT continent, COUNT(name) FROM world GROUP BY continent

7. SELECT continent, COUNT(name) FROM world WHERE population > 10000000 GROUP BY continent 

8. SELECT continent FROM world GROUP BY continent HAVING SUM(population) > 100000000

