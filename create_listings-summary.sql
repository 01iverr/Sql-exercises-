create table Listings_Summary(
   id int,
   name varchar(100),
   host_id int,
   host_name varchar(40),
   neighbourhood_group varchar(10),
   neighbourhood varchar(40),
   latitude float,
   longitude float,
   room_type varchar(20),
   price money,
   minimum_nights int,
   number_of_reviews int,
   last_review date,
   reviews_per_month float,
   calculated_host_listings_count int,
   availability_365 int
);