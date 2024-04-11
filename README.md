# PrintPro App Documentation

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


## Contribution

1. **User Contribution Guide**: Sigue nuestra guía de contribución para entender el proceso de colaboración.
2. **Pull Requests**: Asegúrate de seguir los pasos específicos: clona el repositorio, crea un nuevo branch, realiza tus cambios, empuja el branch y crea un pull request.

## Roadmap

- **Future Implementations**: Revisa nuestro tracker de issues para ver los requerimientos que están planificados para futuras versiones.

## Running Tests

El proyecto utiliza JUnit 5 para la realización de pruebas unitarias, las cuales se ejecutan automáticamente mediante Travis CI en cada push al repositorio GitHub.

## Continuous Integration

Travis CI está configurado para integración continua, asegurando que cada cambio pase las pruebas antes de ser integrado al código base.

