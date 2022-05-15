/*Write a query to display for each store its store ID, city, and country.
*/

use sakila;
select * from sakila.city;    
select * from sakila.country;
select * from sakila.store;
select * from sakila.address;

select s.store_id, d.address_id, c.city_id, c.country_id
from sakila.store as s 
join sakila.address as d
on s.address_id= d.address_id
join sakila.city as c
on c.city_id = d.city_id;

/*Write a query to display how much business, in dollars, each store brought in.
*/

select * from payment; 
select * from customer; 
select * from store;

select s.store_id , sum(p.amount)
from sakila.customer as c
join sakila.store as s
on s.store_id= c.store_id
join sakila.payment as p
on p.customer_id = c.customer_id
group by s.store_id;

/*Which film categories are longest?
*/
select * from film;
select * from film_category;

select f.title, count(c.category_id), f.length
from sakila.film as f
join sakila.film_category as c
on c.film_id= f.film_id
group by c.category_id
order by f.length desc;

/*
Display the most frequently rented movies in descending order.
*/
select * from rental;
select * from inventory;
select * from film;

select title, count(rental_id) as total_rentals
from sakila.film as f
join sakila.inventory as i
on f.film_id = i.film_id
join sakila.rental as r
on i.inventory_id = r.inventory_id
group by title
order by total_rentals desc;

/*
List the top five genres in gross revenue in descending order.
, sum the money if the rental for each movie grouped by genere
*/

select * from sakila.category;
select * from sakila.payment;
select * from sakila.rental;
select * from sakila.film_category;


select c.name, sum(amount) as revenue
from sakila.category c
join sakila.film_category fc
on c.category_id = fc.category_id
join sakila.film as f
on fc.film_id = f.film_id
join sakila.inventory i
on f.film_id = i.film_id
join sakila.rental r
on i.inventory_id = r.inventory_id
join sakila.payment p
on r.rental_id = p.rental_id
group by name
order by revenue desc;

/*
Is "Academy Dinosaur" available for rent from Store 1?
*/


select * from inventory;
select * from store;
select * from film;

select title, store_id
from sakila.film f
join sakila.inventory i
on f.film_id = i.inventory_id
where store_id = 1 and title = 'Academy Dinosaur';

/*
Get all pairs of actors that worked together.
*/

select * from actor;
select * from film;
select * from film_actor;




select title as films, concat(first_name,  last_name) as actor 
from sakila.film as f
join sakila.film_actor  as fa
on f.film_id = fa.film_id
join sakila.actor as a
on fa.actor_id = a.actor_id
order by films;

/*
Get all pairs of customers that have rented the same film more than 3 times.
*/

select * from customer;
select * from rental;