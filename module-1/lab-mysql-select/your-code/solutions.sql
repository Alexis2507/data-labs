use publications;

select *
from authors;

select *
from titles;

select*
from publishers;

select *
from titleauthor;

#select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title_id, t.title, t.pub_id, p.pub_name, p.pub_name, ta.au_id, ta.title_id

#Challenge 1
select ta.au_id, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title,p.pub_name as Publisher
from titles t
inner join publishers p on p.pub_id=t.pub_id
inner join titleauthor ta on ta.title_id=t.title_id
left join authors a on ta.au_id=a.au_id;

#select t1.title_id, t1.title, t1.pub_id, t1.Publisher, t1.au_id, t1.LAST_NAME, t1.FIRST_NAME
#from (
#select p.pub_name as Publisher, t.title_id, t.title, t.pub_id, sum(revenue)
#from titles t
#inner join publishers p on p.pub_id=t.pub_id) t1;
#from(
#select ta.au_id, t.title_id, t.title, t.pub_id
#from 
#inner join titleauthor ta on ta.title_id=t.title_id
#left join authors a on ta.au_id=a.au_id

#Challenge 2
select ta.au_id, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title,p.pub_name as Publisher, count(*) as Title_Count
from titles t
inner join publishers p on p.pub_id=t.pub_id
inner join titleauthor ta on ta.title_id=t.title_id
left join authors a on ta.au_id=a.au_id
group by a.au_id, p.pub_name;

#Challenge 3
select *
from sales;

select a.au_id, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, s.qty, sum(s.qty) as sum_qty
from titles t
inner join titleauthor ta on ta.title_id=t.title_id
left join authors a on ta.au_id=a.au_id
left join sales s on s.title_id=t.title_id
group by au_id
order by sum_qty desc
limit 3;

#Challenge 4:
select a.au_id, s.title_id, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, s.qty, sum(s.qty) as sum_qty
from titles t
inner join titleauthor ta on ta.title_id=t.title_id
left join authors a on ta.au_id=a.au_id
left join sales s on s.title_id=t.title_id
group by s.title_id
order by sum_qty desc;

