set serveroutput on;
DECLARE 
   str string(20) :='&enter_the_string';
   
BEGIN 
   dbms_output.put_line(UPPER(str)); 
   
END;