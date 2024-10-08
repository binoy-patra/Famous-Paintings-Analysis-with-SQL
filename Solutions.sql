-- 1) Fetch all the paintings which are not displayed on any museums?

SELECT * 
from WORK w
where w.museum_id is NULL;


-- 2) How many paintings have an asking price of more than their regular price? 

SELECT count(*) as paintings_asking_for_more 
from product_size
where sale_price > regular_price;


-- 3) Identify the paintings whose asking price is less than 50% of its regular price

SELECT *
from product_size 
where sale_price < regular_price/2::DECIMAL;


-- 4) Which canva size costs the most?

SELECT cs.label, ps.sale_price
FROM (
    SELECT p.size_id, p.sale_price, RANK() OVER (ORDER BY p.sale_price DESC) AS rank
    FROM product_size p
    JOIN canvas_size c ON p.size_id = c.size_id::text
) ps
JOIN canvas_size cs ON cs.size_id::text = ps.size_id
WHERE ps.rank = 1;


-- 5) Delete duplicate records from work, product_size, subject and image_link tables

DELETE FROM work
where ctid not in 
(
    select min(ctid)
    from work
)

DELETE FROM product_size
where ctid not in 
(
    select min(ctid)
    from product_size
)

DELETE FROM subject
where ctid not in 
(
    select min(ctid)
    from subject
)

DELETE FROM image_link
where ctid not in 
(
    select min(ctid)
    from image_link
);


-- 6) Identify the museums with invalid city information in the given dataset

select * 
from museum
where city ~ '^[0-9]';


-- 7) Museum_Hours table has 1 invalid entry. Identify it and remove it.

delete 
from museum_hours 
where ctid not in 
(   select min(ctid)
    from museum_hours
    group by museum_id, day
);

SELECT *, ctid
from museum_hours

	
-- 8) Fetch the top 10 most famous painting subject

SELECT *
from
(
SELECT s.subject, count(1), rank() over(order by count(1) desc) rank
from work w 
join subject s 
on w.work_id = s.work_id
group by subject
)
where rank <= 10;


-- 9) Identify the museums which are open on both Sunday and Monday. Display museum name, city.

select m.museum_id, m.name, m.name, m.city, m.state, m.country
from
(
    SELECT museum_id, count(1) count
    from museum_hours
    where day in ('Sunday', 'Monday')
    group by museum_id
) c
join museum m 
on c.museum_id = m.museum_id
where c.count = 2


-- 10) How many museums are open every single day?

SELECT count(*)
from 
(
    SELECT mh.museum_id, count(1) as days_open
    from museum_hours mh 
    join museum m 
    on mh.museum_id = m.museum_id
    GROUP by mh.museum_id
    having count(1) = 7
);

	
-- 11) Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)

WITH ranked_museums AS (
    SELECT m.museum_id, m.name, m.city, m.country, COUNT(w.work_id) AS no_of_paintings,
           RANK() OVER (ORDER BY COUNT(w.work_id) DESC) AS rank
    FROM museum m
    JOIN work w ON m.museum_id = w.museum_id
    GROUP BY m.museum_id, m.name, m.city, m.country
)
SELECT name, city, country, no_of_paintings
FROM ranked_museums
WHERE rank <= 5
ORDER BY rank;


-- 12) Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)

WITH artist_ranks AS (
    SELECT a.artist_id, a.full_name, a.nationality, COUNT(w.work_id) AS no_of_paintings,
           RANK() OVER (ORDER BY COUNT(w.work_id) DESC) AS rank
    FROM artist a
    JOIN work w ON a.artist_id = w.artist_id
    GROUP BY a.artist_id, a.full_name, a.nationality
)
SELECT artist_id, full_name, nationality, no_of_paintings
FROM artist_ranks
WHERE rank <= 5;


-- 13) Display the 3 least popular canva sizes

SELECT *
FROM
(
    SELECT p.size_id, label, count(1), dense_rank() over(order by count(1)) as rank
    from product_size p
    join canvas_size c
    on p.size_id = c.size_id::text
    GROUP BY p.size_id, label
    order by 2
)
where rank <= 3
order by 4;



-- 14) Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?


SELECT *
from(
    select m.name, m.state as city, m.country, day, open, close,
    to_timestamp(close, 'HH:MI:PM') - to_timestamp(open, 'HH:MI:AM') as duration,
    rank() over(order by to_timestamp(close, 'HH:MI:PM') - to_timestamp(open, 'HH:MI:AM') desc ) as rank 
    from museum_hours mh
    join museum m
    on mh.museum_id = m.museum_id
)x
where rank = 1;


-- 15) Which museum has the most no of most popular painting style?

WITH style_ranks AS (
    SELECT style, RANK() OVER (ORDER BY COUNT(work_id) DESC) AS style_rank
    FROM work
    GROUP BY style
),
museum_styles AS (
    SELECT w.museum_id, m.name, s.style, COUNT(w.work_id) AS no_of_paintings
    FROM work w
    JOIN museum m ON w.museum_id = m.museum_id
    JOIN style_ranks s ON w.style = s.style
    WHERE s.style_rank = 1
    GROUP BY w.museum_id, m.name, s.style
)
SELECT name AS museum_name, style, no_of_paintings
FROM museum_styles
GROUP BY name, style
ORDER BY no_of_paintings DESC;



-- 16) Identify the artists whose paintings are displayed in multiple countries

with countries as
(
select distinct a.full_name as artist, m.country
from work w
join artist a
on w.artist_id = a.artist_id
join museum m 
on w.museum_id = m.museum_id
-- group by a.full_name, m.country
);

SELECT artist, count(1) as no_of_countries
from countries
group by artist
having count(1) > 1
order by 2 desc


-- 17) Display the country and the city with most no of museums. 
-- Output 2 seperate columns to mention the city and country. 
-- If there are multiple value, seperate them with comma.

with country AS
(
    select 
        country, count(1), 
        rank() over(order by count(1) desc) as rank
    from museum 
    group by country
),

city as 
(
    SELECT
        city, count(1),
        rank() over(order by count(1) desc) as rank 
    from museum 
    group by city
)

SELECT string_agg(distinct country, ' , ') as country, string_agg(distinct city, ' , ') as city 
from country co 
cross join city ci 
where co.rank = 1 and ci.rank = 1;



-- 18) Identify the artist and the museum where the most expensive and least expensive painting is placed. 
-- Display the artist name, sale_price, painting name, museum name, museum city and canvas label

with price as
(
    select 
        *,
        rank() over(order by sale_price desc) as most_expensive,
        rank() over(order by sale_price ) as least_expensive
    from product_size
)

select distinct 
    a.full_name as artist, 
    w.name as painting, 
    m.name as museum, 
    p.sale_price,
    m.city as city,
    m.country as country,
    c.label as label

from price p 

join work w on p.work_id = w.work_id
join artist a on a.artist_id = w.artist_id
join museum m on w.museum_id = m.museum_id
join canvas_size c on c.size_id = p.size_id :: numeric 
where most_expensive = 1 or least_expensive = 1;



-- 19) Which country has the 5th highest no of paintings?

with count as 
(
    select 
        m.country as country, count(1) as no_of_paintings,
        rank() over(order by count(1) desc) as rank
    from work w
    join museum m
    on w.museum_id = m.museum_id
    group by country
)

select country, no_of_paintings, rank
from count 
where rank = 5;


-- 20) Which are the 3 most popular and 3 least popular painting styles?

with cte as
(
    select 
        style, count(name),
        dense_rank() over(order by count(name) desc) as most,
        dense_rank() over(order by count(name)) as least
    from work
    where style is not null
    group by style
    order by 2 desc
)

select style, 
    case 
    when most <= 3 then 'Most_Popular'
    when least <= 3 then 'Least_Popular'
    end as result 
from cte
where most <= 3 or least <= 3;


-- 21) Which artist has the most no of Portraits paintings outside USA?. 
-- Display artist name, no of paintings and the artist nationality.

with cte as
(
select 
    a.full_name as artist, subject,
    count(1) as no_of_paintings,
    nationality,
    dense_rank() over(order by count(1) desc) as rank

    from artist a
    join work w on a.artist_id = w.artist_id 
    join subject s on s.work_id = w.work_id
    join museum m on m.museum_id = w.museum_id
    where m.country <> 'USA' and s.subject = 'Portraits'
    group by a.full_name, nationality, subject
)
select artist, nationality, subject, no_of_paintings
from cte
where rank = 1;