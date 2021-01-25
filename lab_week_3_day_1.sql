use sakila;
/* Instructions
1. List number of films per category.
2. Display the first and last names, as well as the address, of each staff member.
3. Display the total amount rung up by each staff member in August of 2005.
4. List each film and the number of actors who are listed for that film.
5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
List the customers alphabetically by last name. 
*/

-- 1 
select count(fc.film_id) n_films, c.category_id, c.name category
from film_category fc
join category c
on c.category_id = fc.category_id
group by 2,3;

-- 2
select s.first_name, s.last_name as name, a.address_id, a.address
from staff s
join address a
on s.address_id = a.address_id;

-- 3
SELECT 
	count(l.amount) as 'total_payment', s.staff_id, s.first_name, s.last_name from payment as l
JOIN staff as s
on l.staff_id = s.staff_id
where DATE_FORMAT(payment_date, "%M %Y")='August 2005'
group by staff_id;

-- 4
select f.film_id, count(actor_id) n_actors, f.title film
from film_actor fa
join film f
on fa.film_id = f.film_id
group by 1, 3;

-- 5
select sum(p.amount) as total_paid, p.customer_id,
from payment p 
right join customer as c 
on p.customer_id = c.customer_id
group by 2,3,4
order by 4 asc;
