# 2. join = merge()
# 1. inner join
SELECT * 
FROM addr
JOIN user
ON addr.user_id = user.user_id

# world 도시 이름, 국가이름 출력
SELECT city.countrycode, city.name, country.name
FROM city
JOIN country
ON city.countrycode = country.code


# 2. left join
SELECT id, addr.addr, addr.user_id ,user.name, user.user_id
FROM addr
LEFT JOIN user
ON addr.user_id = user.user_id

# 3. right join
SELECT id, addr.addr, user.user_id ,user.name
FROM addr
right JOIN user
ON addr.user_id = user.user_id

# 4. union : select 문의 결과를 합쳐서 출력해준다
# 자동으로 중복 제거 // union all 하면 중복도 나타남
SELECT NAME
FROM user
UNION
SELECT addr 
FROM addr

# outer join > left join과 outer join union
SELECT user.name, addr.addr, addr.user_id
FROM user
LEFT JOIN addr
ON user.user_id = addr.user_id
UNION
SELECT user.name, addr.addr, addr.user_id
FROM user
right JOIN addr
ON user.user_id = addr.user_id

# sub-query : 쿼리문 안에 쿼리가 있는 문법
# select, from, where

# 전체 나라 수, 전체 도시 수, 전체 언어 수를 출력
SELECT
(SELECT COUNT(*) 
FROM city) AS total_country,

(SELECT COUNT(*) 
FROM country) AS total_city,

(SELECT COUNT(DISTINCT(LANGUAGE))
FROM countrylanguage) AS total_language


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
	