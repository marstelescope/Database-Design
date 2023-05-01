-- Procedures
-- Removes a customer from the database along with the reservations they’ve made.
CREATE OR REPLACE PROCEDURE Remove_Customer (custNo customers.CUST_ID%TYPE) AS
BEGIN
DELETE FROM reservations
WHERE cust_id = custNo;
DELETE FROM customers
WHERE cust_id = custNo;
END;
/

-- Counts the number of days before a screening is scheduled to run.
CREATE OR REPLACE PROCEDURE Days_Left (screendate IN screenings.screening_date%TYPE) AS
vdays_left NUMBER;
BEGIN
vdays_left := TRUNC(screendate) - TRUNC(SYSDATE);
dbms_output.put_line('Days remaining: ' || vdays_left);
END;
/

-- Functions
-- Generates all time total ticket sales for a cinema.
CREATE OR REPLACE FUNCTION GET_SALES_TOTAL(vcinema_id cinemas.cinema_id%TYPE) 
RETURN number AS total_amount NUMBER :=0;
BEGIN
SELECT SUM(r.price) INTO total_amount
FROM reservations r, theaters t, screenings s, cinemas c
WHERE r.screening_id = s.screening_id 
AND s.theater_id = t.theater_id
AND t.cinema_id = c.cinema_id
AND c.cinema_id = vcinema_id;
RETURN total_amount;
end;
/

-- Example
DECLARE 
   x number;
BEGIN 
x:= GET_SALES_TOTAL('M08'); 
dbms_output.put_line(' Total sales at M08 cinema: ' || x); 
 x:= GET_SALES_TOTAL('SV01'); 
dbms_output.put_line(' Total sales at SV01 cinema: ' || X); 
END; 
/

-- Seats remaining for a specific screening.
CREATE OR REPLACE FUNCTION SEATS_REMAINING(vscreening_id screenings.screening_id%TYPE) 
    RETURN number AS 
    seats_remaining NUMBER:= 0;
    cap number;
    seats number;
BEGIN 
    SELECT COUNT(res_id) INTO seats
    FROM reservations r, screenings s
    WHERE r.screening_id = s.screening_id AND
    r.screening_id = vscreening_id;

    SELECT t.capacity INTO cap FROM screenings s, theaters t
    WHERE s.screening_id = vscreening_id AND
    s.theater_id = t.theater_id;

    seats_remaining := (cap - seats);
    RETURN seats_remaining;

END;
/

-- Example
DECLARE 
   x number; 
BEGIN 
   x:= SEATS_REMAINING('SCNRM08');
   dbms_output.put_line('Seats remaining for screening SCNRM08: ' || x); 
END; 
/ 

-- Triggers
-- AFTER customer info has been updated. 
CREATE OR REPLACE TRIGGER signUp
AFTER INSERT ON customers
BEGIN
DBMS_OUTPUT.PUT_LINE('Customer Status Successfully Updated!');
END;
/

-- After a screening updates screening time, displays the old screening time and then the new screening time. 
-- This can be used to notify customers who have that screening_id in their reservations.
CREATE OR REPLACE TRIGGER screeningTimeChange
AFTER UPDATE ON screenings
FOR EACH ROW
BEGIN
IF (:old.start_time != :new.start_time) THEN
DBMS_OUTPUT.PUT_LINE('Movie start time has been changed for screening: ' || :old.screening_id );
DBMS_OUTPUT.PUT_LINE('The old screen time: ' || :old.start_time );
DBMS_OUTPUT.PUT_LINE('The new screen time: ' || :new.start_time );
END IF;
END;
/



