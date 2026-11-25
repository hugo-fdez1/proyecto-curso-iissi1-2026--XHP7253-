--R.F.09--
select usuarios.nombre, jornadas.numero,IFNULL(AVG(puntuaciones.puntos),0) from usuarios
left join participantes on participantes.usuarioId=usuarios.id
left join equipos on equipos.participanteId=participantes.id
left join equipoJugador on equipoJugador.equipoId=equipos.id
left join jugadores on jugadores.id=equipoJugador.jugadorId
left join ligas on equipos.ligaId=ligas.id
left join jornadas on jornadas.ligaId=ligas.id
left join partidos on partidos.jornadaId=jornadas.id
left join puntuaciones on puntuaciones.partidoId=partidos.id and puntuaciones.jugadorId=jugadores.id
group by usuarios.nombre,equipos.id, jornadas.id;

--R.F.10--
select jugadores.nombre,SUM(puntuaciones.goles) from jugadores
join puntuaciones on puntuaciones.jugadorId=jugadores.id
group by jugadores.id
order by sum(puntuaciones.goles) Desc
Limit 5
;
