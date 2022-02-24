create table Host as (select distinct host_id as id, host_url as url, host_name as name , host_since as since, host_location as location, host_about as about ,
host_response_time as response_time , host_response_rate as response_rate, host_acceptance_rate as acceptance_rate, host_is_superhost as is_superhost,
host_thumbnail_url as thumbnail_url, host_picture_url as picture_url, host_neighbourhood as neighbourhood, host_listings_count as listings_count,
host_total_listings_count as total_listings_count, host_verifications as  verifications, host_has_profile_pic as has_profile_pic, host_identity_verified as identity_verified ,
calculated_host_listings_count as calculated_listings_count from Listings2); 
//----------------------------------------------------------------------------------------
ALTER TABLE Host ADD PRIMARY KEY (id);
ALTER TABLE Listings2 ADD FOREIGN KEY (host_id) REFERENCES Host(id);
//----------------------------------------------------------------------------------------
ALTER TABLE Listings2 
drop column  host_url,  
drop column host_name,  
drop column host_since, 
drop column host_location,  
drop column host_about,
drop column host_response_time, 
drop column  host_response_rate, 
drop column  host_acceptance_rate, 
drop column  host_is_superhost,
drop column host_thumbnail_url, 
drop column  host_picture_url, 
drop column  host_neighbourhood, 
drop column  host_listings_count,
drop column host_total_listings_count, 
drop column  host_verifications, 
drop column  host_has_profile_pic, 
drop column  host_identity_verified,
drop column calculated_host_listings_count;