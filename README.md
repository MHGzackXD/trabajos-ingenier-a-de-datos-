A resolver:
1. Determine oos stakeholders y que tipo pertenecen cada uno
2. Formule 3 requisitos Funcionales y a 1 de ellos realice la HU
3. Determine los modulos de la solución.
4. Diseñe el diagrama de clases y realice su interpretación.
5. Diseñe el MER que cumpla con los estandares de diseño.

Caso de Estudio: Una biblioteca universitaria quiere digitalizar su sistema de préstamo de libros. Para ello, se necesita modelar una solución que permita gestionar libros, usuarios, préstamos y devoluciones.
Requisitos del sistema:
1. La biblioteca tiene usuarios que pueden ser estudiantes o profesores.
2. Cada usuario tiene un ID, nombre, correo y tipo (estudiante/profesor).
3. Los libros tienen un ID, título, autor y categoría.
4. Un usuario puede tomar prestado varios libros, pero un libro solo puede estar prestado a un usuario a la vez.
5. Un préstamo tiene una fecha de inicio y una fecha de devolución estimada.
6. Cuando un usuario devuelve un libro, se registra la fecha real de devolución.
7. Un profesor puede reservar libros con anticipación, pero los estudiantes no.
8. Se necesita registrar un historial de préstamos por usuario.


Stakeholder	\\ Tipo \\	Descripción
-----------------------------------------------------------------------------------------------------
Estudiantes	\\ Usuario Final \\Utilizan el sistema para solicitar préstamos de libros.
Profesores	\\ Usuario Final \\Usan el sistema para reservar y solicitar préstamos de libros.
Bibliotecarios\\	Operador del Sistema \\ Gestionan préstamos, devoluciones y reservas en el sistema.
Administradores \\ TI	Soporte Técnico \\ Mantienen la infraestructura del sistema.
Universidad	\\ Entidad Reguladora	\\ Institución que establece políticas de uso del sistema.



Requisitos Funcionales
El sistema debe permitir el registro y autenticación de los usuarios con ID y contraseña.
El sistema debe gestionar los préstamos y devoluciones de libros, asegurando que cada libro solo pueda estar en posesión de un usuario a la vez.
El sistema debe permitir a los profesores reservar libros con anticipación, mientras que los estudiantes solo pueden realizar préstamos inmediatos.
Historia de Usuario (HU) basada en el requisito 2
HU-01: Gestión de Préstamos y Devoluciones

Como estudiante o profesor
Quiero solicitar el préstamo de un libro disponible en la biblioteca
Para acceder al material de estudio cuando lo necesite

Criterios de Aceptación
✅ El usuario debe estar registrado y autenticado en el sistema.
✅ El sistema debe verificar que el libro esté disponible antes de aprobar el préstamo.
✅ Se debe registrar la fecha de inicio y la fecha estimada de devolución.
✅ Un libro solo puede ser prestado a un usuario a la vez.
✅ Al devolver el libro, el sistema debe registrar la fecha real de devolución.


3. Módulos de la solución
La solución se puede estructurar en los siguientes módulos:

Módulo 1: Gestión de Usuarios
Registro y autenticación de usuarios (estudiantes y profesores).
Administración de perfiles y permisos.
Módulo 2: Gestión de Libros
Registro, actualización y eliminación de libros.
Consulta de disponibilidad de libros.
Módulo 3: Gestión de Préstamos y Devoluciones
Registro de préstamos de libros.
Registro de devoluciones y actualización del historial.
Módulo 4: Gestión de Reservas
Permitir a los profesores reservar libros con anticipación.
Módulo 5: Reportes y Auditoría
Generación de reportes sobre libros prestados, reservados y devueltos.
Historial de préstamos por usuario.

 Diseño del MER (Modelo Entidad-Relación)
+-----------------+      +----------------+      +----------------+
|   Usuario      |      |    Préstamo    |      |     Libro      |
+-----------------+      +----------------+      +----------------+
| ID_Usuario (PK) | <--> | ID_Usuario (FK) |     | ID_Libro (PK)  |
| Nombre         |      | ID_Libro (FK)   | <--> | Título         |
| Correo         |      | Fecha_Inicio    |     | Autor         |
| Tipo (Est/Prof)|      | Fecha_Devolución|     | Categoría     |
+-----------------+      +----------------+      +----------------+





