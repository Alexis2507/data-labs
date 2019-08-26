use publications;

select * 
from titles;

create temporary table blah2
select a.au_id, a.au_lname, a.au_fname, ta.royaltyper, ta.title_id, t.royalty, t.price, s.qty, s.ord_num, 
t.price*s.qty*t.royalty/100*ta.royaltyper/100 as sales_royalty, t.advance
from authors a
inner join titleauthor ta on a.au_id=ta.au_id
left join titles t on t.title_id=ta.title_id
left join sales s on s.title_id=t.title_id;

#Step 1:
create temporary table output1_1
select a.au_id, ta.title_id, t.price*s.qty*t.royalty/100*ta.royaltyper/100 as sales_royalty, t.advance
from authors a
inner join titleauthor ta on a.au_id=ta.au_id
left join titles t on t.title_id=ta.title_id
left join sales s on s.title_id=t.title_id;

#Step 2:
create temporary table output2_2
select au_id, title_id, agg_royalties, agg_advance
from( 
select au_id, title_id, sum(sales_royalty) as agg_royalties, sum(advance) as agg_advance 
from output1_1
group by au_id, title_id)new
;

#Step 3:
select au_id, title_id, agg_royalties, agg_advance, agg_total
from(
select au_id, title_id, agg_royalties, agg_advance, agg_total, (agg_royalties+agg_advance) as agg_total
from output2_2)new
;