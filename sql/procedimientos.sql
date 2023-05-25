--Persona
drop PROCEDURE IF EXISTS inserts_Docente;
delimiter //
create PROCEDURE inserts_Docente(in numeroIns int)
begin 
    declare idRnd int;
    declare trabajoRnd enum;
    declare id_PersonaRnd int;
    set counter=(select count(*)+1 from persona);
    set id_DocenteRnd=(select id from persona where id=counter);
    set contador=1;
    while (contador<=numeroIns) do
        if id_DocenteRnd!=null then
            set id_PersonaRnd=(select id from persona where id=counter);
            set trabajoRnd = (case floor(rand()*3) 
         when 0 then 0 
         when 1 then 10 
         when 2 then 20 
         end);

            Insert into persona values(null,trabajoRnd,id_PersonaRnd);
        end if;
        contador++;
        counter++;
    end while;
end
//
DELIMITER ;
call meter_datos(10);

--Curso
