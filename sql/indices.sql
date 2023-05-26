CREATE INDEX nombreIndice ON nombreTabla(campo1 [,campo2...]);

--Indice Docente

create fulltext index idx_trabajo on docente(trabajo);

--Indice curso

create index idx_curso on curso(numero, letra, tipo);

--Indice calendario_Faltas

create index idx_fechas on calendario_faltas(fecha_Falta);

--Indice persona



--Indice alumno



--Indice grupo



--Indice actividad



--Indice nota

