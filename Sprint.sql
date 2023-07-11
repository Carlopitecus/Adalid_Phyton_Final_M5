--  Se crea la base de datos
Create Database mesa_ayuda;

-- Se crea el usuarip con todos los provilegios para la base de datos mesa_ayuda
Create User 'Admin_Mesa'@'localhost' Identified By 'Admin_Mesa';
Grant All Privileges On mesa_ayuda.* To 'Admin_Mesa'@'localhost';
Flush Privileges;

-- Creación tabla Usuarios
Create Table usuarios (id_usuario Int Auto_Increment Primary Key,
 nombre Varchar(50),
 apellido Varchar (50),
 edad int,
 correo_electronico Varchar(100),
 uso_aplicacion Int Default '1');

-- Creación tabla  Operarios
Create Table operarios (id_operario Int Auto_Increment Primary Key ,
 nombre Varchar(50),
 apellido Varchar (50),
 edad int,
 correo_electronico Varchar(100),
 cantidad_soportes Int Default '1');

-- Creación tabla Soportes_realizados
Create Table soportes (id_soporte Int Auto_Increment Primary Key ,
 id_usuario Int,
 id_operario Int,
 fecha_soporte Date,
 evaluacion Int,
 Foreign Key (id_usuario) References usuarios(id_usuario),
 Foreign Key (id_operario) References operarios(id_operario));
 
 -- Se agregan 5 Usuarios
 Insert Into usuarios (nombre, apellido, edad, correo_electronico)
	Values ('Juan', 'Lopez', 32, 'juanlopez@example.com'),
			('Maria', 'Rodriguez', 28, 'mariarodriguez@example.com'),
			('Carlos', 'Martinez', 45, 'carlosmartinez@example.com'),
			('Laura', 'Garcia', 36, 'lauragarcia@example.com'),
			('Alejandro', 'Perez', 41, 'alejandroperez@example.com');
    
    --  Se agregan 5 Operarios
Insert Into operarios (nombre, apellido, edad, correo_electronico)
    Values ('Juanita', 'Hernández', 32, 'juanita.hernandez@example.com'),
			('Carlos', 'Pérez', 45, 'carlos.perez@example.com'),
			('Laura', 'Gómez', 18, 'laura.gomez@example.com'),
			('Andrés', 'Rodríguez', 38, 'andres.rodriguez@example.com'),
			('María', 'López', 50, 'maria.lopez@example.com');
    
    -- Ingreso de las 10 Operacionesde Soporte
    -- 1
	Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
		Values (1, 3, '2023-06-10', 8);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 1;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 3;
    
    -- 2
	Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (2, 2, '2023-06-12', 6);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 2;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 2;
    
    -- 3
     Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (3, 4, '2023-06-15', 5);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 3;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 4;
    
    -- 4
    Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (3, 4, '2023-06-15', 5);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 3;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 4;
    
    -- 5
    Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (5, 1, '2023-06-20', 8);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 5;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 1;
    
    -- 6
    Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (1, 3, '2023-06-23', 5);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 1;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 3;
    
    -- 7
    Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (2, 2, '2023-06-25', 7);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 2;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 2;
    
    -- 8
	Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (3, 5, '2023-06-28', 9);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 3;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 5;
    
    -- 9
	Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (4, 4, '2023-06-30', 6);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 4;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 4;
    
    -- 10
    Insert into soportes (id_usuario, id_operario, fecha_soporte, evaluacion)
    Values (5, 1, '2023-07-02', 8);
    
    Update usuarios
    Set uso_aplicacion = (uso_aplicacion + 1)
    Where id_usuario = 5;
    
    Update operarios
    Set cantidad_soportes = (cantidad_soportes + 1)
    Where id_operario = 1;
    
    -- Seleccione las 3 operaciones con mejor evaluación.    
Select * From soportes Order By evaluacion Desc Limit 3;

-- Seleccione las 3 operaciones con menos evaluación.
Select * From soportes Order By evaluacion Asc Limit 3;

-- Seleccione al operario que más soportes ha realizado.
Select * From operarios Order By cantidad_soportes Desc Limit 1;

-- Seleccione al cliente que menos veces ha utilizado la aplicación.
Select * From usuarios Order By uso_aplicacion Asc Limit 1;

-- Agregue 10 años a los tres primeros usuarios registrados.
Select * From usuarios Order By id_usuario Asc limit 3;
UPDATE usuarios
SET edad = (edad + 10)
WHERE id_usuario IN (
  SELECT id_usuario
  FROM (SELECT id_usuario FROM usuarios ORDER BY id_usuario ASC LIMIT 3) AS subconsulta);
  
-- Renombre todas las columnas ‘correo electrónico’. El nuevo nombre debe ser email.
Alter Table usuarios
Rename Column correo_electronico
To email;

Alter Table operarios
Rename Column correo_electronico
To email;

-- Seleccione solo los operarios mayores de 20 años.
Select * From operarios Where (edad > 20);

