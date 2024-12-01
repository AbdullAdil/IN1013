 SELECT 
    S.first_name, S.surname
FROM 
    restStaff S
INNER JOIN 
    restBill B ON S.staff_no = B.waiter_no
WHERE 
    B.cust_name = 'Tanya Singh';
    
    SELECT 
    RM.room_date
FROM 
    restRoom_management RM
INNER JOIN 
    restStaff S ON RM.headwaiter = S.staff_no
WHERE 
    RM.room_name = 'Green'
    AND S.first_name = 'Charles'
    AND RM.room_date LIKE '1602%';
    
    SELECT 
    S.first_name, S.surname
FROM 
    restStaff S
WHERE 
    S.headwaiter = (
        SELECT 
            headwaiter
        FROM 
            restStaff
        WHERE 
            first_name = 'Zoe' AND surname = 'Ball'
    );
    
    SELECT 
    B.cust_name, 
    B.bill_total, 
    S.first_name || ' ' || S.surname AS waiter_name
FROM 
    restBill B
INNER JOIN 
    restStaff S ON B.waiter_no = S.staff_no
ORDER BY 
    B.bill_total DESC;
    
    SELECT DISTINCT
    S.first_name, S.surname
FROM 
    restStaff S
INNER JOIN 
    restBill B ON S.staff_no = B.waiter_no
WHERE 
    B.table_no IN (
        SELECT 
            DISTINCT table_no
        FROM 
            restBill
        WHERE 
            bill_no IN (14, 17)
    );