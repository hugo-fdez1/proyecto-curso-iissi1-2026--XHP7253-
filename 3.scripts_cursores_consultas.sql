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

--R.F.11--
select u.nombre,j.nombre,t.cantidad from transacciones t
join equipos e on t.equipoId=e.id
join jugadores j on j.id = t.jugadorId
join participantes p on e.participanteId=p.id
join usuarios u on u.id = p.usuarioId
where t.cantidad = (
    select Max(t1.cantidad) from transacciones t1
    where t1.equipoId=e.id
)
;
