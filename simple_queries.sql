/*1) emfanizei thn elaxisth, th mesh kai th megisth vathmologia sto score thw kathariotitas gia mia sygkekrimeni hmera
output: 1 row to opio einai min:2, avg:9.63, max:10*/
select min(listings.review_scores_cleanliness), round(avg(listings.review_scores_cleanliness), 2), max(listings.review_scores_cleanliness) from listings full outer join calendar on calendar.listing_id = listings.id  where calendar.date= '2020-05-26';

/*2) emfanizei 100 apo ta onomata Airbnbs apo thn envsi tvn pinakvn listings kai calendar me idio id me goup by gia na emfanistei kaue onoma mia fora 
output: 100 rows*/
select  listings.name from listings full outer join calendar on listings.id = calendar.listing_id group by listings.name limit 100;

/*3) emfanizei ta onomata tvn Airbnbs pou eixan synoliko score anamesa sto 2 kai to 5
output:38 rows*/
select listings.name from listings inner join reviews on listings.id = reviews.listing_id where listings.review_scores_value between 2  and 5 group by listings.name; 


/*4) emfanizei tis perioxes me onomata pou arxizoun apo elliniko p 
output:9 rows*/
select properties_neighbourhood from geolocation  where properties_neighbourhood like 'Π%' ;

/*5) emfanizei tis perioxes me onomata pou periexoun OY 
output:7 rows*/
select neighbourhood from neighbourhoods  where neighbourhood like '%ΟΥ%' ;

/*6) emfanizei ta onomata tou airbnb (listing_id) ,ta onomata twn  idiokthtwn tous  (host_name) kai ta mpania pou diauetoyn twn 5 prwtwn dia8esimwn(pou einai se katastash available) me ta perissotera mpania stis 2020/08/15
output: 5 row */
select  distinct listings.name, listings.host_name, listings.bathrooms from listings full join calendar on calendar.listing_id = listings.id where listings.bathrooms>2 and listings.has_availability and calendar.date ='2020-08-15' order by listings.bathrooms DESC limit 5;

/*7) emfanizei thn xwra (country) thn polh (city) k to zipcode toy katalymatos poy mporeis na meineis perissotero kairo kai pou einai available stis 27/8/2020
output: 1 row "Greece"	"Athina"	"111 45"	9999999 */
select  distinct listings.country, listings.city, listings.zipcode , calendar.maximum_nights from listings full join calendar on calendar.listing_id = listings.id where calendar.maximum_nights = (select max(maximum_nights) from calendar where calendar.date = '2020-08-27' and calendar.available);

/*8) emfanizei to synolo tvn esodvn olvn tvn Airbnbs se mia ebdomada(2020/07/20-2020/07/27)
output: 1 row "$6,082,024.00"*/
select sum(listings.price) from listings join calendar on listings.id=calendar.listing_id where date between '2020-07-20' and '2020-07-27'  ; 

/*9) emfanizei ta Airbnbs pou exoun th megalyterh timh thn xronia 2020
output: 4 rows 
"Acropolis Select Hotel, Single Room."	"$7,000.00"
"Acropolis Select Hotel, Twin Room."	"$7,000.00"
"Acropolis Select Hotel, Double Room."	"$7,000.00"
"Twin Room with extra bed, (folded rollaway bed)."	"$7,000.00"*/
select listings.name, listings.price from listings where((select max(listings.price) from listings join calendar on listings.id=calendar.listing_id where date between '2020-01-01' and '2020-12-31') = listings.price) ; 

/*10) emfanizei to pio fthno Airbnb me tis perissoteres kritikes
output: 1 row "Trad Studio Appt -  Central Athens"	"$35.00"	708*/
select listings.name, listings.price, listings_summary.number_of_reviews from listings join listings_summary on listings.id=listings_summary.id where((select max(number_of_reviews) from listings_summary) = listings_summary.number_of_reviews);

/*11) emfanizei ta 100 Airbnbs me flexible cancellation policy pou einai diathesima stis 18/09/2020 tajinomhmena me auxousa timh
outpout: 100 rows p.x:
"Economy sofa accommodation very central"	"$8.00"
"Nice cosy bedroom close to Athens city center"	"$8.00"
"The most quite place of Athens"	"$8.00"*/
select distinct listings.name, listings.price from listings join calendar on listings.id=calendar.listing_id where cancellation_policy = 'flexible' and listings.has_availability and date = '2020-09-18' order by listings.price limit 100;

/*12) emfanizei to auroisma tvn adjusted_price tvn Airbnbs poy diathetoun Hot tub, einai Laptop friendly workspace stis 2020/03/25
output: 1 row "$16,418.00"*/
select sum(calendar.adjusted_price) from listings join calendar on listings.id=calendar.listing_id where amenities like '%Hot tub%' and amenities like '%Laptop friendly workspace%' and calendar.date = '2020-03-25';