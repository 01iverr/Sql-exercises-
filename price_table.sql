create table Price as (select distinct id as listing_id, price, weekly_price, monthly_price, security_deposit, cleaning_fee,guests_included, extra_people, minimum_nights, maximum_nights,
minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm from listings2);
//----------------------------------------------------------------------------------------
ALTER TABLE  Price  ADD FOREIGN KEY (listing_id) REFERENCES Listings2(id);
//----------------------------------------------------------------------------------------
ALTER TABLE Listings2 
drop column price, drop column weekly_price,drop column monthly_price,drop column security_deposit, 
drop column cleaning_fee,drop column guests_included, drop column extra_people, drop column minimum_nights, drop column maximum_nights,
drop column minimum_minimum_nights, drop column maximum_minimum_nights, drop column minimum_maximum_nights,
drop column maximum_maximum_nights, drop column minimum_nights_avg_ntm, drop column maximum_nights_avg_ntm;
//----------------------------------------------------------------------------------------
alter table Price alter column price type varchar(100) using  price::varchar(100);
update Price set price = replace( price,'$','') ;
update Price set price = replace(price,',','') ;
alter table Price alter column  price type numeric(8,2) using  price::numeric(8,2); 
//----------------------------------------------------------------------------------------
alter table Price alter column weekly_price type varchar(100) using  weekly_price::varchar(100);
update Price set  weekly_price = replace( weekly_price,'$','') ;
update Price set  weekly_price = replace( weekly_price,',','') ;
alter table Price alter column  weekly_price type numeric(8,2) using  weekly_price::numeric(8,2); 
//----------------------------------------------------------------------------------------
alter table Price alter column monthly_price type varchar(100) using  monthly_price::varchar(100);
update Price set  monthly_price = replace( monthly_price,'$','') ;
update Price set  monthly_price = replace( monthly_price,',','') ;
alter table Price alter column  monthly_price type numeric(8,2) using  monthly_price::numeric(8,2); 
//----------------------------------------------------------------------------------------
alter table Price alter column security_deposit type varchar(100) using security_deposit::varchar(100);
update Price set  security_deposit = replace( security_deposit,'$','') ;
update Price set security_deposit = replace( security_deposit,',','') ;
alter table Price alter column  security_deposit type numeric(8,2) using  security_deposit::numeric(8,2);
//----------------------------------------------------------------------------------------
alter table Price alter column cleaning_fee type varchar(100) using cleaning_fee::varchar(100);
update Price set  cleaning_fee= replace( cleaning_fee,'$','') ;
update Price set cleaning_fee = replace( cleaning_fee,',','') ;
alter table Price alter column cleaning_fee type numeric(8,2) using cleaning_fee::numeric(8,2);
//----------------------------------------------------------------------------------------
alter table Price alter column extra_people type varchar(100) using extra_people::varchar(100);
update Price set  extra_people= replace( extra_people,'$','') ;
update Price set extra_people = replace( extra_people,',','') ;
alter table Price alter column  extra_people type numeric(8,2) using  extra_people::numeric(8,); 