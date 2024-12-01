 SELECT 
    S.first_name, 
    S.surname, 
    B.bill_date, 
    COUNT(B.bill_no) AS bill_count
FROM 
    restBill B
JOIN 
    restStaff S ON B.waiter_no = S.staff_no
GROUP BY 
    S.first_name, S.surname, B.bill_date
HAVING 
    COUNT(B.bill_no) >= 2;
    
    SELECT 
    T.room_name, 
    COUNT(T.table_no) AS table_count
FROM 
    restRest_table T
WHERE 
    T.no_of_seats > 6
GROUP BY 
    T.room_name;
    
    
  SELECT 
    T.room_name, 
    SUM(B.bill_total) AS total_bill_amount
FROM 
    restBill B
JOIN 
    restRest_table T ON B.table_no = T.table_no
GROUP BY 
    T.room_name;
    
    SELECT 
    H.first_name AS headwaiter_first_name, 
    H.surname AS headwaiter_surname, 
    SUM(B.bill_total) AS total_bill_amount
FROM 
    restStaff W
JOIN 
    restStaff H ON W.headwaiter = H.staff_no
JOIN 
    restBill B ON W.staff_no = B.waiter_no
GROUP BY 
    H.first_name, H.surname
ORDER BY 
    total_bill_amount DESC;
    
    SELECT 
    B.cust_name, 
    AVG(B.bill_total) AS avg_spent
FROM 
    restBill B
GROUP BY 
    B.cust_name
HAVING 
    AVG(B.bill_total) > 400.00;