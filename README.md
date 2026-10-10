# Título Proyecto

## Miembros del grupo L1-DF-7

1. Fernández Alcántara, Hugo
2. Sánchez Carmona, Miguel Ángel
3. Villarán Córcoles, Kevin

## 1. Introducción al problema

- Descripción del problema para poner en contexto el proyecto, incluyendo información sobre los clientes y usuarios, la situación actual, problemas, expectativas, etc. Se valorará la presencia de información multimedia (fotos, gráficos, documentos escaneados, etc.).






## 2. Glosario de términos

- Términos específicos del dominio del problema, ordenados alfabéticamente. Se valorará la presencia de información multimedia.




## 3. Visión general del sistema

### 3.1. Requisitos generales

### 3.2. Usuarios del sistema

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

##### R.I.01. Título requisito de información

Como [tipo de usuario]
quiero [servicio]
para [razón]

**Prueba de aceptación**
- Descripción de la primera comprobación a realizar
- Descripción de la segunda comprobación a realizar
- ...

#### 4.1.2. Reglas de negocio

Regla de negocio R.N.01 : El dinero de la puja activa se retiene temporalmente del presupuesto disponible del usuario.

Regla de negocio R.N.02 : Si el saldo total del mánager es negativo al inicio de la jornada, la alineación puntúa 0.

Regla de negocio R.N.03 : Un jugador recién fichado mediante cláusula no puede ser clausulado de nuevo durante 14 días.

Regla de negocio R.N.04 : El sistema del mercado emitirá siempre una oferta automática basada en el valor de mercado actual dentro de las primeras 24 horas.

Regla de negocio R.N.05 : Si el capitán seleccionado recibe puntos negativos, la penalización también se multiplicará por 2.

Regla de negocio R.N.06 : Un mismo usuario no puede estar inscrito en más de 10 ligas en paralelo.

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


