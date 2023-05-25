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
    declare trabajoRnd enum;
    declare id_PersonaRnd int;
    declare counter int;
    declare contador int;
    set counter=(select count(*)+1 from persona);
    set contador=1;
    while (contador<=numeroIns) do
        set id_DocenteRnd=(select id from persona where id=counter);
        if id_DocenteRnd!=null then
            set trabajoRnd = elt(floor(rand()*4) + 1, 'Historia', 'Lenguaje', 'Matematicas','Filosofia');
            Insert into docente values(null,trabajoRnd,id_PersonaRnd);
        end if;
        contador++;
        counter++;
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
    insert into gestiona values(id_CursoRnd, id_DocenteRnd);
    contador++;
    counter++;
  end while;
end
//




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


--Curso
create PROCEDURE inserts_Curso(in numeroIns int)
begin 
    declare numeroRnd int;
    declare letraRnd int;
    declare tipoRnd enum;
    declare contador int;
    set contador=1;
    while (contador<=numeroIns) do
        set tipoRnd = elt(floor(rand()*2) + 1, 'ESO', 'Bachillerato');
        if tipoRnd='ESO' then
            set numeroRnd=(select (rand()*4)+1);
        else
            set numeroRnd=(select (rand()*2)+1);
        end if;
        set letraRnd = elt(floor(rand()*3) + 1, 'A', 'B', 'C');
        Insert into curso values(null,numeroRnd,letraRnd,numeroRnd);
        contador++;
    end while;
end
//

--Calendario Faltas


create PROCEDURE inserts_CalendarioFaltas(in numeroIns int)
begin 
    declare fecha_FaltaRnd int;
    declare id_AlumnoRnd int;
    declare counter int;
    declare contador int;
    set counter=(select count(*)+1 from alumno);
    
    set contador=1;
    while (contador<=numeroIns) do
        set id_AlumnoRnd=(select id from alumno where id=counter)
        if id_AlumnoRnd!=null then
            set fecha_FaltaRnd = (
                        now() - INTERVAL FLOOR(RAND() * 14) DAY 
                        + INTERVAL FLOOR(RAND() * 23) HOUR
                        + INTERVAL FLOOR(RAND() * 59) MINUTE
                        + INTERVAL FLOOR(RAND() * 59) SECOND
            );
            Insert into persona values(null,fecha_FaltaRnd,id_AlumnoRnd);
        end if;
        contador++;
        counter++;
    end while;
end
//

--Pertenece


drop procedure if exists Insert_Pertenece;
delimiter//
create procedure Insert_Pertenece(in num_inserts int)
begin
  declare id_AlumnoRnd int;
  declare id_GrupoRnd int;
  declare counterAlumno int;
  declare counterGrupo int;
  set counterAlumno=(select count(*)+1 from alumno);
  set counterGrupo=(select count(*)+1 from grupo);
  set id_AlumnoRnd=1;
  set id_GrupoRnd=1;
  set contador=1;
  while (contador<=num_inserts or id_AlumnoRnd!=null or id_GrupoRnd!=null) do
    set id_AlumnoRnd=(select id from alumno where id=counterAlumno);
    set id_GrupoRnd=(select id from grupo where id=counterGrupo);
    
    if id_AlumnoRnd!=null and id_GrupoRnd !=null then
        insert into pertenece values(id_AlumnoRnd, id_GrupoRnd);
    end if;
    
    contador++;
    counter++;
  end while;

end
//

--Realiza Grupo


drop procedure if exists Insert_Realiza_Grupo;
delimiter//
create procedure Insert_Realiza_Grupo(in num_inserts int)
begin
  declare id_ActividadRnd int;
  declare id_GrupoRnd int;
  declare counterActividad int;
  declare counterGrupo int;
  set counterActividad=(select count(*)+1 from actividad);
  set counterGrupo=(select count(*)+1 from grupo);
  set id_ActividadRnd=1;
  set id_GrupoRnd=1;
  set contador=1;
  while (contador<=num_inserts or id_ActividadRnd!=null or id_GrupoRnd!=null) do
    set id_ActividadRnd=(select id from actividad where id=counterActividad);
    set id_GrupoRnd=(select id from grupo where id=counterGrupo);
    
    if id_ActividadRnd!=null and id_GrupoRnd !=null then
        insert into realiza_grupo values(id_ActividadRnd, id_GrupoRnd);
    end if;
    
    contador++;
    counter++;
  end while;

end
//

--Realiza_alumno

drop procedure if exists Insert_Realiza_alumno;
delimiter//
create procedure Insert_Realiza_alumno(in num_inserts int)
begin
  declare id_ActividadRnd int;
  declare id_AlumnoRnd int;
  declare counterActividad int;
  declare counterAlumno int;
  set counterActividad=(select count(*)+1 from actividad);
  set counterAlumno=(select count(*)+1 from alumno);
  set id_ActividadRnd=1;
  set id_AlumnoRnd=1;
  set contador=1;
  while (contador<=num_inserts or id_ActividadRnd!=null or id_AlumnoRnd!=null) do
    set id_ActividadRnd=(select id from actividad where id=counterActividad);
    set id_AlumnoRnd=(select id from alumno where id=counterAlumno);
    
    if id_ActividadRnd!=null and id_AlumnoRnd !=null then
        insert into realiza_alumno values(id_ActividadRnd, id_AlumnoRnd);
    end if;
    
    contador++;
    counter++;
  end while;

end
//
