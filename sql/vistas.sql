--vista docente, persona, gestiona y curso

create view lista_Docente as
select 
  d.id as DID, 
  p.nombre as nombre, 
  d.trabajo as trabajo, 
  group_concat(concat(c.numero, "º", c.letra, _utf8mb4' ', c.tipo) separator ", ") as curso
from 
  persona as p join docente as d
    ON p.id = d.id_Persona 
  JOIN gestiona as g
    ON d.id = g.id_Docente
  JOIN curso as c 
    ON g.id_Curso = c.id
GROUP BY d.id;

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
    ON p.id = a.id_Persona 
  JOIN curso as c 
    ON a.id_Curso = c.id
GROUP BY a.id;