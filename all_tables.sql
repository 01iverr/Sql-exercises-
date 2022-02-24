create table Listings2 as select * from Listings;
ALTER TABLE Listings2 ADD PRIMARY KEY (id);
//----------------------------------------------------------------------------------------
create table Calendar2 as select * from Calendar;
ALTER TABLE Calendar2 ADD PRIMARY KEY (listing_id, date);/*!!!!!!!!!!!!!!*/
//----------------------------------------------------------------------------------------
create table Geolocation2 as select * from Geolocation;
//----------------------------------------------------------------------------------------
create table Listings_Summary2 as select * from Listings_Summary;
ALTER TABLE Listings_Summary2 ADD PRIMARY KEY (id);/*!!!!!!!!!!!!!!*/
//----------------------------------------------------------------------------------------
create table Neighbourhoods2 as select * from Neighbourhoods;
ALTER TABLE Neighbourhoods2 ADD PRIMARY KEY (neighbourhood);
//----------------------------------------------------------------------------------------
create table Reviews2 as select * from Reviews;
ALTER TABLE Reviews2 ADD PRIMARY KEY (id);
//----------------------------------------------------------------------------------------
create table Reviews_Summary2 as select * from  Reviews_Summary;
//----------------------------------------------------------------------------------------
ALTER TABLE Calendar2 ADD FOREIGN KEY (listing_id) REFERENCES Listings2(id);
ALTER TABLE Listings2 ADD FOREIGN KEY (id) REFERENCES Listings_Summary2(id);
ALTER TABLE Listings_summary2 ADD FOREIGN KEY (neighbourhood) REFERENCES Neighbourhoods2(neighbourhood);
ALTER TABLE Reviews2 ADD FOREIGN KEY (listing_id) REFERENCES Listings2(id);
ALTER TABLE Reviews_Summary2 ADD FOREIGN KEY (listing_id) REFERENCES Listings2(id);
ALTER TABLE Geolocation2 ADD FOREIGN KEY (properties_neighbourhood) REFERENCES Neighbourhoods2(neighbourhood);
//----------------------------------------------------------------------------------------
ALTER TABLE Neighbourhoods2 RENAME TO Neighbourhood;
//----------------------------------------------------------------------------------------
ALTER TABLE Listings2 RENAME TO Listing;
//----------------------------------------------------------------------------------------
ALTER TABLE Reviews2 RENAME TO Review;
//----------------------------------------------------------------------------------------
ALTER TABLE Reviews_Summary2 RENAME TO Review_Summary;
//----------------------------------------------------------------------------------------
ALTER TABLE Listings_Summary2 RENAME TO Listing_Summary;
//----------------------------------------------------------------------------------------