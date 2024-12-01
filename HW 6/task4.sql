  SELECT DISTINCT
    B.cust_name
FROM 
    restBill B
JOIN 
    restRest_table T ON B.table_no = T.table_no
JOIN 
    restRoom_management RM ON T.room_name = RM.room_name AND B.bill_date = RM.room_date
JOIN 
    restStaff S ON RM.headwaiter = S.staff_no
WHERE 
    B.bill_total > 450.00
    AND S.first_name = 'Charles';
    
    SELECT DISTINCT
    S.first_name, S.surname
FROM 
    restStaff S
JOIN 
    restRoom_management RM ON S.staff_no = RM.headwaiter
JOIN 
    restRest_table T ON RM.room_name = T.room_name
JOIN 
    restBill B ON T.table_no = B.table_no
WHERE 
    B.cust_name = 'Nerida Smith' 
    AND B.bill_date = 160111;
    
    SELECT 
    B.cust_name
FROM 
    restBill B
WHERE 
    B.bill_total = (SELECT MIN(bill_total) FROM restBill);
    
    
    SELECT 
    S.first_name, S.surname
FROM 
    restStaff S
WHERE 
    S.staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);
    
    SELECT 
    B.cust_name,
    H.first_name AS headwaiter_first_name, 
    H.surname AS headwaiter_surname,
    R.room_name
FROM 
    restBill B
JOIN 
    restRest_table T ON B.table_no = T.table_no
JOIN 
    restRoom_management R ON T.room_name = R.room_name AND B.bill_date = R.room_date
JOIN 
    restStaff H ON R.headwaiter = H.staff_no
WHERE 
    B.bill_total = (SELECT MAX(bill_total) FROM restBill);