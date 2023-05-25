Tabla Alumno

drop procedure if exists Insert_alumno;
delimiter//
create procedure Insert_alumno(in num_inserts int)
begin
  declare idRnd int;
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
    insert into alumno values(idRnd, faltasRnd, actitudRnd, id_PersonaRnd, id_CursoRnd);
    contador++;
    counter++;
  end while;
end
//
