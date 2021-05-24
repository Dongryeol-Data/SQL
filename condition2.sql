#
SELECT CODE, ROUND((GNP/population)*1000,2)
FROM country

# 조건문

#if : if(조건, 참, 거짓)
#도시의 인구가 100만이상 big city, 미만은 small city
countrySELECT NAME, population
, if(population >= 1000000, "big city", "small city")
AS city_scale
FROM country

#ifnull : ifnull(참, 거짓)
# country table 에서 독립연도가 없으면 0으로 출력
SELECT NAME , ifnull(indepyear, 0) AS indepyear
FROM country

#case
# case when(조건1)  then(출력1)
# case when(조건2)  then(출력2)
# end as (컬럼명)
SELECT NAME, population,
case
	when population >= 1000000000 then "upper 1billion"
	when population >= 100000000 then "upper 100million"
	ELSE "below 100million"
END AS result
FROM country
