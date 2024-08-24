create type tipo_sangre
as enum ('A+','A-','B+','B-','AB+','AB-','O+','O-');

create table paciente
(
    id               serial primary key,
    nombre           varchar(100),
    apellido         varchar(100),
    fecha_nacimiento DATE,
    direccion        varchar(100),
    telefono         varchar(12),
    email            varchar(100),
    genero           int,
    tipo_sangre      tipo_sangre not null
);

create table medico
(
    id_medic           serial primary key,
    nombre             varchar(100),
    apellido           varchar(100),
    fecha_nacimiento   date,
    especialidad       varchar(100),
    telefono           varchar(12),
    email              varchar(100),
    fecha_contratacion date
);

create table personal_servicio
(
    id_personal        serial primary key,
    nombre             varchar(100),
    apellido           varchar(100),
    fecha_nacimiento   date,
    telefono           varchar(12),
    email              varchar(100),
    fecha_contratacion date
);

create table historia_clinica
(
    foreign key (id_paciente) references paciente (id),
    id_historia    serial primary key,
    id_paciente    int not null,
    diagnostico    varchar(100),
    tratamiento    varchar(100),
    fecha_registro date

);

create table secretario
(
    id_sec             serial primary key,
    nombre             varchar(100),
    apellido           varchar(100),
    fecha_nacimiento   date,
    telefono           varchar(12),
    email              varchar(100),
    fecha_contratacion date
);

create table ingreso
(
    id_pacientefk   int not null,
    id_secretariofk int not null,
    foreign key (id_pacientefk) references paciente (id),
    foreign key (id_secretariofk) references secretario (id_sec)
);

create table consultorio
(
    id_consultorio   serial primary key,
    tipo_consultorio varchar(100)
);

create table cita
(
    id_pac         int not null,
    id_med         int not null,
    id_consultorio int not null,
    id_cita        serial primary key,
    foreign key (id_pac) references paciente (id),
    foreign key (id_med) references medico (id_medic),
    foreign key (id_consultorio) references consultorio (id_consultorio),
    fecha_cita     date,
    motivo         varchar(1000)
);

create table historia_clinicaAUX
(
    pacientefk      serial not null,
    id_historia     serial primary key,
    foreign key (pacientefk) references paciente (id),
    diagnostico     varchar(10000),
    tratamiento     varchar(10000),
    fechaDeRegistro date
);

create table limpieza_consultorio
(
    fk_id_consultorio       serial not null,
    fk_id_personal_servicio serial not null,
    foreign key (fk_id_consultorio) references consultorio (id_consultorio),
    foreign key (fk_id_personal_servicio) references personal_servicio (id_personal),
    fecha_limpieza          date
);

create table equipos
(
    fk_id_habitacion serial not null,
    id_equipo        serial primary key,
    foreign key (fk_id_habitacion) references consultorio (id_consultorio),
    nombre_equipo    varchar(100),
    descripcion      varchar(100)
);


--insercion de datos

INSERT INTO paciente (nombre, apellido, fecha_nacimiento, direccion, telefono, email, genero, tipo_sangre)
VALUES
    ('Ana', 'García', '1990-05-12', 'Calle Luna 123', '555-1234', 'ana.garcia@example.com', 1, 'A+'),
    ('Luis', 'Pérez', '1985-07-22', 'Avenida Sol 456', '555-5678', 'luis.perez@example.com', 1, 'O-'),
    ('María', 'Lopez', '1978-11-30', 'Calle Estrella 789', '555-8765', 'maria.lopez@example.com', 2, 'B+'),
    ('Carlos', 'Martínez', '1992-04-10', 'Calle Mar 101', '555-4321', 'carlos.martinez@example.com', 1, 'AB-'),
    ('Laura', 'Rodríguez', '1980-09-15', 'Avenida del Norte 202', '555-3456', 'laura.rodriguez@example.com', 2, 'A-'),
    ('Jorge', 'Gómez', '1995-01-20', 'Calle del Río 303', '555-6543', 'jorge.gomez@example.com', 1, 'B-'),
    ('Patricia', 'Fernández', '1987-03-25', 'Calle del Bosque 404', '555-7890', 'patricia.fernandez@example.com', 2, 'AB+'),
    ('Antonio', 'Vázquez', '1965-12-12', 'Avenida de la Paz 505', '555-9876', 'antonio.vazquez@example.com', 1, 'O+'),
    ('Elena', 'Moreno', '1991-10-05', 'Calle del Sol 606', '555-3210', 'elena.moreno@example.com', 2, 'A+'),
    ('Raúl', 'Hernández', '1983-08-17', 'Calle del Lago 707', '555-2345', 'raul.hernandez@example.com', 1, 'O-'),
    ('Claudia', 'García', '1990-12-29', 'Calle del Valle 808', '555-4567', 'claudia.garcia@example.com', 2, 'B+'),
    ('Ricardo', 'Castro', '1986-06-14', 'Avenida del Centro 909', '555-6789', 'ricardo.castro@example.com', 1, 'AB-'),
    ('Sofía', 'Ramos', '1998-02-22', 'Calle del Águila 1010', '555-8901', 'sofia.ramos@example.com', 2, 'A-'),
    ('Miguel', 'Sánchez', '1982-04-04', 'Calle del Mar 1111', '555-2346', 'miguel.sanchez@example.com', 1, 'B-'),
    ('Isabel', 'Alvarez', '1993-07-12', 'Avenida del Río 1212', '555-3457', 'isabel.alvarez@example.com', 2, 'AB+'),
    ('Eduardo', 'Díaz', '1968-11-29', 'Calle de la Luna 1313', '555-4568', 'eduardo.diaz@example.com', 1, 'O+'),
    ('Silvia', 'González', '1984-03-08', 'Avenida del Sol 1414', '555-5679', 'silvia.gonzalez@example.com', 2, 'A+'),
    ('Héctor', 'Morales', '1992-05-23', 'Calle del Norte 1515', '555-6780', 'hector.morales@example.com', 1, 'B+'),
    ('Andrea', 'Muñoz', '1977-12-10', 'Calle del Río 1616', '555-7891', 'andrea.munoz@example.com', 2, 'AB-'),
    ('Felipe', 'Torres', '1996-09-17', 'Calle del Bosque 1717', '555-8902', 'felipe.torres@example.com', 1, 'O-');

INSERT INTO medico (nombre, apellido, fecha_nacimiento, especialidad, telefono, email, fecha_contratacion)
VALUES
    ('Luis', 'Mendoza', '1975-08-14', 'Cardiología', '555-1122', 'luis.mendoza@example.com', '2010-03-01'),
    ('Gabriela', 'López', '1980-02-22', 'Pediatría', '555-2233', 'gabriela.lopez@example.com', '2012-07-15'),
    ('Oscar', 'Torres', '1978-11-03', 'Dermatología', '555-3344', 'oscar.torres@example.com', '2015-01-20'),
    ('Marcela', 'Reyes', '1985-04-17', 'Cirugía General', '555-4455', 'marcela.reyes@example.com', '2018-06-30'),
    ('Ricardo', 'Gómez', '1990-09-21', 'Ginecología', '555-5566', 'ricardo.gomez@example.com', '2020-11-05'),
    ('Claudia', 'Jiménez', '1973-12-30', 'Oftalmología', '555-6677', 'claudia.jimenez@example.com', '2016-03-22'),
    ('Alejandro', 'Fernández', '1981-05-14', 'Neurología', '555-7788', 'alejandro.fernandez@example.com', '2011-09-12'),
    ('Natalia', 'Soto', '1992-10-07', 'Ortopedia', '555-8899', 'natalia.soto@example.com', '2019-08-09'),
    ('Felipe', 'Martínez', '1987-01-11', 'Otorrinolaringología', '555-9900', 'felipe.martinez@example.com', '2014-02-17'),
    ('Isabel', 'Cruz', '1988-06-26', 'Medicina Interna', '555-1010', 'isabel.cruz@example.com', '2017-05-23'),
    ('Javier', 'Romero', '1980-03-03', 'Reumatología', '555-2121', 'javier.romero@example.com', '2013-11-30'),
    ('Camila', 'Pérez', '1989-07-22', 'Urología', '555-3232', 'camila.perez@example.com', '2012-08-13'),
    ('Mario', 'Alvarado', '1979-04-19', 'Endocrinología', '555-4343', 'mario.alvarado@example.com', '2015-12-01'),
    ('Sandra', 'García', '1991-08-14', 'Medicina de Familia', '555-5454', 'sandra.garcia@example.com', '2018-03-25'),
    ('Manuel', 'Ríos', '1984-01-01', 'Oncología', '555-6565', 'manuel.rios@example.com', '2017-06-10'),
    ('Valeria', 'Vega', '1994-02-28', 'Nefrología', '555-7676', 'valeria.vega@example.com', '2020-09-04'),
    ('Hugo', 'Ortíz', '1976-11-11', 'Geriatría', '555-8787', 'hugo.ortiz@example.com', '2011-12-20'),
    ('Patricia', 'Cano', '1986-05-16', 'Hematología', '555-9898', 'patricia.cano@example.com', '2014-10-25'),
    ('David', 'Hernández', '1982-07-09', 'Pneumología', '555-1213', 'david.hernandez@example.com', '2015-05-17'),
    ('Carolina', 'Salazar', '1990-06-02', 'Inmunología', '555-2324', 'carolina.salazar@example.com', '2018-09-11');

INSERT INTO personal_servicio (nombre, apellido, fecha_nacimiento, telefono, email, fecha_contratacion)
VALUES
    ('Jorge', 'Martínez', '1980-09-11', '555-3333', 'jorge.martinez@example.com', '2012-07-15'),
    ('María', 'Alonso', '1985-02-19', '555-4444', 'maria.alonso@example.com', '2017-03-22'),
    ('Ricardo', 'Salazar', '1978-11-30', '555-5555', 'ricardo.salazar@example.com', '2019-09-01'),
    ('Laura', 'Reyes', '1987-12-10', '555-6666', 'laura.reyes@example.com', '2020-01-15'),
    ('Carlos', 'Mora', '1992-06-25', '555-7777', 'carlos.mora@example.com', '2018-11-05'),
    ('Silvia', 'Castro', '1991-03-08', '555-8888', 'silvia.castro@example.com', '2014-04-10'),
    ('Felipe', 'Sánchez', '1983-07-17', '555-9999', 'felipe.sanchez@example.com', '2016-06-30'),
    ('Natalia', 'Valdez', '1989-05-23', '555-0000', 'natalia.valdez@example.com', '2017-02-20'),
    ('Alejandro', 'Martínez', '1976-08-15', '555-1112', 'alejandro.martinez@example.com', '2015-08-10'),
    ('Carmen', 'Vega', '1981-04-04', '555-2223', 'carmen.vega@example.com', '2012-10-25'),
    ('Adriana', 'Lozano', '1994-07-12', '555-3334', 'adriana.lozano@example.com', '2018-12-01'),
    ('Oscar', 'Paredes', '1982-01-21', '555-4445', 'oscar.paredes@example.com', '2016-07-20'),
    ('Gabriela', 'Ramírez', '1986-09-09', '555-5556', 'gabriela.ramirez@example.com', '2013-03-05'),
    ('Luis', 'Díaz', '1990-04-28', '555-6667', 'luis.diaz@example.com', '2017-08-25'),
    ('Mónica', 'Hernández', '1987-11-12', '555-7778', 'monica.hernandez@example.com', '2015-11-15'),
    ('Andrés', 'García', '1995-10-21', '555-8889', 'andres.garcia@example.com', '2020-04-10'),
    ('Valeria', 'Maldonado', '1991-06-01', '555-9990', 'valeria.maldonado@example.com', '2019-07-01'),
    ('Fernando', 'Herrera', '1979-12-30', '555-0001', 'fernando.herrera@example.com', '2014-05-30'),
    ('Paola', 'Gómez', '1988-03-13', '555-1113', 'paola.gomez@example.com', '2018-09-05'),
    ('Santiago', 'Moreno', '1984-10-02', '555-2224', 'santiago.moreno@example.com', '2017-01-20');

INSERT INTO historia_clinica (id_paciente, diagnostico, tratamiento, fecha_registro)
VALUES
    (1, 'Hipertensión', 'Medicamentos antihipertensivos', '2024-01-15'),
    (2, 'Diabetes tipo 2', 'Control de glucosa y dieta', '2024-02-20'),
    (3, 'Dermatitis', 'Crema tópica y antibióticos', '2024-03-10'),
    (4, 'Fractura de tobillo', 'Inmovilización y fisioterapia', '2024-04-05'),
    (5, 'Anemia', 'Suplementos de hierro', '2024-05-30'),
    (6, 'Migrañas', 'Medicamentos antimigrañosos', '2024-06-15'),
    (7, 'Bronquitis', 'Antibióticos y nebulizaciones', '2024-07-25'),
    (8, 'Lumbalgia', 'Analgésicos y terapia física', '2024-08-12'),
    (9, 'Hipotiroidismo', 'Hormona tiroidea', '2024-09-10'),
    (10, 'Gastritis', 'Medicamentos antiácidos', '2024-10-18'),
    (11, 'Rinitis alérgica', 'Antihistamínicos', '2024-11-02'),
    (12, 'Esguince de muñeca', 'Reposo y analgésicos', '2024-12-20'),
    (13, 'Colitis ulcerosa', 'Medicamentos antiinflamatorios', '2024-01-10'),
    (14, 'Insuficiencia renal', 'Diálisis y dieta especial', '2024-02-15'),
    (15, 'Psoriasis', 'Tratamientos tópicos y fototerapia', '2024-03-25'),
    (16, 'Hipoglucemia', 'Ajuste en la medicación', '2024-04-08'),
    (17, 'Apnea del sueño', 'CPAP y cambios en el estilo de vida', '2024-05-12'),
    (18, 'Artritis', 'Medicamentos antiinflamatorios y fisioterapia', '2024-06-30'),
    (19, 'Estreñimiento crónico', 'Laxantes y cambios dietéticos', '2024-07-22'),
    (20, 'Migraña crónica', 'Tratamiento preventivo', '2024-08-15');

INSERT INTO secretario (nombre, apellido, fecha_nacimiento, telefono, email, fecha_contratacion)
VALUES
    ('Ana', 'García', '1980-06-15', '555-1230', 'ana.garcia@example.com', '2012-01-20'),
    ('Pedro', 'Muñoz', '1985-02-25', '555-2341', 'pedro.munoz@example.com', '2015-04-10'),
    ('Maria', 'Cruz', '1990-11-05', '555-3452', 'maria.cruz@example.com', '2017-08-30'),
    ('Luis', 'Vargas', '1978-07-10', '555-4563', 'luis.vargas@example.com', '2013-09-22'),
    ('Carla', 'Hernández', '1992-03-18', '555-5674', 'carla.hernandez@example.com', '2018-02-05'),
    ('David', 'Lopez', '1986-10-10', '555-6785', 'david.lopez@example.com', '2014-11-15'),
    ('Elena', 'Mendoza', '1988-09-22', '555-7896', 'elena.mendoza@example.com', '2016-07-01'),
    ('Jorge', 'Paredes', '1991-01-30', '555-8907', 'jorge.paredes@example.com', '2020-03-14'),
    ('Andrea', 'García', '1993-12-14', '555-9018', 'andrea.garcia@example.com', '2019-09-10'),
    ('Samuel', 'Martínez', '1984-08-23', '555-0129', 'samuel.martinez@example.com', '2015-10-20'),
    ('Patricia', 'Ramírez', '1982-04-06', '555-1231', 'patricia.ramirez@example.com', '2013-03-05'),
    ('Miguel', 'Sánchez', '1990-12-17', '555-2342', 'miguel.sanchez@example.com', '2017-05-10'),
    ('Laura', 'García', '1989-07-14', '555-3453', 'laura.garcia@example.com', '2018-08-22'),
    ('Carlos', 'Martínez', '1985-06-19', '555-4564', 'carlos.martinez@example.com', '2016-12-01'),
    ('Silvia', 'Hernández', '1991-11-30', '555-5675', 'silvia.hernandez@example.com', '2021-01-20'),
    ('Javier', 'Ríos', '1988-02-10', '555-6786', 'javier.rios@example.com', '2019-06-15'),
    ('Isabel', 'González', '1992-05-24', '555-7897', 'isabel.gonzalez@example.com', '2017-10-30'),
    ('Santiago', 'Cano', '1994-09-12', '555-8908', 'santiago.cano@example.com', '2018-04-05'),
    ('Natalia', 'Torres', '1981-01-05', '555-9019', 'natalia.torres@example.com', '2015-02-25'),
    ('Fernando', 'Serrano', '1986-03-20', '555-0120', 'fernando.serrano@example.com', '2017-11-12');

INSERT INTO ingreso (id_pacientefk, id_secretariofk)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20);

INSERT INTO consultorio (tipo_consultorio)
VALUES
    ('General'),
    ('Cardiología'),
    ('Pediatría'),
    ('Dermatología'),
    ('Ginecología'),
    ('Oftalmología'),
    ('Neurología'),
    ('Ortopedia'),
    ('Otorrinolaringología'),
    ('Medicina Interna'),
    ('Reumatología'),
    ('Urología'),
    ('Endocrinología'),
    ('Medicina de Familia'),
    ('Oncología'),
    ('Nefrología'),
    ('Geriatría'),
    ('Hematología'),
    ('Pneumología'),
    ('Inmunología');

INSERT INTO cita (id_pac, id_med, id_consultorio, fecha_cita, motivo)
VALUES
    (1, 1, 1, '2024-01-10', 'Chequeo general'),
    (2, 2, 2, '2024-02-15', 'Control de diabetes'),
    (3, 3, 3, '2024-03-20', 'Consulta dermatológica'),
    (4, 4, 4, '2024-04-25', 'Revisión de fractura'),
    (5, 5, 5, '2024-05-30', 'Consulta de anemia'),
    (6, 6, 6, '2024-06-10', 'Tratamiento para migrañas'),
    (7, 7, 7, '2024-07-15', 'Revisión bronquial'),
    (8, 8, 8, '2024-08-05', 'Tratamiento para lumbalgia'),
    (9, 9, 9, '2024-09-10', 'Chequeo para hipotiroidismo'),
    (10, 10, 10, '2024-10-12', 'Consulta para gastritis'),
    (11, 11, 11, '2024-11-18', 'Tratamiento para rinitis'),
    (12, 12, 12, '2024-12-05', 'Revisión de esguince'),
    (13, 13, 13, '2024-01-15', 'Control de colitis'),
    (14, 14, 14, '2024-02-20', 'Diálisis renal'),
    (15, 15, 15, '2024-03-30', 'Tratamiento para psoriasis'),
    (16, 16, 16, '2024-04-10', 'Ajuste de medicación para hipoglucemia'),
    (17, 17, 17, '2024-05-20', 'Tratamiento de apnea del sueño'),
    (18, 18, 18, '2024-06-15', 'Revisión de artritis'),
    (19, 19, 19, '2024-07-10', 'Tratamiento para estreñimiento'),
    (20, 20, 20, '2024-08-05', 'Control de migrañas crónicas');

INSERT INTO historia_clinicaaux (pacientefk, diagnostico, tratamiento, fechaDeRegistro)
VALUES
    (1, 'Hipertensión', 'Medicamentos antihipertensivos', '2024-01-15'),
    (2, 'Diabetes tipo 2', 'Control de glucosa y dieta', '2024-02-20'),
    (3, 'Dermatitis', 'Crema tópica y antibióticos', '2024-03-10'),
    (4, 'Fractura de tobillo', 'Inmovilización y fisioterapia', '2024-04-05'),
    (5, 'Anemia', 'Suplementos de hierro', '2024-05-30'),
    (6, 'Migrañas', 'Medicamentos antimigrañosos', '2024-06-15'),
    (7, 'Bronquitis', 'Antibióticos y nebulizaciones', '2024-07-25'),
    (8, 'Lumbalgia', 'Analgésicos y terapia física', '2024-08-12'),
    (9, 'Hipotiroidismo', 'Hormona tiroidea', '2024-09-10'),
    (10, 'Gastritis', 'Medicamentos antiácidos', '2024-10-18'),
    (11, 'Rinitis alérgica', 'Antihistamínicos', '2024-11-02'),
    (12, 'Esguince de muñeca', 'Reposo y analgésicos', '2024-12-20'),
    (13, 'Colitis ulcerosa', 'Medicamentos antiinflamatorios', '2024-01-10'),
    (14, 'Insuficiencia renal', 'Diálisis y dieta especial', '2024-02-15'),
    (15, 'Psoriasis', 'Tratamientos tópicos y fototerapia', '2024-03-25'),
    (16, 'Hipoglucemia', 'Ajuste en la medicación', '2024-04-08'),
    (17, 'Apnea del sueño', 'CPAP y cambios en el estilo de vida', '2024-05-12'),
    (18, 'Artritis', 'Medicamentos antiinflamatorios y fisioterapia', '2024-06-30'),
    (19, 'Estreñimiento crónico', 'Laxantes y cambios dietéticos', '2024-07-22'),
    (20, 'Migraña crónica', 'Tratamiento preventivo', '2024-08-15');

INSERT INTO limpieza_consultorio (fk_id_consultorio, fk_id_personal_servicio, fecha_limpieza)
VALUES
    (1, 1, '2024-01-02'),
    (2, 2, '2024-01-03'),
    (3, 3, '2024-01-04'),
    (4, 4, '2024-01-05'),
    (5, 5, '2024-01-06'),
    (6, 6, '2024-01-07'),
    (7, 7, '2024-01-08'),
    (8, 8, '2024-01-09'),
    (9, 9, '2024-01-10'),
    (10, 10, '2024-01-11'),
    (11, 11, '2024-01-12'),
    (12, 12, '2024-01-13'),
    (13, 13, '2024-01-14'),
    (14, 14, '2024-01-15'),
    (15, 15, '2024-01-16'),
    (16, 16, '2024-01-17'),
    (17, 17, '2024-01-18'),
    (18, 18, '2024-01-19'),
    (19, 19, '2024-01-20'),
    (20, 20, '2024-01-21');


INSERT INTO equipos (fk_id_habitacion, nombre_equipo, descripcion)
VALUES
    (1, 'Esfigmomanómetro', 'Instrumento para medir la presión arterial'),
    (2, 'Oximetro', 'Dispositivo para medir la saturación de oxígeno en sangre'),
    (3, 'Estetoscopio', 'Instrumento para escuchar los latidos del corazón'),
    (4, 'Termómetro', 'Dispositivo para medir la temperatura corporal'),
    (5, 'Electrocardiógrafo', 'Equipo para registrar la actividad eléctrica del corazón'),
    (6, 'Nebulizador', 'Dispositivo para administrar medicamentos en forma de vapor'),
    (7, 'Monitor de signos vitales', 'Equipo para monitorear varios signos vitales'),
    (8, 'Aspirador', 'Dispositivo para succionar fluidos'),
    (9, 'Silla de ruedas', 'Vehículo para movilizar pacientes que no pueden caminar'),
    (10, 'Camilla', 'Cama móvil para trasladar pacientes'),
    (11, 'Pulsioxímetro', 'Equipo para medir el pulso y la saturación de oxígeno'),
    (12, 'Sonda de alimentación', 'Dispositivo para suministrar alimentos a pacientes'),
    (13, 'Desfibrilador', 'Equipo para restaurar el ritmo cardíaco normal'),
    (14, 'Radiografías', 'Equipo para realizar imágenes de rayos X'),
    (15, 'Ultrasonido', 'Dispositivo para realizar imágenes por ultrasonido'),
    (16, 'Electrobisturí', 'Equipo para realizar cortes precisos durante cirugías'),
    (17, 'Equipo de diálisis', 'Dispositivo para filtrar sangre en pacientes con insuficiencia renal'),
    (18, 'Máquina de anestesia', 'Equipo para administrar anestesia durante cirugías'),
    (19, 'Monitor fetal', 'Dispositivo para monitorear el ritmo cardíaco del feto'),
    (20, 'Incubadora', 'Equipo para mantener a los recién nacidos prematuros en condiciones óptimas');

--Consultas

--seleccionar todos los pacientes
SELECT * FROM paciente;

--obtener nombre y apellido de los medicos
SELECT nombre, apellido FROM medico;

--listar todas la citas en un rango de fechas especifico
SELECT *
FROM cita
WHERE fecha_cita BETWEEN '2024-01-01' AND '2024-12-31';

--Mostrar los pacientes con tipo de sangre especifico
SELECT nombre, apellido
FROM paciente
WHERE tipo_sangre = 'AB+';

--obtener el nombre del consultorio y el personal de serivicio que realizo la limpieza en una fecha determinada
SELECT c.tipo_consultorio, ps.nombre, ps.apellido
FROM limpieza_consultorio lc
         JOIN consultorio c ON lc.fk_id_consultorio = c.id_consultorio
         JOIN personal_servicio ps ON lc.fk_id_personal_servicio = ps.id_personal
WHERE lc.fecha_limpieza = '2024-01-02';

--listar todos los equipos en un consultorio especifico
SELECT e.nombre_equipo, e.descripcion
FROM equipos e
         JOIN consultorio c ON e.fk_id_habitacion = c.id_consultorio
WHERE c.id_consultorio = 1;  -- Puedes cambiar el ID del consultorio según sea necesario

--obtener el nombre de los paciente que tienen una cita en una fecha especifica
SELECT p.nombre, p.apellido
FROM cita c
         JOIN paciente p ON c.id_pac = p.id
WHERE c.fecha_cita = '2024-01-10';

--listar todos los medicos de una especialidad especifica
SELECT nombre, apellido
FROM medico
WHERE especialidad = 'Cardiología';

--mostrar las historias clinicas de un paciente
SELECT hc.diagnostico, hc.tratamiento
FROM historia_clinica hc
         JOIN paciente p ON hc.id_paciente = p.id
WHERE p.id = 1;  -- asignar id de paciente

--Obtener la informacion de contacto de los secretarios
SELECT nombre, apellido, telefono, email
FROM secretario;


--consultas avanzadas

--Paciente con la mayor cantidad de historias clínicas

SELECT p.nombre, p.apellido, COUNT(h.id_historia) AS total_historias
FROM paciente p
         JOIN historia_clinica h ON p.id = h.id_paciente
GROUP BY p.id
ORDER BY total_historias DESC
LIMIT 1;
--Médico con el mayor número de citas programadas

SELECT m.nombre, m.apellido, COUNT(c.id_cita) AS total_citas
FROM medico m
         JOIN cita c ON m.id_medic = c.id_med
GROUP BY m.id_medic
ORDER BY total_citas DESC
LIMIT 1;
--Paciente que ha sido ingresado por el secretario con el nombre "nombre"

SELECT p.nombre, p.apellido
FROM paciente p
         JOIN ingreso i ON p.id = i.id_pacientefk
         JOIN secretario s ON i.id_secretariofk = s.id_sec
WHERE s.nombre = 'Ana';

--Equipos en el consultorio con el nombre "General"

SELECT e.nombre_equipo, e.descripcion
FROM equipos e
         JOIN consultorio c ON e.fk_id_habitacion = c.id_consultorio
WHERE c.tipo_consultorio = 'General';
--Personal de servicio que ha limpiado el consultorio más recientemente

SELECT p.nombre, p.apellido, MAX(l.fecha_limpieza) AS ultima_limpieza
FROM personal_servicio p
         JOIN limpieza_consultorio l ON p.id_personal = l.fk_id_personal_servicio
GROUP BY p.id_personal
ORDER BY ultima_limpieza DESC
LIMIT 1;
--Número total de pacientes por tipo de sangre

SELECT p.tipo_sangre, COUNT(*) AS total_pacientes
FROM paciente p
GROUP BY p.tipo_sangre
ORDER BY total_pacientes DESC;
--Historial clínico del paciente más joven

SELECT h.*
FROM historia_clinica h
         JOIN paciente p ON h.id_paciente = p.id
WHERE p.fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM paciente);
--Médicos que han sido contratados después del 1 de enero de 2020

SELECT nombre, apellido, fecha_contratacion
FROM medico
WHERE fecha_contratacion > '2020-01-01';
--Pacientes con más de una cita programada

SELECT p.nombre, p.apellido, COUNT(c.id_cita) AS total_citas
FROM paciente p
         JOIN cita c ON p.id = c.id_pac
GROUP BY p.id
HAVING COUNT(c.id_cita) > 1;
--Consultorios que no han sido limpiados en el último mes

SELECT c.tipo_consultorio
FROM consultorio c
         LEFT JOIN limpieza_consultorio l ON c.id_consultorio = l.fk_id_consultorio
WHERE l.fecha_limpieza IS NULL OR l.fecha_limpieza < (CURRENT_DATE - INTERVAL '1 month')
GROUP BY c.id_consultorio, c.tipo_consultorio;