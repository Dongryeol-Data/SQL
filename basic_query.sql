# Server - 3306포트를 사용 (기본, 변경가능)
# Database - Table - Row

# 1-1. 데이터 베이스
SHOW DATABASES
# 생성
CREATE DATABASE test

# 선택
USE test

# 확인
SELECT DATABASE()

# 1-2. Table
CREATE TABLE USER1(
	user_id INT,
	NAME varchar(20),
	email VARCHAR(30),
	age INT(3),
	rdate DATE	
)

CREATE TABLE USER2(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	NAME varchar(20) NOT null,
	email VARCHAR(30) UNIQUE NOT null,
	age INT(3) DEFAULT 30,
	rdate timestamp	
)

# 2. 수정 Alter
# 2-1.  데이터 베이스
SHOW VARIABLES LIKE "character_set_database"
ALTER DATABASE test CHARACTER SET = UTF8

# 2-2. 테이블
ALTER TABLE USER2 ADD tmp TEXT
ALTER TABLE USER2 MODIFY COLUMN tmp INT(3)
ALTER TABLE USER2 DROP tmp

# 3. 삭제 Drop
# 3-1. 데이버 테이스 삭제
CREATE DATABASE tmp
DROP DATABASE tmp
SHOW DATABASES

# 3-2. 테이블 삭제
DROP TABLE USER3
SELECT DATABASE()

# 4. 삽입 Insert
INSERT INTO USER1(user_id, NAME, email, age)
VALUE(1, "dongryeol", "dongryeol@naver.com", 27)

# 5. SELECT, 데이터 선택
SELECT USER_id, name, age
FROM USER1

#모든 데이터
SELECT *
FROM USER1

SELECT USER_id AS "ID", name AS "UserName", age AS "ages"
FROM USER1

# 6. DISTINCT 중복제거 = unique
SELECT distinct(NAME)
FROM USER1

# 7. where 조건 검색
SELECT count(DISTINCT(NAME))
FROM USER1
WHERE age >= 25

# and or 사용 가능
SELECT *
FROM USER1
WHERE age > 15 AND age <= 27

# 조건 데이터 A ~ B
SELECT *
FROM USER1
WHERE age BETWEEN 20 AND 40

# 정렬 (order by ~ asc, desc)
SELECT *
FROM USER1
ORDER BY age ASC


# 나이가 20세 ~ 40세 사이에 있는 사용자를 이름순으로 정렬하고, 중복제이터를 제거해서출력
SELECT DISTINCT(NAME)
FROM USER1
WHERE age BETWEEN 20 AND 40
ORDER BY NAME DESC


# concat 데이터 합치기
SELECT NAME, age, CONCAT(NAME, "(",age,")") AS "name_age"
FROM USER1

# like : where 절에서 특정 문자열이 들어간 데이터 조회
SELECT* 
FROM USER1
WHERE email not LIKE "%@.net%"

# in : 여러개의 조건 조회
SELECT *
FROM USER1
WHERE name IN ("andy", "peter", "po")

SELECT *
FROM USER1
WHERE NAME IN (
	SELECT DISTINCT(NAME)
	FROM USER1
	WHERE age < 28
)

# Limit : 출력 개수 제한 (ex: 한페이지 데이터 20개)
# 
SELECT *
FROM USER1
LIMIT 3

SELECT *
FROM USER1
LIMIT 3, 5

# 6. UPDATE : 중간 데이터 수정
UPDATE USER1
SET age=20, rdate="2021-03-10"
WHERE age BETWEEN 20 AND 29

SELECT *
FROM USER1
WHERE age BETWEEN 20 AND 29

# 7.delete
DELETE FROM USER1
WHERE rdate > "2019-11-01"

SELECT *
FROM USER1

# 8. groupby
SELECT countrycode, COUNT(countrycode) AS count
FROM city
group by countrycode

# 대륙 group by
SELECT continent, sum(population), sum(GNP),
SUM(GNP)/SUM(population)
FROM country
GROUP BY continent

# having
#group by 가 실행되고 난 결과에 조건을 추가
SELECT continent, SUM(population)
FROM country
GROUP BY continent
HAVING SUM(population) > 500000000

SOURCE 

