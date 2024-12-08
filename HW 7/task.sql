    
                     CREATE VIEW samsBills AS
SELECT 
    S.first_name, 
    S.surname, 
    B.bill_date, 
    B.cust_name, 
    B.bill_total
FROM 
    restBill B
JOIN 
    restStaff S ON B.waiter_no = S.staff_no
WHERE 
    S.first_name = 'Sam' AND S.surname = 'Pitt';
    
    SELECT 
    first_name, 
    surname, 
    bill_date, 
    cust_name, 
    bill_total
FROM 
    samsBills
WHERE 
    bill_total > 400;
    
    CREATE VIEW roomTotals AS
SELECT 
    T.room_name, 
    SUM(B.bill_total) AS total_sum
FROM 
    restBill B
JOIN 
    restRest_table T ON B.table_no = T.table_no
GROUP BY 
    T.room_name;
    
    CREATE VIEW teamTotals AS
SELECT 
    CONCAT(H.first_name, ' ', H.surname) AS headwaiter_name, 
    SUM(B.bill_total) AS total_sum
FROM 
    restStaff W
JOIN 
    restStaff H ON W.headwaiter = H.staff_no
JOIN 
    restBill B ON W.staff_no = B.waiter_no
GROUP BY 
    H.first_name, H.surname;
    
    