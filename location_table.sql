create  table Location as (select distinct id as listing_id, street, neighbourhood, neighbourhood_cleansed, city, state, zipcode, market, smart_location, country_code, country, latitude, longitude, is_location_exact from listings2);
//----------------------------------------------------------------------------------------
ALTER TABLE  Location  ADD FOREIGN KEY (listing_id) REFERENCES Listings2(id);
ALTER TABLE Location ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods2(neighbourhood);
//----------------------------------------------------------------------------------------
ALTER TABLE Listings2 
drop column street,
drop column neighbourhood, 
drop column neighbourhood_cleansed, 
drop column city, 
drop column state, 
drop column zipcode, 
drop column market, 
drop column smart_location, 
drop column country_code, 
drop column country, 
drop column latitude, 
drop column longitude, 
drop column is_location_exact;