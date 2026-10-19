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

-Alineación: Las distintas maneras en las que los jugadores pueden distribuirse por el campo.

-Clausula: El valor por el que puedes comprar directamente a los jugadores de otro equipo sin llegar a un acuerdo con su propietario.

-Clasificación: La posición de un equipo dependiendo de los puntos que ha sumado a lo largo de las jornadas.

-Equipo: Los jugadores que tiene un usuario en plantilla.

-Jornada: Los distintos partidos que se juegan entre los equipos alrededor de una misma fecha.

-Jugador: Futbolista propiedad de uno de los participantes de la liga o de la propia liga y que suma una serie de puntos dependiendo de su actuación.

-Liga: La competición en la que juegan los distintos participantes.

-Mercado: Portal en el que se compra y vende jugadores. Se actualiza cada día con jugadores nuevos propiedad del mercado.

-Plantilla: Conjunto de jugadores en propiedad de un usuario.

-Posición: Lugar en el campo donde el jugador suele encontrarse. (Portero, defensa, centrocampista, delantero)

-Puntos: Número asignado a cada jugador al finalizar una jornada según su actuación.

-Valor: Dinero que cuesta en el mercado un jugador.



## 3. Visión general del sistema
### 3.1. Usuarios del sistema
Se contemplan tres tipos de usuarios:
- Administrador: No es un participante. Gestiona la aplicación para que no tenga problemas. 
- Creador de liga: Crea la liga y gestiona las distintas opciones en relación a la liga y sus participantes (e.g. echar a los jugadores de la liga, establecer un presupuesto inicial). El creador es a su vez un participante más .
- Participante: Ficha jugadores y construye su equipo, gana una serie de puntos en función de la actuación de sus jugadores alineados.

### 3.2. Requisitos generales
 **R.G.01. Gestión de los usuarios**
  
  Como administrador,

  Quiero poder gestionar los distintos usuarios,

  Para controlar el acceso y los permisos de cada usuario.

**R.G.02. Gestión de la liga**
  
  Como creador de la liga,

  Quiero poder gestionar la liga,

  Para el buen funcionamiento de la competición.

  **R.G.03. Gestión del equipo**
  
  Como participante,

  Quiero poder gestionar el equipo,

  Para poder competir en la liga adecuadamente.

  **R.G.04. Gestión de los jugadores**
  
  Como participante / administrador,

  Quiero poder gestionar los jugadores,

  Para el buen funcionamiento de las estadísticas y transacciones.
  
  **R.G.05. Gestión de la jornada**
  
  Como administrador,

  Quiero poder gestionar la jornada,

  Para organizar fácilmente el calendario de partidos.
  
  **R.G.06. Gestión de la puntuación**
  
  Como administrador,

  Quiero poder gestionar la puntuación,

  Para el buen funcionamiento de la clasificación.

  **R.G.07. Gestión de las transacciones**
  
  Como participante / administrador,

  Quiero poder gestionar las transacciones,

  Para facilitar la compraventa de jugadores.

  **R.G.08. Gestión de las alineaciones**
  
  Como participante,

  Quiero poder gestionar las alineaciones,

  Para hacer un buen uso de los jugadores cada jornada. 

## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

R.F.01. Pujar por un jugador en el mercado
Como mánager de una liga

quiero realizar una puja económica por un futbolista libre en el mercado

para incorporarlo a mi plantilla y reforzar mi equipo.

Prueba de aceptación

-El sistema debe comprobar que el mánager dispone de presupuesto equivalente o superior al importe pujado.

-La puja realizada debe permanecer oculta para el resto de mánagers hasta la hora de cierre del mercado.

-Se debe aplicar la regla de negocio R.N.01 (El dinero de la puja activa se retiene temporalmente del saldo disponible del usuario).

R.F.02. Guardar alineación táctica
Como mánager de una liga

quiero seleccionar mi formación táctica y asignar 11 futbolistas titulares

para sumar los puntos que consigan estos jugadores durante los partidos de la jornada.

Prueba de aceptación

-Comprobar que no se permite guardar una alineación con más de 11 jugadores ni con puestos vacíos.

-Verificar que el sistema bloquee la edición de alineaciones en cuanto comience el primer partido de la jornada.

-Se debe aplicar la regla de negocio R.N.02 (Si el saldo total del mánager es negativo al inicio de la jornada, la alineación puntúa 0).

R.F.03. Pagar cláusula de rescisión
Como mánager de una liga

quiero pagar la cláusula de rescisión de un jugador de un rival

para ficharlo de forma inmediata sin necesidad de subasta.

Prueba de aceptación

-Verificar que la opción solo esté activa dentro del horario permitido para clausulados.

-Comprobar que el importe pagado se descuente al comprador y se abone instantáneamente al saldo del vendedor.

-Se debe aplicar la regla de negocio R.N.03 (Un jugador recién fichado mediante cláusula no puede ser clausulado de nuevo durante 14 días).

R.F.04. Poner un jugador en venta
Como mánager de una liga

quiero poner a un futbolista de mi plantilla en el mercado de fichajes

para recibir ofertas económicas del sistema o de otros mánagers y ganar presupuesto.

Prueba de aceptación

-Comprobar que el jugador aparezca inmediatamente en el mercado de ventas.

-Permitir retirar al jugador del mercado en cualquier momento antes de aceptar una oferta.

-Se debe aplicar la regla de negocio R.N.04 (El sistema del mercado emitirá siempre una oferta automática basada en el valor de mercado actual dentro de las primeras 24 horas).

R.F.05. Asignar capitán al equipo
Como mánager de una liga

quiero designar a un jugador titular como capitán de mi alineación

para duplicar los puntos que consiga durante la jornada.

Prueba de aceptación

-Verificar que solo se pueda seleccionar a un único jugador titular como capitán por jornada.

-Comprobar que en el cálculo de puntuación final de la jornada se aplique el multiplicador x2 sobre sus puntos netos.

-Se debe aplicar la regla de negocio R.N.15 (Si el capitán seleccionado recibe puntos negativos, la penalización también se multiplicará por 2).

R.F.06. Crear una liga privada
Como mánager

quiero crear una liga privada con un código de invitación único y una configuración personalizada

para competir exclusivamente con un grupo cerrado de amigos.

Prueba de aceptación

-Comprobar que el sistema genere un código único al completar la creación.

-Verificar que el usuario creador quede asignado automáticamente con el rol de Administrador de Liga.

-Se debe aplicar la regla de negocio R.N.02 (Un mismo usuario no puede estar inscrito en más de 10 ligas en paralelo).

#### 4.1.1. Requisitos de información

##### R.I.01. Información de usuario

Como mánager de una liga

quiero poder almacenar la siguiente información de Usuario:
- El correo que esa persona va a emplear para registrarse.
- La contraseña.
- El nombre que se asigna dentro de la aplicación.

para identificar a los usuarios en la plataforma y permitir su autentificación.

De esta clase Usuario derivan dos subclases:
- Administrador: usuario que tiene la capacidad de gestionar ligas.
- Participante: usuario que interactua con las ligas y cuenta con atributo propio:
  - El presupuesto inicial.

Y estas subclases se asocian de la siguiente forma:
- Un Administrador puede gestionar una o varias Ligas a nivel global.
- Un participante puede crear una o varias Ligas.  Además, el participante puede poseer uno o varios Equipos.

##### R.I.02. Información de la liga

Como mánager de una liga

quiero poder almacenar la siguiente información de la Liga:
- El nombre de esa liga.
- El código para unirse y participar.

para identificar de forma única la competición y permitir que los participantes se unan mediante un código privado.

Esta entidad Liga se asocia de la siguiente forma:
- Una Liga gestionada por un solo Administrador.
- Una Liga es creada por un único participante.
- Una Liga se compone obligatoriamente de uno a muchos Equipos.
- Una Liga está compuesta por una a muchas Jornadas.

##### R.I.03. Información del equipo

Como mánager de una liga

quiero poder almacenar la siguiente información sobre el Equipo:
- Los puntos totales (calculado mediante la suma de todos los puntos de la Alineación en cada Jornada).
- El valor del equipo (calculado mediante la suma del valor de cada Jugador en el equipo).

para saber cómo va el equipo en la clasificación general.

Esta entidad Equipo se asocia de la siguiente forma:
- Varios Equipo pertence a un solo participante (cumpliendo siempre la R.N.08).
- Uno o varios Equipos pertenecen a una sola liga.
- Un Equipo puede poseer entre 0 y muchos Jugadores.
- Varios Equipos guardan varias Alineaciones.

##### R.I.04. Información del jugador

Como mánager de una liga

quiero poder almacenar la siguiente información sobre el Jugador:
- El nombre.
- El valor de mercado.
- La media de puntos (calculado mediante la media aritmética de los puntos obtenidos en las últimas 5 Jornadas).
- La posición en la que juega.
- El estado físico (lesionado, disponible, dudoso o sancionado).
- Una foto del jugador
- Los puntos totales (obtenido mediante la suma de todos los puntos obtenidos en cada Jornada).

para consultar la ficha y las estadísticas del futbolista, saber si está disponible para ponerlo en la alineación y gestionar su compra o venta según su valor y posición.

Esta entidad Jugador se asocia de la siguiente forma:
- Varios Jugadores pertenecen a un equipo (respetando la RN.07).
- 11 Jugadores son alineados por una Alineación.
- Varios Jugadores juegan entre 0 y muchas Jornadas.

##### R.I.05. Información de la jornada

Como mánager de una liga

quiero poder almacenar la siguiente información sobre el Jornada:
- El número de la Jornada.
- La fecha de inicio: indica que día empieza la Jornada.
- La fecha de fin: indica que día termina la Jornada.

para tener organizado el calendario de la liga, controlar las fechas en las que los participantes pueden guardar su alineación y calcular las puntuaciones semanales.

Esta entidad Jornada se asocia de la siguiente forma:
- Una o varias Jornadas son compuestas en una Liga.
- Una Jornada registra muchas Alineaciones.
- Varias Jornadas son jugadas por varios Jugadores.

##### R.I.06. Información de puntuación

Como mánager de una liga

quiero poder almacenar la siguiente información sobre la Puntuación:
- Los goles marcados por el Jugador en la Jornada.
- Las asistencias realizadas.
- Los puntos obtenidos en la jornada (calculados a partir de los goles, asistencias y su actuación).

para saber cuántos puntos suma cada jugador en un partido concreto, actualizar los puntos de las alineaciones de los participantes y llevar el registro de estadísticas de los futbolistas.

Esta entidad Puntuación se asocia de la siguiente forma:
- Puntuacion nace de la relación muchos a muchos entre Jugador y Jornada. Cada registro de Puntuacion vincula a 1 único Jugador con 1 única Jornada para almacenar su rendimiento específico en ese partido.

##### R.I.07. Información de transacciones

Como mánager de una liga

quiero poder almacenar la siguiente información sobre la Transacción:
- La cantidad (el dinero de la operación).
- La fecha en la que se realiza.
- El estado de la operación (pendiente, aceptada o rechazada).

para registrar los fichajes y compraventas de jugadores entre equipos y llevar el control del dinero gastado en la liga.

Esta entidad Transacción se asocia de la siguiente forma:
- Transacción se modela como una clase de asociación sobre la relación entre Equipo y Jugador. Cada registro de Transacción vincula a 1 Equipo con 1 Jugador para registrar el intento o confirmación de su fichaje por una cantidad, fecha y estado concretos.

##### R.I.08. Información de las alineaciones

Como mánager de una liga

quiero poder almacenar la siguiente información sobre la Alineacion:
- Los puntos por Jornada (calculado como la suma de todas las Puntuaciones de los 11 Jugadores alineados).
- La formación que emplea el Equipo.
- La fecha de guardado de la Alineación.

para registrar los 11 jugadores y la formación táctica que elige el usuario en una jornada, comprobar que la guardó dentro del plazo límite y calcular los puntos que suma esa semana.

Esta entidad Alineación se asocia de la siguiente forma:
- Una o varias Alineaciones son registradas por la Jornada.
- Varias Alineaciones son guardadas por varios Equipos.
- Una Alineación alinea a 11 Jugadores.

#### 4.1.2. Reglas de negocio

#### R.N.01 
 El dinero de la puja activa se retiene temporalmente del presupuesto disponible del usuario.

#### R.N.02  
Si el saldo total del mánager es negativo al inicio de la jornada, la alineación puntúa 0.

####  R.N.03 
 Un jugador recién fichado mediante cláusula no puede ser clausulado de nuevo durante 14 días.

####  R.N.04  
El sistema del mercado emitirá siempre una oferta automática basada en el valor de mercado actual dentro de las primeras 24 horas.

#### R.N.05  
Si el capitán seleccionado recibe puntos negativos, la penalización también se multiplicará por 2.

####  R.N.06 
Un mismo usuario no puede estar inscrito en más de 10 ligas en paralelo.

##### R.N.07. Jugador compartido

Un jugador no puede pertenecer a dos equipos diferentes en una misma liga.

##### R.N.08. Unicidad de equipo por liga

Un manager no puede tener dos (o más) equipos en una misma liga.



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


