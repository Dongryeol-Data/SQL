# index : 데이터를 검색할 때 빠르게 찾을 수 있도록 해주는 기능
USE employees

#index(어던 key를 사용했는지, extra 어떤 구문을 사용했는지가 중요)
#where 절에서 많이 사용된다.
explain
SELECT COUNT(*)
FROM salaries
WHERE to_date > "2000-01-01"

#to_date를 index로 만듦
CREATE INDEX tdate
ON salaries (to_date)

# INDEX 삭제
DROP INDEX TDATA
ON salaries

# view : sql 쿼리문을 담고 있는 view
# 특정 쿼리문에 대한 결과를 저장하는 개념
USE world

CREATE VIEW code_name AS
SELECT CODE, name
FROM country

SELECT *
FROM city
JOIN code_name
ON city.countrycode = code_name.code




