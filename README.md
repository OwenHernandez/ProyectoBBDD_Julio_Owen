# ProyectoBBDD

Hecho por Owen Daniel Hernández Hanrahan y Julio Manuel Gonzalez Gonzalez

## Índice

### [Modelo ER](#id1)

### [Modelo MR](#id2)

### [Normalización](#id3)

### [Sql](#id4)

## Modelo ER <a name="id1"></a>

![https://github.com/OwenHernandez/ProyectoBBDD_Julio_Owen/blob/main/Img/proyectoBBDD.drawio%20(1)-ER.drawio.png](https://github.com/OwenHernandez/ProyectoBBDD_Julio_Owen/blob/main/Img/proyectoBBDD.drawio%20(1)-ER.drawio.png)

## Modelo MR <a name="id2"></a>

![https://github.com/OwenHernandez/ProyectoBBDD_Julio_Owen/blob/main/Img/proyectoBBDD.drawio%20(1)-MR.drawio.png](https://github.com/OwenHernandez/ProyectoBBDD_Julio_Owen/blob/main/Img/proyectoBBDD.drawio%20(1)-MR.drawio.png)

## Normalización <a name="id3"></a>

En cuanto a la normalización de las tablas podemos observar como todas ellas cumplen las formas normales ya que tienen entre 1 y 2 atributos, que son atómicos, tienen que ver con la clave primaria y no hay transitividad entre ellos, esto hace que cumplan la 1,2 y 3 forma normal. 

A excepción de 2 tablas que se llaman curso y alumno, que tiene 3 atributos haciendo que estas sean candidatas a no cumplir la 3 forma normal. 
<ul>
<li>La primera tabla llamada curso, se puede ver que cumple la 3 forma normal porque del id puedes sacar el número pero del número no puedes sacar la letra ni de la letra puedes sacar el tipo.</li>
  
<li>Por último, a la tabla alumno le pasa la misma situación que a la tabla curso, del id puedes sacar las faltas pero de las faltas no puedes sacar la actitud.</li> 
</ul>
Todo esto hace posible que el modelo relacional este completamente normalizado.

## Sql <a name="id4"></a>

#### [Creación](https://github.com/OwenHernandez/ProyectoBBDD_Julio_Owen/blob/main/sql/creacion.sql)

#### [Procedimientos](https://github.com/OwenHernandez/ProyectoBBDD_Julio_Owen/blob/main/sql/procedimientos.sql)

#### [Vistas]()

#### [Indices]()

#### [Triggers]()
