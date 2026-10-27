# Título Proyecto

## Miembros del grupo L1-DF-7

1. Fernández Alcántara, Hugo
2. Sánchez Carmona, Miguel Ángel
3. Villarán Córcoles, Kevin

## 1. Introducción al problema

(Hugo lo ha hecho)


## 2. Glosario de términos
-Alineación:  Las distintas maneras en las que los jugadores pueden distribuirse por el campo.

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

### 3.1. Requisitos generales

### 3.2. Usuarios del sistema

## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales

#### R.F.03.01. Creación de equipo

Como participante 
quiero poder crear un equipo
para poder jugar y participar así en la liga creada.

**Prueba de aceptación**
- El sistema debe vincular correctamente el nuevo Equipo creado tanto a la Liga correspondiente como al Participante creador.
- Se debe aplicar la regla de negocio R.N.08.


#### R.F.03.02. Lectura de equipo

Como participante 
quiero consultar el detalle de mi equipo (plantilla, presupuesto y puntos acumulados)
para conocer la situación actual de mi plantilla y planificar mi estrategia para las próximas jornadas.

**Prueba de aceptación**
- El sistema muestra el nombre del equipo, su valor total estimado y los puntos acumulados en la liga.
- Se muestra el listado de jugadores que componen la plantilla actual del equipo.
- Si un participante no posee un equipo en la liga consultada, el sistema denegará la visualización y mostrará un mensaje descriptivo.

#### R.F.03.03. Modificación de equipo

Como participante 
quiero modificar los datos de mi equipo
para mantener actualizada la identidad de mi equipo dentro de la liga.

**Prueba de aceptación**
- El participante debe ser el propietario del equipo que intenta editar (el sistema deniega la edición si no es el dueño).
- El sistema actualiza los datos en la base de datos y muestra una confirmación con los datos del equipo actualizados en la pantalla de la liga.

#### R.F.03.04. Borrado de equipo

Como administrador / participante 
quiero eliminar un equipo registrado en una liga
para darme de baja de la competición (como participante) o expulsar/retirar un equipo de la liga (como administrador).

**Prueba de aceptación**
- El sistema debe verificar que la acción la realice el participante propietario del equipo o el administrador que gestiona la liga.
- El sistema debe solicitar una verificación al usuario antes de realizar la acción para evitar borrados accidentales. 
- Al eliminar un equipo, el sistema tiene que liberar los jugadores que pertenecieron a ese equipo borrado.
- Se debe modificar el número de participantes en la liga, además de la clasificación.



#### R.F.04.01. Creación de jugador

Como administrador
quiero dar de alta a un nuevo jugador en el sistema con sus datos base
para incorporar nuevos futbolistas al catálogo de la plataforma y permitir que los participantes puedan ficharlos en sus respectivas ligas.

**Prueba de aceptación**
- El administrador debe introducir los datos obligatorios del nuevo jugador: nombre, posición, valor, foto, estado físico.
- El sistema inicializa automáticamente los atributos calculables (/media y /puntosTotales) a cero.
- El sistema valida que la posición seleccionada esté permitidas por el enumerado (DEL, MED, DEF, POR).
- El sistema debe validar que el estado físico asignado pertenezca a su enumerado correspondiente (LESIONADO, DISPONIBLE, DUDOSO, SANCIONADO).
- Se debe aplicar la regla de negocio R.N.03.
-  El sistema confirma el registro correcto y el jugador queda disponible en el mercado/catálogo global del sistema.


#### R.F.04.02. Lectura de jugador

Como participante
quiero consultar la ficha de información detallada de un jugador
para evaluar su rendimiento, planificar mis alineaciones o analizar su posible fichaje en el mercado.

**Prueba de aceptación**
- El sistema debe mostrar toda la información básica del jugador, además de sus atributos calculados.
- El sistema muestra el valor del jugador actualizado.
- Se permite consultar el desglose de las puntuaciones obtenidas por el jugador en cada una de las jornadas disputadas.

#### R.F.04.03. Modificación del jugador

Como administrador
quiero modificar la ficha y las estadísticas de un jugador
para mantener actualizada la información del mercado y reflejar su situación real en la competición.

**Prueba de aceptación**
- El sistema valida que el usuario auteticado sea un administrador.
- El sistema permite buscar y seleccionar un Jugador existente para su edición.
- El sistema guarda los cambios en la base de datos y se muestra inmediatamente en las fichas del jugador.

#### R.F.04.04. Borrado del jugador

Como adminsitrador
quiero eliminar todos los datos sobre un jugador
para retirar del sistema a futbolistas que han abandonado la competición real.

**Prueba de aceptación**
- El sistema valida que el usuario auteticado sea un administrador.
- El sistema muestra un aviso al administrador y solicita una confirmación para procesar el borrado definitivo.
- El sistema desvincula el jugador borrado del equipo al que pertenecía y enviará un mensaje que indique la incidencia al participante afectado.
El sistema elimina la entidad Jugador de la base de datos, lo retira del mercado global y muestra un mensaje de confirmación.


#### 4.1.1. Requisitos de información

##### R.I.01. Información de usuario

Como dueño de la aplicación

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
- Un participante puede crear una o varias Ligas.  Además, el participante puede poseer uno o varios Equipos.

##### R.I.02. Información de la liga

Como participante

quiero poder almacenar la siguiente información de la Liga:
- El nombre de esa liga.
- El código para unirse y participar.

para identificar de forma única la competición y permitir que los participantes se unan mediante un código privado.

Esta entidad Liga se asocia de la siguiente forma:
- Una Liga es creada por un único participante.
- Una Liga se compone obligatoriamente de uno a muchos Equipos.
- Una Liga está compuesta por una a muchas Jornadas.

##### R.I.03. Información del equipo

Como participante

quiero poder almacenar la siguiente información sobre el Equipo:
- Los puntos totales (calculado mediante la suma de todos los puntos de la Alineación en cada Jornada).
- El valor del equipo (calculado mediante la suma del valor de cada Jugador en el equipo).

para saber cómo va el equipo en la clasificación general.

Esta entidad Equipo se asocia de la siguiente forma:
- Varios Equipo pertence a un solo participante (cumpliendo siempre la R.N.08).
- Uno o varios Equipos pertenecen a una sola liga.
- Un Equipo puede poseer entre 0 y muchos Jugadores.
- Varios Equipos participan en varias Jornadas.

##### R.I.04. Información del jugador

Como participante

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
- Varios Jugadores pueden pertenecer a varios Equipos (respetando la RN.07).
- 11 Jugadores son alineados en varios Partidos.
- Varios Jugadores juegan entre 0 y muchas Jornadas.

##### R.I.05. Información de la jornada

Como administrador

quiero poder almacenar la siguiente información sobre el Jornada:
- El número de la Jornada.
- La fecha de inicio: indica que día empieza la Jornada.
- La fecha de fin: indica que día termina la Jornada.

para tener organizado el calendario de la liga, controlar las fechas en las que los participantes pueden guardar su alineación y calcular las puntuaciones semanales.

Esta entidad Jornada se asocia de la siguiente forma:
- Una Liga está compuesta obligatoriamente por una o varias Jornadas.
- En muchas Jornadas participan muchos Equipos.
- Varias Jornadas son jugadas por varios Jugadores.

##### R.I.06. Información de los partidos

Como administrador

quiero poder almacenar la siguiente información sobre el Partido:
- Los puntos por Jornada (calculado como la suma de todas las Puntuaciones de los 11 Jugadores alineados).
- La fecha y hora que comienza el Partido.
- El estado en el que se encuentra el Partido (PENDIENTE, EN_JUEGO, FINALIZADO, SUSPENDIDO).

para conocer el calendario de enfrentamientos, realizar el seguimiento del estado de cada partido en tiempo real y calcular automáticamente los puntos obtenidos por el equipo en dicha jornada.

Esta entidad Partido se asocia de la siguiente forma:
- Nace de la relación muchos a muchos entre Equipo y Jornada.
- Un Partido alinea a 11 Jugadores.


##### R.I.07. Información de transacciones

Como participante

quiero poder almacenar la siguiente información sobre la Transacción:
- La cantidad (el dinero de la operación).
- La fecha en la que se realiza.
- El estado de la operación (pendiente, aceptada o rechazada).

para registrar los fichajes y compraventas de jugadores entre equipos y llevar el control del dinero gastado en la liga.

Esta entidad Transacción se asocia de la siguiente forma:
- Transacción se modela como una clase de asociación sobre la relación entre Equipo y Jugador. Cada registro de Transacción vincula a 1 Equipo con 1 Jugador para registrar el intento o confirmación de su fichaje por una cantidad, fecha y estado concretos.

##### R.I.08. Información de puntuación

Como administrador

quiero poder almacenar la siguiente información sobre la Puntuación:
- Los goles marcados por el Jugador en la Jornada.
- Las asistencias realizadas.
- Los puntos obtenidos en la jornada (calculados a partir de los goles, asistencias y su actuación).

para saber cuántos puntos suma cada jugador en un partido concreto, actualizar los puntos de las alineaciones de los participantes y llevar el registro de estadísticas de los futbolistas.

Esta entidad Puntuación se asocia de la siguiente forma:
- Se modela como una clase de asociación sobre la relación de alineación entre Jugador y Partido.
- Cada registro de Puntuación vincula a 1 Jugador con 1 Partido concreto para almacenar sus estadísticas individuales y sus puntos derivados.



#### 4.1.2. Reglas de negocio

##### R.N.01. Jugador compartido
Un jugador no puede pertenecer a dos equipos diferentes en una misma liga.

##### R.N.02. Unicidad de equipos
Un manager no puede tener dos (o más) equipos en una misma liga.

##### R.N.03. Valor positivo del jugador
El jugador debe tener un valor económico introducido cuyo importe numérico mayor que cero.




### 4.2. Mapa de historias de usuario (opcional)

### 4.3. Requisitos no funcionales (opcional)

**R.N.F. 01. Título requisito no funcional**
Como administrador / participante 
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


