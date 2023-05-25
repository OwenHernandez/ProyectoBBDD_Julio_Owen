--Alumno

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

--Persona


drop PROCEDURE IF EXISTS inserts_Docente;
delimiter //
create PROCEDURE inserts_Docente(in numeroIns int)
begin 
    declare trabajoRnd enum;
    declare id_PersonaRnd int;
    declare counter int;
    declare contador int;
    set counter=(select count(*)+1 from persona);
    set id_DocenteRnd=(select id from persona where id=counter);
    set contador=1;
    while (contador<=numeroIns) do
        if id_DocenteRnd!=null then
            set id_PersonaRnd=(select id from persona where id=counter);
            set trabajoRnd = elt(floor(rand()*4) + 1, 'Historia', 'Lenguaje', 'Matematicas','Filosofia');
            Insert into docente values(null,trabajoRnd,id_PersonaRnd);
        end if;
        contador++;
        counter++;
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
    set counter=(select count(*)+1 from persona);
    set id_AlumnoRnd=(select id from alumno where id=counter)
    set contador=1;
    while (contador<=numeroIns) do
        if id_AlumnoRnd!=null then
            set fecha_FaltaRnd = (
                        now() - INTERVAL FLOOR(RAND() * 14) DAY 
                        + INTERVAL FLOOR(RAND() * 23) HOUR
                        + INTERVAL FLOOR(RAND() * 59) MINUTE
                        + INTERVAL FLOOR(RAND() * 59) SECOND
            );
            set id_AlumnoRnd=(select id from alumno where id=counter);
            Insert into persona values(null,fecha_FaltaRnd,id_AlumnoRnd);
        end if;
        contador++;
    end while;
end
//
