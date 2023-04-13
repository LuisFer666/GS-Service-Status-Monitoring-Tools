-- Perfiles de acceso: Usuario final, personal de TI, Supervisores   
-- INTERFACES DE USUARIO

--DROP table perfiles ;
create table perfiles(
 id integer primary key,
 descripcion text 
);
INSERT INTO perfiles VALUES (100, 'PERSONAL TI');
INSERT INTO perfiles VALUES (200, 'USUARIO FINAL');
INSERT INTO perfiles VALUES (300, 'SUPERVISOR');

--Departamentos donde los usuarios laboran: TI, Investigacion, Almacen, Recursos Humanos... etc
--BUSSINES TECHNOLOGY GROUPS 
--drop table btg;
create table btg(
 id integer primary key,
 descripcion text 
);
INSERT INTO btg VALUES (100, 'TI COMMAND CENTER CD MX');
INSERT INTO btg VALUES (110, 'TI COMMAND CENTER MTY');
INSERT INTO btg VALUES (120, 'TI COMMAND CENTER BOGOTA');
INSERT INTO btg VALUES (130, 'TI DEVELOPMENT');
INSERT INTO btg VALUES (200, 'HUMAN RESOURCES');
INSERT INTO btg VALUES (210, 'FINANCE');
INSERT INTO btg VALUES (300, 'RESEARCH');
INSERT INTO btg VALUES (400, 'OPERATION');

--Diferentes areas de TI donde se clasificaran los usuarios de TI para poder asignarles los servicios 
--de acuerdo al tipo de servicio solicitado por el usuario final
create table areas_ti(
 id integer primary key,
 descripcion text 
);

INSERT INTO areas_ti VALUES (0, 'Otras');  --Para usuarios que no son de TI
INSERT INTO areas_ti VALUES (100, 'Telecomunicaciones');
INSERT INTO areas_ti VALUES (200, 'Services Desk');
INSERT INTO areas_ti VALUES (300, 'Desarrollo');
INSERT INTO areas_ti VALUES (400, 'Database');

--Tabla para conectividad con areas de TI
--Llevar registros de numeros telefonicos o correos electronicos a donde llegaran los avisos de nuevos servicios requeridos
create table areas_conect (
 id serial primary key
 id_area integer references areas_ti (id)  ,
 descripcion text ,
 tipo character --'T' = telefono, 'C'=Correo
);
INSERT INTO areas_connect (id_area,descripcion ) VALUES (400, '55512345678');  
INSERT INTO areas_connect (id_area,descripcion ) VALUES (400, 'devops@aztrazeneca.com');  
--Diseño de trigger para asignar 'T' o 'C' en tipo dependiendo de si lleva @ 


CREATE TABLE users (
  id serial primary key,
  id_perfil integer references perfiles (id) ,
  id_area integer references areas_ti(id),  --area de TI a la que pertenece el usuario
  id_depto integer references btg (id ) ,
  nombre character varying(100),
  cpass password ,  
  curp character varying(40), 
--Otros atributos de identificacion personal tal vez fecha de nacimiento, domicilio, etc, etc
  ubicacion text
);



--Tabla donde se registran los servicios TI o las APPS a los que Cada usuario puede acceder, 
--por ejemplo las aplicaciones o módulos que este usuario utiliza 
-- Ejm: "Aplicacion de laboratorio de RX", "Aplicacion de registro de voluntarios en ensayos clinicos", etc...
create table apps_serv(  
 id integer primary key,     --referencia en foreing keys como id_area
 descripcion text ,
 tipo character --S=Servicio, A=Aplicacion
);
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (100, 'APP LABORATORIO RX', 'A');
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (110, 'APP LABORATORIO ULTRASONIDO', 'A');
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (200, 'APP VOLUNTARIOS ENSAYOS CLINICOS','A');
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (300, 'APP ERP','A');
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (310, ' MODULO ALMACEN','A');
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (320, ' MODULO COMPRAS','A');
--tambien se pueden agregar servicios de distintos tipos que podrian ser solicitados por los usuarios
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (1000, 'SERVICIOS A IMPRESORAS','S');
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (2000, 'SERVICIOS A EQUIPOS DE RAYOS X','S');
INSERT INTO apps_serv(id, descripcion,tipo) VALUES (3000, 'SERVICIOS A EQUIPOS DE ULTRASONIDO','S');


--Tabla donde se especifican las clasificaciones del tipo de soporte ofrecido. Ejm "Asesoria tecnica", "Instalacion de apps", "Correcion de bugs" ...
--VERSION 1.0, revisar este diseño , en duda la inclusion de id_area
create table tipo_soporte(
	id integer primary key,
	id_area integer references areas_ti(id), --Area de TI que se encargará de atender a este servicio
	descripcion text,
	duracion_min integer,  --Promedio en minutos para la atencion del servicio
	duracion_hrs integer , --Estimacion de la duracion en horas del servicio a atender
	duracion_dias integer,  --Promedio en dias laborales de atencion a servicios similares
	fecha_actualizacion date  --Fecha de la ultima vez que se actualizo el tiempo o la descripcion de este tipo de soporte
);
--Una asesoria tecnica podria ocurrir en un lapso de 30 minutos, sin embargo este tiempo promedio se ira actualizando en base al uso de los servicios
--conforme se vayan registrando y atendiendo otros servicios, este tiempo inicial se verá actualizado mediante triggers o mediante estimaciones 
--basadas en IA en un futuro proximo
INSERT INTO tipo_soporte VALUES (1001,200, 'ASESORIA TECNICA REMOTA',30,0,0,'2023-04-10');
--LA instalacion de una aplicacion nueva o la asesoria remota para que el usuario lo haga podria tardar 2 horas
INSERT INTO tipo_soporte VALUES (1002,200, 'INSTALACION DE APLICACIONES',0,2,0,'2023-04-10');
--La configuracion remota de una aplicacion podria tardar 1 hora
INSERT INTO tipo_soporte VALUES (1003,200, 'CONFIGURACION DE APLICACIONES',0,1,0,'2023-04-10');
--La correccion de bugs podria tardar dos semanas, por ejemplo Y se hara cargo el area de DESARROLLO =300
INSERT INTO tipo_soporte VALUES (1010,300 'CORRECCION DE BUGS EN APLICACIONES',0,0,15,'2023-04-10');

--LAS APPS O LOS SERVICIOS QUE USA CADA USUARIO 
create table user_apps (
 id_user integer references users(id) ,
 id_app_serv integer references apps_serv(id) ,
 fecha_asignacion date,
 fecha_ult_incidencia datetime
);

--Los estados de los servicios SERVICES STATUS
create table serv_status(
 id serial primary key,
 descripcion text ,
 color character varying(25)
);

INSERT INTO serv_status(id, descripcion,color) VALUES (1, 'ABIERTO','ROJO');
INSERT INTO serv_status(id, descripcion,color) VALUES (2, 'EN ATENCION','AMBAR');
INSERT INTO serv_status(id, descripcion,color) VALUES (3, 'ATENDIDO','VERDE');
INSERT INTO serv_status(id, descripcion,color) VALUES (4, 'REABIERTO','ROJO OSCURO');

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  SERVICES
-- tablas y procesos de registro y actualizacion de status de servicios
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create table services(
	id serial primary key,
	descripcion text,
	fechahora_apertura datetime default current_timestamp, --Fecha y hora del reporte
	id_user integer references users(id), --usuario que solicita el servicio
	id_serv_status integer default 1, --El status del servicio inicialmente es 1.- ABIERTO
	id_app_serv integer references apps_serv(id) , --Aplicacion o tipo de servicio que está solicitando
	prioridad_propuesta integer default 1, --valor numerico del 1 al 10 asignado por el usuario solicitante
	prioridad integer, --valor numerico del 1 al 10 asignado por el personal de TI
	reincidencias integer default 0, --Cuantas veces se ha reincidido en el mismo error, cuantas veces se ha reportado esta misma falla
	adjuntos integer default 0, --Cantidad de archivos u objetos de datos como imagenes y videos adjuntos para describir el problema
	fechahora_atencion datetime , --Fecha y hora de la primera atencion
	id_tipo_soporte integer references tipo_soporte(id), --Informacion del tipo de soporte requerido se asocia con tiempo y area de TI que se encargará de atender a este servicio
	id_area integer, --Area de TI que atenderá este caso
	id_user_ti integer,  --usuario de TI al que será asignado este servicio para su atención
	fechahora_cierre datetime , --Fecha y hora del cierre del servicio
	descripcion_solucion text,
	id_user_ti_cierre integer,  --usuario de TI que declara cerrado el servicio
	fechahora_aceptacion datetime ,  --Podria ocurrir un cierre automatico si el usuario final no registra el cierre
	id_user_cierre integer      --Usuario final que acepta el cierre del servicio
);


--Ejemplos de INSERTS desde la APP del usuario final
--Un usuario levanta un ticket reportando que no puede capturar clientes nuevos en su aplicacion ERP e inicalmente considera que su solicitud 
-- merece una prioridad de 9 en una escala del 1 al 10 , 
-- Este insert considera los datos básicos de la solicitud de servicio que se deben enviar desde la app movil o la interface web
insert into services (id, descripcion, id_user, id_app_serv, prioridad_propuesta, adjuntos ) 
		values (1,"ERROR AL INSERTAR NUEVOS CLIENTES",200101,300,9,1) ; 
--Un usuario reporta que su impresora que no jala las hojas y supone que su solicitud es de alta prioridad
insert into services (id, descripcion, id_user, id_app_serv, prioridad_propuesta, adjuntos ) 
		values (2,"LA IMPRESORA NO JALA LAS HOJAS",200102,1000,8,0) ;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--IMAGENES Y VIDEOS, AUDIOS RELACIONADOS CON CADA SOLICITUD DE SERVICIO
--SERVICES_DATAOBJECTS
create table services_do(
	id serial primary key,   --ID del objeto adjuntado sera campo autonumerico
	id_servicio integer references services(id), --Referencia llave foranea a tabla servicios
	dataobject bytea --Arreglo binario que almacena el contenido de una archivo (IMAGEN, VIDEO, AUDIO)
);
--Ejemplos de como insertar un BLOB en SQLSERVER
--https://stackoverflow.com/questions/1643627/how-to-insert-a-blob-into-a-database-using-sql-server-management-studio 
--El usuario inserta una foto del mensaje de error que obtiene relacionado con el ticket de reporte numero 1
insert into services_do (id, id_servicio, dataobject ) values (1,1,[]  ) ;  

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- SEGUIMIENTO DE SERVICIOS
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--UPDATES 
-- cuando se ASIGNA EL SERVICIO por parte de personal de TI
--A manera de updates a esta misma tabla se registrara la asignacion de tipo de servicio, prioridad y fechahora de atencion
--Para el servicio 1 el personal de TI considera que se trata de un problema de configuracion de aplciaciones la cual tiene el id =1002
--Le asigna una prioridad media utilizando el valor 5 de la escala de prioridades
UPDATE services SET id_serv_status =2, fechahora_atencion = current_timestamp, 
	prioridad = 5, id_tipo_soporte = 1002, id_user_ti = 100104
	WHERE id = 1 ;

--UPDATES 
--cuando se CIERRA el servicio por TI, el usuario de TI realiza este registro
UPDATE services SET id_serv_status =3, fechahora_cierre = current_timestamp, 
	descripcion_solucion = 'SE CORRIGIO LA CONFIGURACION DE PERMISOS DEL USUARIO DE LA APLICACION', 
	id_user_ti_cierre = 100104
	WHERE id = 1 ;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DETALLES relacionados con el avance del servicio, podria haber varios registros
-- se pueden registrar comentarios de parte del usuario final o del usuario de TI
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create table services_detail(
	id_servicio integer references services (id) ,
	num_registro integer default 1, --numero de registro de detalle
	fechahora_registro datetime default current_timestamp,  --Fecha y hora en que se registra este comentario
	id_user integer references users(id), --Usuario que hace el registro, generalmente usuarios de TI informando el estado de solucion o para solicitar datos
	comentarios text ,
	PRIMARY KEY( id_servicio, num_registro )   --PRIMARY KEY compuesta
);
--Ejemplos de INSERTS
--Insert de parte del personal de TI al atender el servicio a un usuario y requerir mayor informacion
--El usuario 100104 pide una mayor informacion acerca del servicio solicitado
INSERT INTO services_detail  (id_servicio, num_registro, id_user, id_user_invocado, comentarios, cerrado  ) 
	VALUES (1,1, 100104, 'favor de indicar el id del USUARIO FINAL' ) ;
--en este momento se debe disparar una alarma hacia el usuario 200101 avisandole que se le ha enviado una respuesta a un ticket que levanto

--El usuario 200101 responde con la informacion requerida
INSERT INTO services_detail  (id_servicio, num_registro, id_user, id_user_invocado, comentarios, cerrado  ) 
	VALUES (1,2, 200101, 'el USUARIO FINAL es 200103' ) ;

--El usuario 100104 asigna los permisos correspondientes y responde el ticket realizando el cierre del mismo
INSERT INTO services_detail  (id_servicio, num_registro, id_user, id_user_invocado, comentarios, cerrado  ) 
	VALUES (1,2, 100104, 'Favor de verificar nuevamente, ya se hicieron los ajustes correspondientes' ) ;







-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- VISTAS

-- view_active_services



