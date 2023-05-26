--Trigger alumno

DELIMITER $$
create trigger actitud_alumno
after insert on alumno
for each row 
begin
    if faltas > 50
      then set actitud = "negativo";
    end if; 
end
$$