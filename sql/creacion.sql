create DATABASE GestionDocente;
use GestionDocente;

create table persona(
    id int not null auto_increment,
    nombre varchar(100),
    PRIMARY KEY(id)
);

create table docente(
    id int not null auto_increment,
    trabajo enum("Historia","Lenguaje","Matematicas","Filosofia") not null,
    PRIMARY KEY(id),
    id_Persona int references persona(id)
);

create table alumno(
    id int not null auto_increment,
    faltas int,
    actitud int,
    PRIMARY KEY(id),
    id_Persona int references persona(id),
    id_Curso int references curso(id)
);

create table curso(
    id int not null auto_increment,
    numero int,
    letra varchar(1),
    tipo varchar(100),
    PRIMARY KEY(id)
);

create table gestiona(
    id_Docente int not null,
    id_Curso int not null,
    PRIMARY KEY(id_Docente,id_Curso),
    FOREIGN KEY(id_Docente) references docente(id),
    FOREIGN KEY(id_Curso) references curso(id)

);

create table calendario_faltas(
    id int not null auto_increment,
    fecha_Falta date,
    PRIMARY KEY(id),
    id_Alumno int references alumno(id) 
);

create table grupo(
    id int not null auto_increment,
    integrantes text,
    PRIMARY KEY(id)
);

create table pertenece(
    id_Alumno int not null,
    id_Grupo int not null,
    PRIMARY KEY(id_Alumno,id_Grupo),
    FOREIGN KEY(id_Alumno) references alumno(id),
    FOREIGN KEY(id_Grupo) references grupo(id)
);

create table actividad(
    id int not NULL auto_increment,
    tipo varchar(100),
    PRIMARY KEY(id)
);

create table realiza_grupo(
    id_Grupo int not null,
    id_Actividad int not null,
    PRIMARY KEY(id_Grupo,id_Actividad),
    FOREIGN KEY(id_Grupo) references grupo(id),
    FOREIGN KEY(id_Actividad) references actividad(id)
);

create table nota(
    id int not null auto_increment,
    numero int,
    PRIMARY KEY(id),
    id_Actividad int references actividad(id) 
);

create table realiza_alumno(
    id_Alumno int not null,
    id_Actividad int not null,
    PRIMARY KEY(id_Alumno,id_Actividad),
    FOREIGN KEY(id_Alumno) references alumno(id),
    FOREIGN KEY(id_Actividad) references actividad(id)
);
