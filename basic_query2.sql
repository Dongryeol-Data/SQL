SELECT DATABASE()

SELECT distinct(continent)
FROM country
ORDER BY continent

# "KOR"
SELECT NAME, population
FROM city
WHERE countrycode ="KOR" AND population >= 1000000
ORDER BY population desc

SELECT NAME, countrycode, population
FROM city
WHERE population between 8000000 AND 20000000
ORDER BY population DESC

SELECT CODE, concat(NAME, "(",indepyear,")"), continent, population
FROM country
WHERE indepyear BETWEEN 1940 AND 1950
ORDER BY indepyear ASC

SELECT countrycode, LANGUAGE, percentage/100
FROM countrylanguage
WHERE LANGUAGE IN ("English", "korean", "spanish")
AND percentage >= 95
ORDER BY percentage desc

SELECT CODE, NAME, continent, governmentform, population
FROM country
WHERE CODE LIKE "A%" AND governmentform LIKE "%republic"


SELECT countrycode, COUNT(countrycode) AS count
FROM city
group by countrycode

SELECT count(distinct(LANGUAGE))
FROM countrylanguage

# 대륙 group by
SELECT continent, sum(population), sum(GNP),
SUM(GNP)/SUM(population)
FROM country
GROUP BY continent

#having
SELECT continent, SUM(population)
FROM country
GROUP BY continent
HAVING SUM(population) > 500000000


SELECT count(distinct(continent)) AS count
FROM country

SELECT continent, COUNT(continent) AS count
FROM country
GROUP BY continent
ORDER BY COUNT desc




