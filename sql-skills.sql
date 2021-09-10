-- Artist Table
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)
insert into artist (name) 
values('Wardruna'), ('Sabaton'), ('Danheim');
-- Select 5 artists in alphabetical order.
select * from artist
order by name
limit 5;

-- Employee Table
-- List all employee first and last names only that live in Calgary.
select first_name, last_name from employee
where city like 'Calgary';
-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards
select * from employee
where reports_to in(
	select employee_id from employee
    where first_name = 'Nancy'
    and last_name = 'Edwards'
);
-- Count how many people live in Lethbridge.
select count(*) from employee
where city = 'Lethbridge';

-- Invoice Table
-- Count how many orders were made from the USA.
select count(*) from invoice
where billing_country = 'USA';
-- Find the largest order total amount.
select max(total) from invoice;
-- Find the smallest order total amount.
select min(total) from invoice;
-- Find all orders bigger than $5.
select * from invoice
where total > 5;
-- Count how many orders were smaller than $5.
select count(*) from invoice
where total < 5;
-- Get the total sum of the orders.
select sum(total) from invoice;

-- JOIN Queries (Various tables)
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
select * from invoice i
join invoice_line il on i.invoice_id = il.invoice_id
where il.unit_price > 0.99;
-- Get the invoice_date, customer first_name and last_name, and total from all invoices.
select i.invoice_date, c.first_name, c.last_name, i.total from invoice i
join invoice_line il on i.invoice_id = il.invoice_id
join customer c on i.customer_id = c.customer_id;
-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.
select c.first_name customer_firstname, c.last_name customer_lastname, e.first_name rep_firstname, e.last_name rep_lastname
from customer c
join employee e on c.support_rep_id = e.employee_id;
-- Get the album title and the artist name from all albums.
select al.title album_title, ar.name artist_name
from album al 
join artist ar on al.artist_id = ar.artist_id;


--EXTRA CREDIT---------------------------------------------------------------------------------

-- Artist Table
-- Select 10 artists in reverse alphabetical order.
select * from artist
order by name desc
limit 10;
-- Select all artists that start with the word ‘Black’.
select * from artist
where name like 'Black%';
-- Select all artists that contain the word ‘Black’.
select * from artist
where name like '%Black%';

-- Employee Table
-- Find the birthdate for the youngest employee.
select * from employee
order by birth_date desc
limit 1;

--or--
select max(birth_date) from employee

-- Find the birthdate for the oldest employee.
select * from employee
order by birth_date
limit 1;

--or--
select min(birth_date) from employee

-- Invoice Table
-- Count how many orders were in CA, TX, or AZ (use IN).
select count(*) from invoice where billing_state in('CA', 'TX', 'AZ');
-- Get the average total of the orders.
select avg(total) from invoice;

-- More Join Queries
-- Get all playlist_track track_ids where the playlist name is Music.
select pl.track_id
from playlist_track pl
join playlist p on pl.playlist_id = p.playlist_id
where p.name = 'Music';
-- Get all track names for playlist_id 5.
select tr.name
from track tr
join playlist_track p on p.track_id = tr.track_id
where p.playlist_id = 5;
-- Get all track names and the playlist name that they’re on ( 2 joins ).
select tr.name track_name, pl.name playlist_name
from track tr
join playlist_track p on p.track_id = tr.track_id
join playlist pl on pl.playlist_id = p.playlist_id;
-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
select tr.name track_name, al.title album_title
from track tr
join genre g on tr.genre_id = g.genre_id
join album al on tr.album_id = al.album_id
where g.genre_id in(
	select genre_id
    from genre
    where genre.name in ('Alternative', 'Punk')
);