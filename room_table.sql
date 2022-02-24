create table Room as (select distinct id as listing_id, accommodates, bathrooms, bedrooms, beds, bed_type, amenities, square_feet, price, weekly_price, monthly_price, security_deposit from Listings2);
//----------------------------------------------------------------------------------------
ALTER TABLE  Room ADD FOREIGN KEY (listing_id) REFERENCES Listings2(id);
//----------------------------------------------------------------------------------------
ALTER TABLE Listings2 
drop column accommodates,
drop column  bathrooms, 
drop column bedrooms, 
drop column beds,
drop column bed_type,
drop column amenities,
drop column square_feet;
/*diagrafontai stous epomenous pinakes giati ta xreiazomaste
drop column price,
drop column weekly_price, 
drop column monthly_price, 
drop column security_deposit  */