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


