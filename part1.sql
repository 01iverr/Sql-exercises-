create table room2 as (select * from room);
alter table room2 add primary key (listing_id);
/*---------------------------------------------------*/
create table Amenity(amenity_id serial,amenity_name varchar(100));
/*---------------------------------------------------*/
insert into Amenity(amenity_name)  (select distinct split_a from regexp_split_to_table((select string_agg(amenities,',') from Room), ',') as split_a where split_a != '');
/*---------------------------------------------------*/
update Amenity set amenity_name = replace(amenity_name,'{','');
update Amenity set amenity_name = replace(amenity_name,'}','');
update Amenity set amenity_name = replace(amenity_name,'"','');
/*---------------------------------------------------*/
delete from amenity w using amenity k where w.amenity_id > k.amenity_id and w.amenity_name = k.amenity_name;
delete from amenity klm where klm.amenity_name = '';
/*---------------------------------------------------*/
alter table amenity  drop column amenity_id;
alter table amenity add column amenity_id serial;
alter table amenity add primary key (amenity_id);
/*---------------------------------------------------*/
create table connection_amenity_rooms(listing_id int,amenity_id int);
/*---------------------------------------------------*/	 
insert into connection_amenity_rooms(listing_id, amenity_id) select room.listing_id, amenity.amenity_id
from room join amenity on amenity.amenity_name in (select distinct split
from regexp_split_to_table((select string_agg(amenities,',') from Room), ',') as split);
/*---------------------------------------------------*/
alter table connection_amenity_rooms add foreign key (listing_id) references room2(listing_id);
/*---------------------------------------------------*/
alter table connection_amenity_rooms add foreign key (amenity_id) references amenity(amenity_id);
alter table room2 drop column amenities;
/*---------------------------------------------------*/










