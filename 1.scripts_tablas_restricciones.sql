create table usuarios(
    id INT not null auto_increment,
    correo VARCHAR(255) not null,
    nombre varchar(255) not null,
    contraseña varchar(255) not null, 
    primary key(id),
    unique(correo)
);

create table administradores(
    id int not null auto_increment,
    usuarioId int not null,
    primary key(id),
    foreign key (usuarioId) references usuarios(id)
        on delete cascade
        on update cascade,
    unique(usuarioId)
);

create table participantes(
    id int not null auto_increment,
    usuarioId int not null,
    presupuesto decimal(11,2) default 200000000.00,
    primary key(id),
    foreign key (usuarioId) references usuarios(id)
        on delete cascade
        on update cascade,
    unique(usuarioId)
);

CREATE TABLE ligas (
    id INT NOT NULL AUTO_INCREMENT,
    participanteId INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    codigo VARCHAR(8) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (participanteId) REFERENCES participantes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (codigo)
);

CREATE TABLE participanteLiga (
    id INT NOT NULL AUTO_INCREMENT,
    participanteId INT NOT NULL,
    ligaId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (participanteId) REFERENCES participantes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ligaId) REFERENCES ligas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (participanteId, ligaId)
);

CREATE TABLE equipos (
    id INT NOT NULL AUTO_INCREMENT,
    participanteId INT NOT NULL,
    ligaId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ligaId) REFERENCES ligas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (participanteId) REFERENCES participantes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (participanteId, ligaId)
);

CREATE TABLE jugadores (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    valor DECIMAL(11,2) NOT NULL,
    posicion ENUM('DEL', 'MED', 'DEF', 'POR') NOT NULL,
    estadoFisico ENUM('LESIONADO', 'DISPONIBLE', 'DUDOSO', 'SANCIONADO') NOT NULL,
    foto VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE equipoJugador (
    id INT NOT NULL AUTO_INCREMENT,
    equipoId INT NOT NULL,
    jugadorId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (equipoId) REFERENCES equipos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (jugadorId) REFERENCES jugadores(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (equipoId, jugadorId)
);

CREATE TABLE jornadas (
    id INT NOT NULL AUTO_INCREMENT,
    ligaId INT NOT NULL,
    numero INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ligaId) REFERENCES ligas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (ligaId, numero)
);