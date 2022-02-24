create or replace function trigger1_func() returns trigger as $$ 
begin
update host  set calculated_listings_count = calculated_listings_count + 1 from Listing where host.id = Listing.host_id;
return null;
end;
$$
language PLPGSQL;

create trigger trigger1 after insert on Listing
for each row execute procedure trigger1_func(); 

create or replace function trigger2_func() returns trigger as $$
begin
update host  set calculated_listings_count = calculated_listings_count - 1 from Listing where host.id = Listing.host_id;
return null;
end;
$$
language PLPGSQL;

create trigger trigger2 after delete on Listing
for each row execute procedure trigger2_func();

/*Enhmervnei ton pinaka Listing sto pedio last_review otan prostithetai ena neo review sto sygkekrimeno id an einai poio prosfato apo to torino*/
create or replace function trigger3_func() returns trigger as $$ 
begin
update listing set last_review = greatest(new.date,last_review) from review where review.listing_id = Listing.id;
return null;
end;
$$
language PLPGSQL;

create trigger trigger3 after insert on review
for each row execute procedure trigger3_func();