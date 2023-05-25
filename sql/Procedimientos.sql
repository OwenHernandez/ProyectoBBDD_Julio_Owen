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
    insert into alumno values(id_CursoRnd, id_DocenteRnd);
    contador++;
    counter++;
  end while;
end
//
