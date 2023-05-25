--Grupo

drop procedure if exists Insert_grupo;
delimiter//
create procedure Insert_grupo(in num_inserts int)
begin
  declare numeroRnd int;
  declare tipoRnd enum;
  declare contador int;
  declare id_ActividadRnd int;
  set id_ActividadRnd = 1;
  set contador=1;
  while (contador<=num_inserts) do
    set numeroRnd = (select floor(rand()*(10 - 0) + 0));
    contador++;
    set tipoRnd = elt(floor(rand()*3) + 1, 'examen', 'destreza', 'actitud');
    insert into actividad values(null, tipoRnd);
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
