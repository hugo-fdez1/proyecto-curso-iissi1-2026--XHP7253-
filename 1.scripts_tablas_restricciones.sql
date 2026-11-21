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
    presupuesto decimal(9,2) default 200000000.00,
    primary key(id),
    foreign key (usuarioId) references usuarios(id)
        on delete cascade
        on update cascade,
    unique(usuarioId)
);

create table ligas(
    id int not null auto_increment,
    participanteId int not null,
    nombre varchar(255) not null,
    codigo varchar(8) not null,
    primary key(id),
    foreign key (participanteId) references participantes(id)
        on delete cascade
        on update cascade,
    unique(codigo)
)