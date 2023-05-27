--Indice Docente

create fulltext index idx_trabajo on docente(trabajo);

--Indice curso

create index idx_curso on curso(numero, letra, tipo);

--Indice calendario_Faltas

create index idx_fechas on calendario_faltas(fecha_Falta);

--Indice persona

create index idx_nombre_persona on (nombre);

--Indice alumno

create index idx_actitud_alumno on (faltas, actitud);

--Indice grupo

create index idx_integrantes_grupo on (integrantes);

--Indice actividad

create index idx_tipo_actividad on (tipo);

--Indice nota

create index idx_valor_nota on (numero);
