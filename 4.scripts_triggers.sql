--R.N.02. Compra según el valor del equipo--
delimiter //
create or replace trigger compraSegunValor
before insert on equipoJugador
for each row
begin 
    declare valorJugador decimal(11,2);
    declare valorEquipo decimal(13,2);
    set valorEquipo = (select IFNULL(SUM(jugadores.valor),0) 
                        from equipoJugador
                        join jugadores on jugadores.id=equipoJugador.jugadorId
                        where equipoJugador.equipoId=new.equipoId);
    set valorJugador = (select jugadores.valor
                        from jugadores
                        where jugadores.id=new.jugadorId);
    if (valorJugador>=valorEquipo*0.6 and valorequipo>0) then
        signal sqlstate '45001' set message_text=
        "Un participante no puede comprar a un jugador cuyo valor de mercado suponga un 60% del valor total de su equipo";
    end if;
end //
delimiter ;

--R.N.04. Jugador compartido--
delimiter //
create or replace trigger jugadorCompartido
before insert on equipoJugador
for each row
begin
    declare n INT;
    set n = (Select Count(equipoJugador.id)
            from equipoJugador
            join equipos on equipoJugador.equipoId=equipos.id
            where equipoJugador.jugadorId=new.jugadorId and (
                select equipos.ligaId from equipos where equipos.id = new.equipoId
            )=equipos.ligaId);
    if (n>=1) then
        signal sqlstate '45003' set message_text=
        'Un jugador no puede estar en dos o más equipos a la vez en una misma liga';
    end if;
end //
delimiter ;

--R.N.05. Límite de plantilla--
delimiter //
create or replace trigger limiteDePlantilla
before insert on equipoJugador
for each row 
begin
    declare n INT;
    set n = (Select count(distinct equipoJugador.jugadorId)
            from equipoJugador
            where equipoJugador.equipoId=new.equipoId
            );
    if (n+1>22) then
        signal sqlstate '45004' set message_text=
        'Un equipo no puede tener más de 22 jugadores';
    end if;
end //
delimiter ;
