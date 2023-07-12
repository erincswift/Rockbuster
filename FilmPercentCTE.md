Query to determine the percentage of films for each rating category (G, PG, PG-13, etc.)

```
--CTE to return the number of movies per rating category
with base as 
(
  Select rating,
        count(film_id) as film_count
  From film
  Group by rating
  Order by film_count desc
),

--CTE to return the total number of films
total as 
(
  Select sum(film_count) as total_film
	From base
)

--Query to return percentage with percentage sign added
Select base.*, total.total_film,
        concat(cast(round((base.film_count/total.total_film*100),2)as varchar),'%') as percentage
From base, total
```
