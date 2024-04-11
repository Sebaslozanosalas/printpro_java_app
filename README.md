# PrintPro App Documentation

## Overview

La necesidad de PrintPro App surgió del crecimiento de PrintPro Studio, que utilizaba Excel para gestionar clientes, ventas, inventarios y producción, un método que se estaba volviendo insostenible. Para apoyar su expansión y mejorar la eficiencia, decidimos desarrollar una plataforma enfocada en la administración de clientes y pedidos. Esta solución permitirá al equipo de PrintPro Studio manejar información de clientes y el flujo de pedidos de forma más efectiva, brindando una visión clara de las operaciones de producción en curso, pendientes y completadas.


## Technical Stack

- **Base de Datos**: MySQL local para el almacenamiento de datos.
- **Servidor**: Apache Tomcat para la implementación y prueba de la aplicación web.
- **Gestión del Proyecto**: Maven para la gestión de dependencias y automatización de la construcción.
- **Java Development Kit**: JDK 21 para el desarrollo y ejecución de la aplicación.

## Navigating the App

- **Index**: La puerta de entrada a la aplicación, con opciones para iniciar sesión o registrarse.
- **Welcome**: La página principal mostrada después del inicio de sesión o registro, con enlaces a las funciones principales.

## Front-End

El front-end de la aplicación utiliza Bootstrap para un diseño responsivo y estilizado. Bootstrap facilita la creación de una interfaz de usuario atractiva con poco esfuerzo.

## JSP Pages

- `index.jsp`: Página de inicio que ofrece opciones para iniciar sesión o registrarse.
- `welcome.jsp`: Página de bienvenida para usuarios registrados que sirve como panel de navegación principal.
- `clients.jsp`: Visualiza la lista de clientes y permite la gestión de los mismos.
- `orders.jsp`: Muestra las órdenes existentes con opciones para su manejo.
- `client-register.jsp`: Formulario para el registro de nuevos clientes.
- `order-create.jsp`: Interfaz para la creación de nuevas órdenes.
- `order-edit.jsp`: Permite la edición de órdenes existentes.
- `login.jsp`: Manejo del inicio de sesión para los usuarios.
- `register.jsp`: Permite a nuevos usuarios crear una cuenta.

## Java Classes

### Controllers

- `ClientController.java`: Gestión de solicitudes para clientes.
- `OrderController.java`: Gestión de solicitudes para órdenes.
- `UserController.java`: Manejo de autenticación y registro de usuarios.

### Data Access Objects (DAO)

- `ClientDAO.java`: Interacción con la base de datos para clientes.
- `OrderDAO.java`: Interacción con la base de datos para órdenes.
- `UserDAO.java`: Interacción con la base de datos para usuarios.

### Models

- `Client.java`: Modelo de datos para cliente.
- `Order.java`: Modelo de datos para orden.
- `User.java`: Modelo de datos para usuario.

### Services

- `ClientService.java`: Lógica de negocio para clientes.
- `OrderService.java`: Lógica de negocio para órdenes.
- `UserService.java`: Lógica de negocio para usuarios.

### Utilities

- `DatabaseConnection.java`: Conexión a la base de datos MySQL.

## Getting Started

Para iniciar la aplicación:

1. Asegúrate de tener JDK 21 y Maven instalados en tu sistema.
2. Clona el repositorio en tu máquina local.
3. Ejecuta `mvn clean install` para construir el proyecto.
4. Abre `index.jsp` en tu navegador.
5. Regístrate si eres un nuevo usuario o inicia sesión con tus credenciales existentes.
6. Utiliza los enlaces en `welcome.jsp` para explorar las funcionalidades de la aplicación.

Asegúrate de que el servidor MySQL y Tomcat estén corriendo antes de iniciar la aplicación.

## Installation

1. **Ambiente de Desarrollo**: Sigue las instrucciones de Maven y JDK para configurar tu ambiente de desarrollo.
2. **Ejecución de Pruebas**: Para ejecutar pruebas manualmente, utiliza el comando `mvn test`.
3. **Implementación en Producción**: Para desplegar en un entorno local, utiliza Tomcat para montar el `war` generado por Maven. Para la nube, sigue los pasos específicos de Heroku para desplegar aplicaciones Java.

## Configuration

1. **Product Configuration**: Los archivos de configuración se encuentran dentro de la carpeta `src/main/resources`.
2. **Requirements Configuration**: Las dependencias y plugins están definidas en el archivo `pom.xml`.
3. **Database Setup**: Para replicar la base de datos, ejecuta los siguientes queries en tu sistema de gestión de MySQL:

```sql
CREATE DATABASE PRINTPRO_DB;

USE PRINTPRO_DB;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(255),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    description TEXT,
    quantity INT,
    status VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);
```

## Contribution

PrintPro App es un proyecto de código abierto. Aquí te explicamos cómo puedes contribuir:

1. **Fork el Repositorio**: Dado que PrintPro App es un repositorio público, puedes hacer fork del proyecto para comenzar a trabajar en tus propias mejoras. Esto crea una copia personal en tu cuenta de GitHub que puedes modificar.

2. **Clona el Repositorio**: Después de hacer fork del proyecto, puedes clonar tu versión a tu máquina local para comenzar a trabajar en los cambios.

3. **Crea un Nuevo Branch**: Antes de hacer cualquier cambio, crea un nuevo branch en tu fork. Esto ayuda a mantener organizado el trabajo y asegura que la rama principal (`main` o `master`) permanezca estable y libre de código en desarrollo.

4. **Haz tus Cambios**: Implementa tus cambios y mejoras en tu branch. Asegúrate de adherirte a las convenciones de código y a las prácticas recomendadas del proyecto.

5. **Escribe y Ejecuta Pruebas**: Si estás agregando una nueva funcionalidad o reparando un bug, escribe pruebas unitarias para acompañar tus cambios. Asegúrate de que todas las pruebas pasen antes de proceder.

6. **Documenta tus Cambios**: Actualiza la documentación si estás introduciendo cambios en la funcionalidad o en la forma de usar la aplicación.

7. **Commit tus Cambios**: Haz commits de tus cambios con mensajes de commit claros y descriptivos. Esto ayuda a los revisores a entender qué has hecho y por qué.

8. **Push a GitHub**: Empuja tus cambios al branch en tu fork en GitHub.

9. **Abre un Pull Request (PR)**: En el repositorio de PrintPro App, abre un pull request desde tu branch. En la descripción del PR, explica los cambios y referencias cualquier issue relacionado.

10. **Revisión y Merge**: Uno de los mantenedores revisará tu PR. Si hay comentarios o sugerencias, te pedirán que hagas modificaciones. Una vez que tu PR sea aprobado, será fusionado al repositorio principal.



## Roadmap

- **Future Implementations**: Revisa nuestro tracker de issues para ver los requerimientos que están planificados para futuras versiones.

## Running Tests

El proyecto utiliza JUnit 5 para la realización de pruebas unitarias, las cuales se ejecutan automáticamente mediante Travis CI en cada push al repositorio GitHub.

## Continuous Integration

Travis CI está configurado para integración continua, asegurando que cada cambio pase las pruebas antes de ser integrado al código base.

