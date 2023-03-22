-- coment --
use world;

select * from languages where language ="slovene" order by percentage desc;

-- 2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades de cada país?  Tu consulta debe devolver el nombre del país, el idioma y el número total de ciudades. Tu consulta debe ordenar el resultado por el número de ciudades en orden descendente. (3) --
select co.name, l.language, count( distinct ci.name) total_cities
from countries co 
join cities ci
on co.code=ci.country_code
join languages l
on co.code=l.country_code
group by co.name, l.language
order by total_cities desc;

-- 3. ¿Qué consulta ejecutarías para obtener todos ciudades de México con una población mayor a 500,000? Tu consulta debe ordenar el resultado por población en orden descendente. (1) --
select ci.name, ci.population, ci.country_code
from cities ci
where ci.country_code = 'MEX' and ci.population > 500000;

-- 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje de habla mayor a 89%? Tu consulta debe ordenar el resultado por porcentaje de habla en orden descendente. (1) --

select la.language, la.percentage
from languages la
where la.percentage > 89
order by la.percentage desc; 

-- 5. ¿Qué consulta ejecutarías para obtener todos los países con un área de superficie menor a 501 y población mayor a 100,000? (2) --

select co.surface_area, co.population, co.name
from countries co
where co.surface_area < 501 and co.population > 100000;

select surface_area from countries limit 10;

--  6. ¿Qué consulta ejecutarías para obtener países solo con monarquía constitucional, un capital superior a 200 y una esperanza de vida mayor a 75 años?  (1) --
select  co.name, co.government_form, co.capital, co.life_expectancy
from countries co
where co.government_form ="Constitutional Monarchy" and co.capital > 200 and co.life_expectancy > 75;

-- 7. ¿Qué consulta ejecutarías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires con una población mayor a 500,000 habitantes?  La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población.  (2) --

select co.name, ci.name, ci.district, ci.population
from cities ci
join countries co 
on co.code =  ci.country_code
where ci.country_code ="ARG" and ci.district ="Buenos Aires" and ci.population > 500000;

-- 8. ¿Qué consulta ejecutarías para resumir el número de países en cada región? Tu consulta debe mostrar el nombre de la región y el número de países. Además, debe ordenar el resultado por el número de países en orden descendente. (2) --

select co.region, count( distinct co.name) total_countries 
from countries co 
group by co.region
order by total_countries desc;



