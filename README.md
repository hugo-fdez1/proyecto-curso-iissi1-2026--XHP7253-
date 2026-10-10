# Título Proyecto

## Miembros del grupo L1-DF-7

1. Fernández Alcántara, Hugo
2. Sánchez Carmona, Miguel Ángel
3. Villarán Córcoles, Kevin

## 1. Introducción al problema

- Nos han pedido una aplicación estilo "Fantasy" inspirada en LaLiga. En esta aplicación, un grupo de personas forman una liga en la que a cada usuario se le asigna un equipo inicial y se le da un presupuesto. Ese presupuesto se puede gastar en un mercado donde puedes comprar y vender jugadores y cada día salen unos jugadores nuevos que puedes fichar. Al final de cada jornada, según la actuación de cada jugador del equipo, el usuario gana (o pierde) una serie de puntos, coronándose un ganador de la liga al finalizar todas las jornadas.  
Actualmente, este formato se encuentra con varios problemas: muchos periódicos crean estas ligas "fantasy" (ver Figura 1), pero la inscripción y seguimiento son complejos, al tener que estar pendiente del periódico cada jornada, lo que supone un gasto importante además del propio gasto que conlleva la inscripción a la liga y la manera de gestionar el equipo (Ej. por teléfono, por correo); además de las ligas de los periódicos, existen ligas "entre amigos", mucho más casuales, pero con el inconveniente de que mínimo una persona debe gestionar toda la liga, es decir, gestionar los fichajes, el "Draft" (si se hace), el seguimiento de cada equipo y sus respectivos puntos, etc. Se espera que tomemos este formato y lo hagamos mucho más accesible, automatizando todos los problemas anteriormente mencionados para depender menos de una persona (o revista) que gestione la liga, implementando una base de datos con datos acerca de distintos puntos de la aplicación para facilitar el proceso.
Una vez discutido el problema y tras haber realizado varias entrevistas con el cliente, hemos realizado este borrador.

<img width="387" height="516" alt="image" src="https://github.com/user-attachments/assets/46e932d3-bf2f-41e9-b330-fd8260d4c7a0" />
Figura 1


## 2. Glosario de términos
- Términos específicos del dominio del problema, ordenados alfabéticamente. Se valorará la presencia de información multimedia.




## 3. Visión general del sistema
### 3.1. Requisitos generales
- R.G.01. Gestión de la automatización de la liga
  
  Como administrador,

  Quiero que el sistema automatice la gestión y las operaciones de la liga,

  Para reducir la carga de trabajo de los administradores.

- R.G.02. Gestión de roles

  Como administrador,

  Quiero que se diferencie entre permisos de usuario, administrador y creador de una liga, 

  Para controlar qué funciones puede hacer cada usuario.

- R.G.03. Gestión de las diferentes ligas

  Como administrador,

  Quiero gestionar distintas ligas de manera aislada,

  Para que distintos usuarios puedan jugar entre sí y tener varias competiciones sin interferencias entre sí.

- R.G.04. Gestión de la visibilidad

  Como usuario / administrador,

  Quiero poder ver la clasificación actual e histórica, estadísticas, perfiles de jugadores,

  Para aprender sobre cómo va la competición en cualquier momento.

- R.G.05. Gestión del acceso multiplataforma

  Como usuario / administrador,

  Quiero que la aplicación sea accesible desde navegadores web y dispositivos móviles,

  Para aumentar el número de usuarios lo máximo posible.

### 3.2. Usuarios del sistema
Se contemplan tres tipos de usuarios:
- Administrador: No es un participante. Gestiona la aplicación para que no tenga problemas. 
- Creador de liga: Crea la liga y gestiona las distintas opciones en relación a la liga y sus participantes (e.g. echar a los jugadores de la liga, establecer un presupuesto inicial). El creador es a su vez un participante más .
- Participante: Ficha jugadores y construye su equipo, gana una serie de puntos en función de la actuación de sus jugadores alineados. 
## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

#### R.F.01. Título requisito funcional

Como [tipo de usuario]
quiero [servicio]
para [razón]

**Prueba de aceptación**
- Descripción de la primera comprobación a realizar
- Descripción de la segunda comprobación a realizar
- Se debe aplicar la regla de negocio R.N.XX.
- ...

#### 4.1.1. Requisitos de información

##### R.I.01. Título requisito de información

Como [tipo de usuario]
quiero [servicio]
para [razón]

**Prueba de aceptación**
- Descripción de la primera comprobación a realizar
- Descripción de la segunda comprobación a realizar
- ...

#### 4.1.2. Reglas de negocio

##### R.N.01. Título regla negocio

Descripción de la regla de negocio.

### 4.2. Mapa de historias de usuario (opcional)

### 4.3. Requisitos no funcionales (opcional)

**R.N.F. 01. Título requisito no funcional**
Como [tipo de usuario]
quiero [servicio]
para [razón]

-- fin entregable 1 --

## 5. Modelo conceptual

### 5.1. Diagramas de clases UML

- con restricciones.

### 5.2. Escenarios de prueba

- con descripción textual y diagrama de objetos UML.

## 6. Matrices de trazabilidad

- Matriz de trazabilidad entre los elementos del modelo conceptual y los requisitos.

|       | EntidadX   | AsociaciónX  | RestricciónX  | Entidad2 ...   | 
|:------|:-----------|:-----------|:-----------|:-----------|
| RI-1  | X          | X          | X          | X          |
| RI-2  |            | X          |            | X          |
| RF-1  |            | X          |            | X          |
| RF-2  | X          |            | X          | X          |
| RN-1  |            | X          |            |            |
| RN-2  | X          | X          | X          |            |
| ...   |            |            |            |            |

-- fin entregable 2 --

## 7. Modelo relacional en 3FN

- Relaciones obtenidas al aplicar la transformación del modelo conceptual.

### 7.1.  Justificación de la estrategia de transformación de jerarquías

- si se identificaron jerarquías en el MC.


### 8. Matriz de trazabilidad MC/SQL (opcional):

- Restricciones sobre el MC / Elementos del modelo tecnológico (SQL) (Triggers, checks, etc.)
- Incluir Reglas de negocio — Constraints/Triggers en las matrices de trazabilidad para el entregable 3

|       | EntidadX   | AsociaciónX  | RestricciónX  | Entidad2 ...   | 
|:-------|:-------|:-------|:-------|:-------|
| TABLA-1 |        |        |        |        |
| TABLA-2 |        |        |        |        |
| TABLA-3 |        |        |        |        |
| TABLA-4 |        |        |        |        |
| TRIG-1 |        |        |        |        |
| TRIG-2 | X      | X      |        | X      |
| TRIG-3 |        | X      |        | X      |
| TRIG-4 |        |        | X      |        |
| CONST-1 |        |        |        |        |
| CONST-2 | X      | X      |        | X      |
| CONST-3 |        | X      |        | X      |
| CONST-4 |        |        | X      |        |

Se consideran todo tipo de constraints declarativas (aquellas definidas durante el CREATE TABLE).
-- fin entregable 3 --

## Referencias


