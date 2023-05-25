--Persona

drop procedure if exists Insert_persona;
delimiter//
create procedure Insert_persona(in num_inserts int)
begin
  declare idRnd int;
  declare nombreRnd varchar(100);
  set idRnd = (select count(*)+1 from persona);
  set contador=1;
  while (contador<=numeroIns) do
    set nombreRnd = concat("Persona", idRnd);
    insert into persona values(idRnd, nombreRnd);
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
  declare idRnd int;
  declare nombreRnd varchar(100);
  set idRnd = (select count(*)+1 from persona);
  set contador=1;
  while (contador<=numeroIns) do
    set nombreRnd = concat("Persona", idRnd);
    insert into persona values(idRnd, nombreRnd);
    contador++;
    idRnd++;
  end while;
end
//
