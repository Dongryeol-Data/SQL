USE world

# 기대 수명이 80세 이상인 국가에 속하는 도시 중 2번째로 많은 인구를 가진 도시의 이름
SELECT countrycode, NAME, population
FROM city
WHERE countrycode IN(
	SELECT CODE
	FROM country
	WHERE lifeexpectancy >= 80)
ORDER BY population desc


# 800만 이상이 되는 도시의 국가코드, 도시이름, 국가이름, 도시 인구 수를 출력
SELECT *
FROM
	(SELECT countrycode, NAME, population
	FROM city
	WHERE population >= 8000000) AS city
join
	(SELECT CODE, NAME
	FROM country) AS country
ON city.countrycode = country.Code 

# 800만 이상 도시의 국가코드, 국가이름, 대통령이름
SELECT CODE, NAME, HeadOfState
FROM country 
WHERE CODE IN(
	SELECT distinct(countrycode)
	FROM city
	WHERE population >= 8000000)
	

SELECT *
FROM addr
JOIN user
ON addr.user_id = user.user_id
	
	
