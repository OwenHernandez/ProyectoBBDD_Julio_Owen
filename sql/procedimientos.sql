--Alumno

drop procedure if exists Insert_alumno;
delimiter//
create procedure Insert_alumno(in num_inserts int)
begin
  declare faltasRnd int;
  declare id_PersonaRnd int;
  declare id_CursoRnd int;
  declare actitudRnd varchar(8);
  set counter=(select count(*)+1 from persona);
  set id_PersonaRnd=(select id from persona where id=counter);
  set contador=1;
  while (contador<=numeroIns) do
    if id_PersonaRnd!=null then
      set id_PersonaRnd=(select id from persona where id=counter);
    end if;
    if id_Curso !=null then
      set id_CursoRnd=(select id from curso where id=counter);
    end if;
    set faltasRnd = (select floor(rand()*(200 - 1) + 1));
    if (faltasRnd >= 50) then
      set actitudRnd = "negativo";
    else
      set actitudRnd = "positivo";
    end if;
    insert into alumno values(null, faltasRnd, actitudRnd, id_PersonaRnd, id_CursoRnd);
    contador++;
    counter++;
  end while;
end
//

--Persona

drop procedure if exists Insert_persona;
delimiter//
create procedure Insert_persona(in num_inserts int)
begin
  declare idRnd int;
  declare nombreRnd varchar(100);
  set idRnd = (select count(*)+1 from persona);
  set contador=1;
  while (contador<=num_inserts) do
    set nombreRnd = concat("Persona", idRnd);
    insert into persona values(null, nombreRnd);
    contador++;
    idRnd++;
  end while;
end
//

--Docente

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

--Gestiona

drop procedure if exists Insert_gestiona;
delimiter//
create procedure Insert_gestiona(in num_inserts int)
begin
  declare id_DocenteRnd int;
  declare id_CursoRnd int;
  set counter=(select count(*)+1 from docente);
  set id_DocenteRnd=(select id from docente where id=counter);
  set contador=1;
  while (contador<=num_inserts) do
    if id_DocenteRnd!=null then
      set id_DocenteRnd=(select id from docente where id=counter);
    end if;
    if id_Curso !=null then
      set id_CursoRnd=(select id from curso where id=counter);
    end if;
    insert into gestiona values(id_CursoRnd, id_DocenteRnd);
    contador++;
    counter++;
  end while;
end
//

--Curso


--Grupo

drop procedure if exists Insert_grupo;
delimiter//
create procedure Insert_grupo(in num_inserts int)
begin
  declare integrantesRnd int;
  declare contador int;
  set contador=1;
  while (contador<=num_inserts) do
    set integrantesRnd = (select floor(rand()*(5 - 1) + 1));
    contador++;
    insert into grupo values(null, integrantesRnd);
  end while;
end
//
