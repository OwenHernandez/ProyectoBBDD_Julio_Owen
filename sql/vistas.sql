--vista docente, persona, gestiona y curso

create view lista_Docente as
select
  d.id as DID,
  p.nombre as nombre,
  d.trabajo as trabajo,
  group_concat(concat(c.numero, "º", c.letra, _utf8mb4' ', c.tipo) separator ", ") as curso
from
  persona as p join docente as d
    on p.id = d.id_Persona
  join gestiona as g
    on d.id = g.id_Docente
  join curso as c
    on g.id_Curso = c.id
group by d.id;

--vista alumno, persona, gestiona y curso

create view lista_Alumno as
select
  a.id as AID,
  p.nombre as nombre,
  a.faltas as faltas,
  a.actitud as actitud,
  group_concat(concat(c.numero, "º", c.letra, _utf8mb4' ', c.tipo) separator ", ") as curso
from
  persona as p join alumno as a
    on p.id = a.id_Persona
  join curso as c
    on a.id_Curso = c.id
group by a.id;

--vista calendario_faltas y alumno

create view calendario as
select
  c.id as CID,
  group_concat(concat(p.nombre, _utf8mb4' ', c.fecha_Falta) separator ", ") as fecha_alumno
from
  persona as p join alumno as a
    on p.id = a.id_Persona
  join calendario_faltas as c
    on a.id = c.id_Alumno
group by c.id;

--vista grupo y alumno

create view grupos as
select
  g.id as GID,
  g.integrantes as integrantes,
  group_concat(concat(a.id, _utf8mb4' ', p.nombre) separator ", ") as miembros
from
  persona as p join alumno as a
    on p.id = a.id_Persona
  join pertenece as pe
    on a.id = pe.id_Alumno
  join grupo as g
    on pe.id_Grupo = g.id
group by g.id;