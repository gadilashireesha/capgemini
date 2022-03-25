set serveroutput on;
declare
    v number:=&enter_a_number;
begin
    if MOD(v,2)=0 then 
        dbms_output.put_line(v||'is even');
    else 
        dbms_output.put_line(v||'is odd');
        
    end if;
        dbms_output.put_line('if then else construct complete');
end;
/