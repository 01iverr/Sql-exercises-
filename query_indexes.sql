/* for Query 1 */
CREATE INDEX ID_INDEXx ON Listing (host_id);
CREATE INDEX ID_INDEX ON Host (id);
/*-----------------------------------------*/
/* for Query 2 */
CREATE INDEX ID_INDEX2 ON Price (guests_included); 

/*-----------------------------------------*/
/* for Query 3 */
CREATE INDEX INDEX3A ON ROOM2 (bathrooms);
/*-----------------------------------------*/
/* for Query 4 */
CREATE INDEX ID_INDEX4 ON Listing (id);
/*-----------------------------------------*/
/* for Query 5 */
CREATE INDEX ID_INDEX5 ON Listing (host_id);
/*-----------------------------------------*/
/* for Query 6 */
CREATE INDEX ID_INDEX6 ON location (zipcode);
/*-----------------------------------------*/
/* for Query 7 */
CREATE INDEX ID_INDEX7 ON Price(price);


