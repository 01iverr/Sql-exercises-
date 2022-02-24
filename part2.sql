/*emfanizei ta onomata twn airbnbs , ta mpania tous , tous guest_included kai to security_deposit ta opoia exoyn perissotera apo 4 mpania, to security_deposit einai panw apo 200 kai to guest_included einai perissotero apo 1
output: 7 rows*/
select  Listing.name, Room2.bathrooms, Price.guests_included, Price.security_deposit  from Price
inner join Listing on Price.listing_id = listing.id 
inner join Room2 on Room2.listing_id = listing.id 
where Room2.bathrooms > 4 and Room2.security_deposit> cast(200 as money) and guests_included>1; 

/*emfanizei ta onomata twn airbnbs twn opoiwn to geometry_coordinates_0_0_28_0 einai anamesa sto 23.70 kai 23.71
output: 88 rows
*/
select listing.name from listing
full outer join location on location.listing_id = listing.id 
full outer join geolocation2 on location.neighbourhood_cleansed = geolocation2.properties_neighbourhood
where (cast (geolocation2.geometry_coordinates_0_0_28_0 as float) between 23.70 and 23.71) ;

/*emfanizei to onoma tou host kai to onoma tou Airbnb sta opoia to verification periexei government_id and facebook
output: 1056 rows*/
select host.name ,listing.name  from host inner join listing on listing.host_id= host.id 
group by host.name ,listing.name  ,verifications having verifications like '%government_id%' and verifications like '%facebook%' ;

/*emfanizei to synolo twn krevatiwn se ka8e zipcode kai ta emfanizei apta perissotera sta ligotera 
output: 44 rows*/
select location.zipcode, count(beds) from room2
full outer join location on location.listing_id = room2.listing_id
group by location.zipcode
having count(beds) > 100 order by count(beds) DESC;

/*emfanizei ta onomata twn host twn 10 akrivoterwn Airbnb kai thn timh tous se f8inousa seira
output: 10 rows*/
select host.name, price from price
inner join listing on listing.id = price.listing_id
inner join host on host.id = listing.host_id
where has_profile_pic and response_time like 'within an hour'
order by price DESC limit 10;