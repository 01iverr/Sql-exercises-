alter table Calendar2 alter column price type varchar(100) using price::varchar(100);
update Calendar2 set price = replace(price,'$','') ;
update Calendar2 set price = replace(price,',','') ;
alter table Calendar2 alter column price type numeric(8,2) using price::numeric(8,2); 
//----------------------------------------------------------------------------------------
alter table Calendar2 alter column adjusted_price type varchar(100) using adjusted_price::varchar(100);
update Calendar2 set adjusted_price = replace(adjusted_price,'$','') ;
update Calendar2 set adjusted_price = replace(adjusted_price,',','') ;
alter table Calendar2 alter column adjusted_price type numeric(8,2) using adjusted_price::numeric(8,2);  
