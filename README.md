# Título Proyecto

## Miembros del grupo L1-DF-7

1. Fernández Alcántara, Hugo
2. Sánchez Carmona, Miguel Ángel
3. Villarán Córcoles, Kevin

## 1. Introducción al problema

- Nos han pedido una aplicación estilo "Fantasy" inspirada en LaLiga. En esta aplicación, un grupo de personas forman una liga en la que a cada usuario se le asigna un equipo inicial y se le da un presupuesto. Ese presupuesto se puede gastar en un mercado donde puedes comprar y vender jugadores y cada día salen unos jugadores nuevos que puedes fichar. Al final de cada jornada, según la actuación de cada jugador del equipo, el usuario gana (o pierde) una serie de puntos, coronándose un ganador de la liga al finalizar todas las jornadas.  
Actualmente, este formato se encuentra con varios problemas: muchos periódicos crean estas ligas "fantasy" (ver Figura 1), pero la inscripción y seguimiento son complejos, al tener que estar pendiente del periódico cada jornada, lo que supone un gasto importante además del propio gasto que conlleva la inscripción a la liga y la manera de gestionar el equipo (Ej. por teléfono, por correo); además de las ligas de los periódicos, existen ligas "entre amigos", mucho más casuales, pero con el inconveniente de que mínimo una persona debe gestionar toda la liga, es decir, gestionar los fichajes, el "Draft" (si se hace), el seguimiento de cada equipo y sus respectivos puntos, etc. Se espera que tomemos este formato y lo hagamos mucho más accesible, automatizando todos los problemas anteriormente mencionados para depender menos de una persona (o revista) que gestione la liga, implementando una base de datos con datos acerca de distintos puntos de la aplicación para facilitar el proceso.

<img width="387" height="516" alt="image" src="https://github.com/user-attachments/assets/46e932d3-bf2f-41e9-b330-fd8260d4c7a0" /><br>
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
 **R.G.01. Gestión de los usuarios**  <br>
  Como administrador,<br>
  Quiero poder gestionar los distintos usuarios,<br>
  Para controlar el acceso y los permisos de cada usuario.<br>

**R.G.02. Gestión de la liga**<br>
  Como creador de la liga, <br>
  Quiero poder gestionar la liga,<br>
  Para el buen funcionamiento de la competición.<br>
  
  **R.G.03. Gestión del equipo**<br>
  Como participante,<br>
  Quiero poder gestionar el equipo,<br>
  Para poder competir en la liga adecuadamente.<br>

  **R.G.04. Gestión de los jugadores**<br>
  Como participante / administrador,<br>
  Quiero poder gestionar los jugadores,<br>
  Para el buen funcionamiento de las estadísticas y transacciones.<br>

  **R.G.05. Gestión de la jornada**  <br>
  Como administrador,<br>
  Quiero poder gestionar la jornada,<br>
  Para organizar fácilmente el calendario de partidos.<br>

  **R.G.06. Gestión de la puntuación** <br> 
  Como administrador,<br>
  Quiero poder gestionar la puntuación,<br>
  Para el buen funcionamiento de la clasificación.<br>

  **R.G.07. Gestión de las transacciones**  <br>
  Como participante / administrador,<br>
  Quiero poder gestionar las transacciones,<br>
  Para facilitar la compraventa de jugadores.<br>

  **R.G.08. Gestión de los partidos**  <br>
  Como participante,<br>
  Quiero poder gestionar los partidos,<br>
  Para seguir una buena estrategia cada partido.<br>

## 4. Catálogo de requisitos

### 4.1. Requisitos funcionales
**R.F.01.01. Creación de usuarios**  <br>
Como administrador / participante,<br>
Quiero poder crear un nuevo usuario,<br>
Para poder participar y/o administrar la liga o la misma aplicación.<br>
  
**Prueba de aceptación**
- Una persona se registra en la aplicación con sus datos, se crea el usuario y puede comenzar a utilizar la aplicación.
- Una persona se registra en la aplicación con datos incorrectos y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.01.

**R.F.01.02. Lectura de usuarios**  <br>
Como administrador / usuario,<br>
Quiero poder consultar los datos asociados a un usuario,<br>
Para verificar su información o supervisar los usuarios registrados.<br>
  
**Prueba de aceptación**
- Se solicita consultar la información de un usuario y el sistema le muestra sus datos.
- Se solicita consultar la información de un usuario no registrado y el sistema le muestra un mensaje de "usuario no encontrado".
- Al consultar la información solo se muestra la información pública, ocultando datos privados como la contraseña.

**R.F.01.03. Modificación de usuarios**  <br>
Como administrador / usuario,<br>
Quiero poder modificar la información de un usuario,<br>
Para mantener actualizados los datos del usuario .<br>
  
**Prueba de aceptación**
- Se pide al sistema que edite alguno de los datos relacionados a un usuario registrado, se actualiza y se muestra un mensaje confirmando la edición seguido de los datos actualizados.
- Se pide al sistema que edite los datos relacionados a un usuario no registrado y se muestra un mensaje de "usuario no encontrado".
- Al editar se modifica alguno de los campos dejándolo en blanco y el sistema muestra un mensaje de error.

**R.F.01.04. Borrado de usuarios**  <br>
Como administrador / usuario ,<br>
Quiero poder borrar un usuario y los datos asociados a él,<br>
Para quitar del sistema usuarios innecesarios o que no vayan a utilizar la aplicación más.<br>
  
**Prueba de aceptación**
- Se intenta borrar un usuario del sistema, el sistema pide confirmación y una vez dada se elimina al usuario junto con sus datos.
- Se intenta borrar un usuario no registrado y el sistema muestra un mensaje de "usuario no encontrado".
- Al intentar iniciar sesión con sus datos, el sistema no permite el acceso y muestra un mensaje de "usuario no existe".


**R.F.02.01. Creación de la liga**  <br>
Como administrador / participante,<br>
Quiero crear una nueva liga,<br>
Para poder competir con otros usuarios en una misma competición.<br>
  
**Prueba de aceptación**
- Un usuario intenta crear una liga, se crea una nueva competición y se muestra al usuario la clasificación de esa nueva liga. 
- Un usuario no registrado intenta crear una liga y el sistema le manda a una pantalla de inicio de sesión.
- Se debe aplicar la regla de negocio R.N.02.

**R.F.02.02. Consulta de la liga**  <br>
Como administrador / usuario,<br>
Quiero poder consultar la información de una liga,<br>
Para verificar sus datos asociados y sus miembros.<br>
  
**Prueba de aceptación**
- Se solicita consultar la información de una liga y el sistema le muestra su nombre asociado, su código y los participantes de la liga.

**R.F.02.03. Modificación de la liga**  <br>
Como administrador / creador de la liga,<br>
Quiero poder modificar la información y los participantes de una liga,<br>
Para controlar la información de la liga y quién participa.<br>
  
**Prueba de aceptación**
- Se pide al sistema que edite alguno de los ajustes de la liga, el sistema guarda el cambio y muestra un mensaje de "operación exitosa".
- Se pide al sistema que expulse a algún miembro de la liga, se borra a ese usuario del sistema y se muestra un mensaje de "operación exitosa".
- Se debe aplicar la regla de negocio R.N.03.

**R.F.02.04. Borrado de la liga**  <br>
Como administrador / creador de la liga ,<br>
Quiero poder borrar una liga y toda su información asociada,<br>
Para eliminar ligas en las que ya no se vaya a competir.<br>
  
**Prueba de aceptación**
- Se intenta borrar una liga, el sistema borra la liga y sus datos asociados y muestra un mensaje de "operación exitosa".
- Al intentar unirse a una liga borrada, el sistema no lo permite y muestra un mensaje de "esa liga ya no existe".

**R.F.02.05. Unión a una liga**  <br>
Como administrador / usuario,<br>
Quiero que cada liga tenga asociado un código de 6 caracteres que permita unirse a dicha liga,<br>
Para que un usuario pueda unirse a una liga ya empezada.<br>
  
**Prueba de aceptación**
- Un usuario introduce un código asociado a una liga en la pantalla de inicio, se añade ese usuario a dicha liga y se muestra un mensaje de bienvenida a la liga. 
- Un usuario introduce un código no asociado a una liga y el sistema muestra un mensaje de "liga no encontrada".
- Se debe aplicar la R.N.02.

#### R.F.03.01. Creación de equipo

Como participante,<br>
quiero poder crear un equipo,<br>
para poder jugar y participar así en la liga creada.

**Prueba de aceptación**
- Un usuario se une a una liga y el sistema crea y registra el equipo.
- El sistema debe vincular correctamente el nuevo Equipo creado tanto a la Liga correspondiente como al Participante creador.
- Se debe aplicar la regla de negocio R.N.05.

#### R.F.03.02. Lectura de equipo

Como participante,<br>
quiero consultar el detalle de mi equipo (plantilla, presupuesto y puntos acumulados),<br>
para conocer la situación actual de mi plantilla y planificar mi estrategia para las próximas jornadas.

**Prueba de aceptación**
- Un participante busca la información de su equipo y el sistema muestra una pantalla con todos sus datos asociados.
- Se muestra el listado de jugadores que componen la plantilla actual del equipo.
- Si se intenta consultar un equipo que no se encuentra en la liga, el sistema denegará la visualización y mostrará un mensaje de error.

#### R.F.03.03. Modificación de equipo

Como participante, <br>
quiero modificar los datos de mi equipo, <br>
para mantener actualizada la identidad de mi equipo dentro de la liga.

**Prueba de aceptación**
- El propietario de un equipo modifica su equipo y el sistema actualiza los datos en la base de datos y muestra una confirmación con los datos del equipo actualizados en la pantalla de la liga.
- Se cumple la R.N.09.

#### R.F.03.04. Borrado de equipo

Como administrador / participante, <br>
quiero eliminar un equipo registrado en una liga, <br>
para darme de baja de la competición (como participante) o expulsar/retirar un equipo de la liga (como administrador).

**Prueba de aceptación**
- El sistema debe solicitar una verificación al usuario antes de realizar la acción para evitar borrados accidentales. 
- Al eliminar un equipo, el sistema libera los jugadores que pertenecían a ese equipo borrado.
- Al eliminar un equipo, el sistema modifica el número de participantes en la liga, además de la clasificación.
- Se cumple la R.N.10.

#### R.F.04.01. Creación de jugador

Como administrador,<br>
quiero dar de alta a un nuevo jugador en el sistema con sus datos base,<br>
para incorporar nuevos futbolistas al catálogo de la plataforma y permitir que los participantes puedan ficharlos en sus respectivas ligas.

**Prueba de aceptación**
- El administrador crea a un nuevo jugador junto con su información y el sistema registra a ese jugador y muestra un mensaje de confirmación.
- El sistema inicializa automáticamente los atributos calculables (/media y /puntosTotales) a cero.
- El sistema valida que la posición seleccionada esté permitidas por el enumerado (DEL, MED, DEF, POR).
- El sistema debe validar que el estado físico asignado pertenezca a su enumerado correspondiente (LESIONADO, DISPONIBLE, DUDOSO, SANCIONADO).
- Se debe aplicar la regla de negocio R.N.03.

#### R.F.04.02. Lectura de jugador

Como participante,<br>
quiero consultar la ficha de información detallada de un jugador,<br>
para evaluar su rendimiento, planificar mis alineaciones o analizar su posible fichaje en el mercado.

**Prueba de aceptación**
- Un usuario consulta a un jugador y el sistema muestra toda la información básica del jugador, además de sus atributos calculados.
- El sistema muestra el valor del jugador actualizado.
- Al buscar la información del jugador aparece el desglose de las puntuaciones obtenidas por el jugador en cada una de las jornadas disputadas.

#### R.F.04.03. Modificación del jugador

Como administrador,<br>
quiero modificar la ficha y las estadísticas de un jugador,<br>
para mantener actualizada la información del mercado y reflejar su situación real en la competición.

**Prueba de aceptación**
- El sistema valida que el usuario autenticado sea un administrador.
- El sistema permite buscar y seleccionar un Jugador existente para su edición.
- El sistema guarda los cambios en la base de datos y se muestra inmediatamente en las fichas del jugador.

#### R.F.04.04. Borrado del jugador

Como administrador,<br>
quiero eliminar todos los datos sobre un jugador,<br>
para retirar del sistema a futbolistas que han abandonado la competición real.

**Prueba de aceptación**
- Al intentar borrar un jugador, el sistema muestra un aviso al administrador y solicita una confirmación para procesar el borrado definitivo.
- Al proceder con la eliminación del jugador, el sistema desvincula el jugador borrado del equipo al que pertenecía y enviará un mensaje que indique la incidencia al participante afectado.
- El sistema elimina al jugador y a su información de la base de datos y muestra un mensaje de confirmación.
- Se cumple la R.N.10.

**R.F.05.01. Creación de jornadas**  
Como administrador,  
Quiero poder crear una nueva jornada,  
Para organizar el calendario de partidos de la temporada.
 
**Prueba de aceptación**
 
- Se introducen los datos asociados a una jornada y el sistema crea la jornada en estado pendiente.
- Se intenta crear una jornada con un número ya existente o con la fecha de fin anterior a la de inicio y el sistema muestra un mensaje de error.
- Se debe aplicar la R.N.11.
- Se debe aplicar la R.N.12.
- Se debe aplicar la R.N.15.
  
**R.F.05.02. Lectura de jornadas**  
Como administrador / usuario,  
Quiero poder consultar los datos de una jornada o el calendario completo,  
Para saber cuándo se juega cada jornada y hasta cuándo puedo cambiar mi alineación.
 
**Prueba de aceptación**
 
- Se consultar una jornada y el sistema muestra la información referente a esa jornada.
- Se solicita consultar una jornada que no existe y el sistema muestra un mensaje de jornada no encontrada.
- Se solicita el calendario filtrado por estado  y el sistema muestra solo las jornadas de ese estado. ???????????????????????????????

**R.F.05.03. Modificación de jornadas**  
Como administrador,
Quiero poder modificar los datos de una jornada,  
Para corregir errores o adaptarme a cambios en el calendario de partidos.
 
**Prueba de aceptación**
 
- Se modifica la fecha de inicio de una jornada pendiente con un valor válido y el sistema guarda el cambio.
- Se debe aplicar la regla de negocio R.N.11.

**R.F.05.04. Borrado de jornadas**  
Como administrador,  
Quiero poder eliminar una jornada,  
Para quitar jornadas creadas por error.
 
**Prueba de aceptación**
 
- Se elimina una jornada pendiente que no tiene alineaciones ni puntuaciones asociadas y el sistema la borra del calendario.
- Se intenta eliminar una jornada con alineaciones o puntuaciones asociadas, o una jornada ya finalizada, y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.10.

**R.F.06.01. Creación de puntuaciones**  
Como administrador,  
Quiero poder registrar los puntos que ha obtenido un jugador en una jornada,  
Para que el sistema pueda calcular la puntuación de los equipos y la clasificación.
 
**Prueba de aceptación**
 
- Se registran los puntos de un jugador en una jornada en curso o finalizada y el sistema guarda la puntuación y actualiza los puntos de los equipos que lo alinearon.
- Se intenta registrar la puntuación de un jugador que ya tiene puntos en esa jornada, o en una jornada pendiente, y el sistema muestra un mensaje de error.


**R.F.06.02. Lectura de puntuaciones**  
Como administrador / usuario,  
Quiero poder consultar los puntos de un jugador o de un equipo en una jornada,  
Para saber cómo ha rendido cada uno.
 
**Prueba de aceptación**
 
- Se solicita la puntuación de un jugador en una jornada y el sistema muestra sus puntos.
- Se solicita la puntuación de un equipo en una jornada y el sistema muestra los puntos de cada jugador alineado y el total.
- Se solicita la puntuación de una jornada sin puntos registrados y el sistema muestra un mensaje de puntuación no disponible.


**R.F.06.03. Modificación de puntuaciones**  
Como administrador,  
Quiero poder corregir los puntos de un jugador en una jornada,  
Para arreglar errores en la puntuación.
 
**Prueba de aceptación**
 
- Se modifica la puntuación de un jugador con un valor válido y el sistema guarda el cambio y recalcula los puntos de los equipos afectados y la clasificación.
- Se intenta modificar la puntuación de un jugador que no tiene puntos registrados en esa jornada y el sistema muestra un mensaje de error. ???????????????????
- Se debe aplicar la regla de negocio R.N.10.


**R.F.06.04. Borrado de puntuaciones**  
Como administrador,  
Quiero poder eliminar la puntuación de un jugador en una jornada,  
Para quitar puntuaciones registradas por error.
 
**Prueba de aceptación**
 
- Se elimina la puntuación de un jugador en una jornada y el sistema la borra y recalcula los puntos de los equipos afectados y la clasificación.
- Se intenta eliminar una puntuación de un jugador sin puntuación asignada y el sistema muestra un mensaje de error.
- Se debe aplicar R.N.10.

**R.F.06.05. Consulta de la clasificación**  
Como usuario / administrador,  
Quiero poder consultar la clasificación de la liga,  
Para conocer mi posición respecto al resto de participantes.
 
**Prueba de aceptación**
 
- Se solicita la clasificación y el sistema muestra los equipos ordenados por puntos totales de mayor a menor.
- Se solicita la clasificación de una jornada concreta y el sistema muestra solo los puntos obtenidos en esa jornada.
- Dos equipos empatan a puntos y el sistema los ordena aplicando el criterio de desempate (mayor valor de equipo).

**R.F.07.01. Creación de transacciones**  
Como participante,  
Quiero poder realizar una transacción (puja por un jugador del mercado o venta de uno de mi plantilla),  
Para incorporar jugadores a mi equipo o recuperar presupuesto.
 
**Prueba de aceptación**
 
- Se realiza una puja por un jugador del mercado con un importe válido y el sistema registra la transacción como pendiente.
- Se intenta vender un jugador que no está en la plantilla del equipo y el sistema muestra un mensaje de error.
- Se debe aplicar R.N.13.
- Se debe aplicar R.N.14.


**R.F.07.02. Lectura de transacciones**  
Como administrador / usuario ,  
Quiero poder consultar el historial de transacciones realizadas,  
Para llevar el control de los fichajes, ventas y movimientos de presupuesto.
 
**Prueba de aceptación**
 
- Se solicita el historial de transacciones de un equipo y el sistema muestra jugador, tipo , importe, fecha, estado y participantes involucrados.
- Se solicita el historial de toda la liga y el sistema muestra las transacciones de todos los equipos ordenadas por fecha.
- Se solicita consultar una transacción que no existe y el sistema muestra un mensaje de transacción no encontrada.


**R.F.07.03. Modificación de transacciones**  
Como usuario,  
Quiero poder modificar el importe de una puja pendiente,  
Para mejorar mi oferta en base a mi estrategia.
 
**Prueba de aceptación**
 
- Se modifica el importe de una puja pendiente con un valor válido mientras el mercado está abierto y el sistema guarda el cambio.
- Se intenta modificar una transacción ya resuelta y el sistema muestra un mensaje de error.
- Se debe aplicar la R.N.09.
- Se debe aplicar la R.N.13.
- Se debe aplicar la R.N.14. 


**R.F.07.04. Borrado de transacciones**  
Como usuario,  
Quiero poder cancelar una puja pendiente,  
Para retirar mi oferta si ya no me interesa el jugador.
 
**Prueba de aceptación**
 
- Se cancela una puja pendiente y el sistema la elimina sin afectar al presupuesto.
- Se intenta cancelar una transacción ya resuelta y el sistema muestra un mensaje de error, porque el historial de fichajes no se puede borrar.


**R.F.07.05. Resolución de transacciones**  
Como administrador,  
Quiero poder cerrar el mercado y resolver las transacciones pendientes,  
Para que los jugadores se adjudiquen de forma justa y se actualicen las plantillas y presupuestos.
 
**Prueba de aceptación**
 
- Se cierra el mercado cada 24 horas y cada jugador se adjudica a la puja de mayor importe, se descuenta el importe del presupuesto del ganador y el jugador se añade a su plantilla.
- Hay un empate entre dos pujas y el sistema adjudica el jugador a la puja registrada primero.
- Un jugador sin pujas no se adjudica y sigue disponible en el mercado.
- Se debe aplicar la R.N.13.
- Se debe aplicar la R.N.14

**R.F.08.01. Creación de partidos**  
Como administrador,  
Quiero poder crear un partido,  
Para poder establecer el calendario de la liga sin problemas.
 
**Prueba de aceptación**
 
- Un administrador crea un partido asignándole sus atributos y relacionado con una jornada, el sistema crea y guarda ese partido y muestra un mensaje de "operación exitosa".
- Se debe aplicar la regla de negocio R.N.15.

**R.F.08.02. Lectura de partidos**  
Como participante / administrador,  
Quiero poder consultar los partidos que haya cada jornada,  
Para revisar el horario y seguir los resultados de cada partido.
 
**Prueba de aceptación**
 
- Un usuario consulta un partido y el sistema le muestra en pantalla todos los datos asociados a dicho partido.
- Al consultar una jornada, el sistema muestra todos los partidos.


**R.F.08.03. Modificación de partidos**  
Como administrador,  
Quiero poder modificar los partidos,  
Para editar en tiempo real cómo va el partido o cambiar su horario.
 
**Prueba de aceptación**
 
- Un administrador modifica un partido y su información y el sistema actualiza esa información y muestra un mensaje de "operación exitosa".
- Se debe aplicar la R.N.10.
- Se debe aplicar la R.N.15.
- Se debe aplicar la R.N.17.

**R.F.08.04. Borrado de partidos**  
Como administrador,  
Quiero poder eliminar un partido,  
Para borrar de manera definitiva partidos que hayan sido añadidos por error o que se hayan suspendido de manera definitiva.
 
**Prueba de aceptación**
 
- Un administrador elimina un partido y el sistema borra ese partido y sus datos y muestra un mensaje de "operación exitosa".
- Un administrador elimina un partido ya finalizado y el sistema muestra un mensaje de error.
- Se debe aplicar la R.N.17.
- Se debe aplicar la R.N.10.

?????????????????????????????????????????????
**R.F.08.05. Designación del capitán**  
Como participante,  
Quiero poder elegir un capitán entre los jugadores de mi alineación,  
Para duplicar los puntos de ese jugador en la jornada.
 
**Prueba de aceptación**
 
- Se designa capitán a uno de los jugadores alineados y el sistema lo guarda en la alineación.
- Se intenta designar capitán a un jugador que no está en la alineación o designar un segundo capitán y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.

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
- Varios Equipo pertence a un solo participante (cumpliendo siempre la R.N.05).
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
- Varios Jugadores pueden pertenecer a varios Equipos (respetando la R.N.04).
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
##### R.N.01. Correo único

No puede haber dos usuarios con el mismo correo electrónico.

##### R.N.02. Límite de ligas

Un usuario no puede participar en más de 5 ligas a la vez.

##### R.N.03. Permisos de gestión de la liga

Solo un administrador o el creador de una liga puede gestionar una liga y a sus participantes.

##### R.N.04. Jugador compartido

Un jugador no puede pertenecer a dos equipos diferentes en una misma liga.

##### R.N.05. Unicidad de equipo por liga

Un usuario no puede tener dos (o más) equipos en una misma liga.

##### R.N.06. Valor positivo del jugador

El valor económico del Jugador debe ser un importe numérico estrictamente mayor que cero.

##### R.N.07. Código incorrecto

Solo es posible unirse a una liga mediante un código alfanumérico de 6 caracteres.

##### R.N.08. Contraseña no permitida

La contraseña debe contener al menos 8 caracteres.

##### R.N.09. Permisos sobre un equipo

El propietario de un equipo (o un administrador) es el único que tiene permisos sobre su equipo.

##### R.N.10. Permisos de gestión

Solo un administrador puede gestionar la información referente a la aplicación.

##### R.N.11. Fechas de jornada

La fecha de inicio de una jornada no puede ser posterior a su fecha final.

##### R.N.12. Número de jornada incorrecto

El número de jornada debe ser mayor que cero.

##### R.N.13. Limite de plantilla

Un participante no puede tener más de 22 jugadores en propiedad.

##### R.N.14. Presupuesto positivo

Un participante no puede quedarse con un presupuesto negativo.

##### R.N.15. Un partido por jornada

Un equipo no puede jugar más de un partido por jornada.

##### R.N.16. Jornada única

El número de jornada debe ser único.

##### R.N.17. Modificación de partido finalizado

No se puede modificar un partido que ya haya finalizado.


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


