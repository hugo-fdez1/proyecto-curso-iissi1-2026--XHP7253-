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

**R.F.05.01. Creación de jornadas**  
Como administrador,  
Quiero poder crear una nueva jornada,  
Para organizar el calendario de partidos de la temporada.
 
**Prueba de aceptación**
 
- Se introduce el número, la fecha de inicio y la fecha de fin de una jornada con datos válidos y el sistema crea la jornada en estado pendiente.
- Se intenta crear una jornada con un número ya existente o con la fecha de fin anterior a la de inicio y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.

**R.F.05.02. Lectura de jornadas**  
Como administrador / usuario,  
Quiero poder consultar los datos de una jornada o el calendario completo,  
Para saber cuándo se juega cada jornada y hasta cuándo puedo cambiar mi alineación.
 
**Prueba de aceptación**
 
- Se solicita consultar una jornada y el sistema muestra su número, fecha de inicio, fecha de fin y estado.
- Se solicita consultar una jornada que no existe y el sistema muestra un mensaje de jornada no encontrada.
- Se solicita el calendario filtrado por estado  y el sistema muestra solo las jornadas de ese estado.

**R.F.05.03. Modificación de jornadas**  
Como administrador,  
Quiero poder modificar los datos de una jornada,  
Para corregir errores o adaptarme a cambios en el calendario de partidos.
 
**Prueba de aceptación**
 
- Se modifica la fecha de inicio de una jornada pendiente con un valor válido y el sistema guarda el cambio.
- Se intenta modificar una jornada ya finalizada y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.

**R.F.05.04. Borrado de jornadas**  
Como administrador,  
Quiero poder eliminar una jornada,  
Para quitar jornadas creadas por error.
 
**Prueba de aceptación**
 
- Se elimina una jornada pendiente que no tiene alineaciones ni puntuaciones asociadas y el sistema la borra del calendario.
- Se intenta eliminar una jornada con alineaciones o puntuaciones asociadas, o una jornada ya finalizada, y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.

**R.F.06.01. Creación de puntuaciones**  
Como administrador,  
Quiero poder registrar los puntos que ha obtenido un jugador en una jornada,  
Para que el sistema pueda calcular la puntuación de los equipos y la clasificación.
 
**Prueba de aceptación**
 
- Se registran los puntos de un jugador en una jornada en curso o finalizada y el sistema guarda la puntuación y actualiza los puntos de los equipos que lo alinearon.
- Se intenta registrar la puntuación de un jugador que ya tiene puntos en esa jornada, o en una jornada pendiente, y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.


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
- Se intenta modificar la puntuación de un jugador que no tiene puntos registrados en esa jornada y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.


**R.F.06.04. Borrado de puntuaciones**  
Como administrador,  
Quiero poder eliminar la puntuación de un jugador en una jornada,  
Para quitar puntuaciones registradas por error.
 
**Prueba de aceptación**
 
- Se elimina la puntuación de un jugador en una jornada y el sistema la borra y recalcula los puntos de los equipos afectados y la clasificación.
- Se intenta eliminar una puntuación que no existe y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.

**R.F.06.05. Consulta de la clasificación**  
Como usuario / administrador,  
Quiero poder consultar la clasificación de la liga,  
Para conocer mi posición respecto al resto de participantes.
 
**Prueba de aceptación**
 
- Se solicita la clasificación y el sistema muestra los equipos ordenados por puntos totales de mayor a menor.
- Se solicita la clasificación de una jornada concreta y el sistema muestra solo los puntos obtenidos en esa jornada.
- Dos equipos empatan a puntos y el sistema los ordena aplicando el criterio de desempate.
- Se debe aplicar la regla de negocio R.N.XX.

**R.F.07.01. Creación de transacciones**  
Como usuario,  
Quiero poder realizar una transacción (puja por un jugador del mercado o venta de uno de mi plantilla),  
Para incorporar jugadores a mi equipo o recuperar presupuesto.
 
**Prueba de aceptación**
 
- Se realiza una puja por un jugador del mercado con un importe válido y el sistema registra la transacción como pendiente.
- Se intenta pujar con un importe superior al presupuesto disponible, con el mercado cerrado o con la plantilla completa y el sistema muestra un mensaje de error.
- Se intenta vender un jugador que no está en la plantilla del equipo y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.


**R.F.07.02. Lectura de transacciones**  
Como administrador / usuario ,  
Quiero poder consultar las transacciones realizadas,  
Para llevar el control de los fichajes, ventas y movimientos de presupuesto.
 
**Prueba de aceptación**
 
- Se solicita el historial de transacciones de un equipo y el sistema muestra jugador, tipo , importe, fecha y estado.
- Se solicita el historial de toda la liga y el sistema muestra las transacciones de todos los equipos ordenadas por fecha.
- Se solicita consultar una transacción que no existe y el sistema muestra un mensaje de transacción no encontrada.


**R.F.07.03. Modificación de transacciones**  
Como usuario,  
Quiero poder modificar el importe de una puja pendiente,  
Para mejorar mi oferta antes de que cierre el mercado.
 
**Prueba de aceptación**
 
- Se modifica el importe de una puja pendiente con un valor válido mientras el mercado está abierto y el sistema guarda el cambio.
- Se intenta modificar una transacción ya resuelta o con el mercado cerrado y el sistema muestra un mensaje de error.
- Se debe aplicar la regla de negocio R.N.XX.


**R.F.07.04. Borrado de transacciones**  
Como usuario,  
Quiero poder cancelar una puja pendiente,  
Para retirar mi oferta si ya no me interesa el jugador.
 
**Prueba de aceptación**
 
- Se cancela una puja pendiente con el mercado abierto y el sistema la elimina sin afectar al presupuesto.
- Se intenta cancelar una transacción ya resuelta y el sistema muestra un mensaje de error, porque el historial de fichajes no se puede borrar.
- Se debe aplicar la regla de negocio R.N.XX.


**R.F.07.05. Resolución de transacciones**  
Como administrador,  
Quiero poder cerrar el mercado y resolver las transacciones pendientes,  
Para que los jugadores se adjudiquen de forma justa y se actualicen las plantillas y presupuestos.
 
**Prueba de aceptación**
 
- Se cierra el mercado y cada jugador se adjudica a la puja de mayor importe, se descuenta el importe del presupuesto del ganador y el jugador se añade a su plantilla.
- Hay un empate entre dos pujas y el sistema adjudica el jugador a la puja registrada primero.
- Un jugador sin pujas no se adjudica y sigue disponible en el mercado.
- Se debe aplicar la regla de negocio R.N.XX.


#### 4.1.1. Requisitos de información

##### R.I.01. Consultar el perfil y estadísticas de un jugador

Como mánager de una liga
quiero visualizar todos los datos del jugador (puntos totales, media de puntos, valor de mercado)
para evaluar si conviene ficharlo para el equipo o no.

**Prueba de aceptación**
- Verificar que aparece una gráfica que refleje cómo ha ido evolucionando su valor en el mercado en los últimos 30 días.
- Comprobar que se muestre los puntos obtenidos por el jugador en cada jornada.
- Asegurar que sea visible el estado fisico del jugador para los partidos (disponible, dudoso, lesionado o sancionado).

#### R.I.02. Mostrar la actividad del mercado

Como mánager de una liga
quiero consultar un mural de actividad
para estar informado acerca de los movimientos de fichaje y venta de jugadores de mis rivales.

**Prueba de aceptación**
- Comprobar que aparece el nombre del mánager que ha hecho el movimiento, el jugador y el precio.
- Verificar que los eventos son ordenados cronológicamente, mostrando la fecha y hora exacta.
- Probar que el dinero pujado por el mánager hacia un jugador no se muestre hasta el cierre del mercado diario (referencia a R.F.01).

#### R.I.03. Visualizar la clasificación de la liga

Como mánager de una liga
quiero observar la tabla de clasificación
para conocer mi posición respecto a las de mis rivales.

**Prueba de aceptación**
- Revisar que muestre los nombres de los mánagers, los puntos totales y el número que indica la posición en la tabla.
- Verificar que las posiciones están ordenadas automáticamente de forma descendente, donde el que más puntos tenga es el que va primero.
- En caso de que dos managers estén empatados, muestre por delante al mánager cuyo equipo tenga más valor.

#### R.I.04. Consultar el balance financiero y movimientos de la cuenta

Como mánager de una liga
quiero acceder a un registro histórico de mis movimientos económicos
para llevar un control de mi presupuesto y evitar saldos negativos.

**Prueba de aceptación**
- Verificar que aparece por cada movimiento la fecha, un concepto (por ejemplo: "Has fichado a [Jugador]", "Has subido la cláusula de [Jugador]", "En la jornada x has ganado:") y el importe.
- Comprobar que, al realizar una puja, se muestre el presupuesto final de la resta del presupuesto inicial menos el dinero pujado y esa misma resta.

#### R.I.05. Visualizar los puntos de la jornada en directo

Como mánager de una liga
quiero observar en directo cómo se van actualizando los puntos que están consiguiendo mis jugadores titulares
para seguir el rendimiento del equipo.

**Prueba de aceptación**
- Validar que cada jugador titular muestre los puntos que lleva generados hasta el momento y que los puntos del equipo sea la suma de estos.
- Comprobar que el jugador designado como capitán se muestre ya con la puntuación multiplicada por 2.

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

##### R.N.08. Varios equipos, un mismo manager

Un manager no puede tener dos (o más) equipos en una misma liga.

##### R.N.09. Bloqueo de cláusulas previo a la jornada

Un mánager no puede fichar a un jugador de algún rival mediante cláusula durante las 24 horas antes de empezar la jornada.


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


