--vista docente, persona, gestiona y curso

create view lista_Docente as
select 
  d.id as DID, 
  d.trabajo as trabajo, 
  p.nombre as nombre, 
  group_concat(concat(c.numero, "º", c.letra, _utf8mb4' ', c.tipo) separator ", ") as curso
from 
  persona as p join docente as d
    ON p.id = d.id_Persona 
  JOIN gestiona as g
    ON d.id = g.id_Docente
  JOIN curso as c 
    ON g.id_Curso = c.id
GROUP BY d.id;