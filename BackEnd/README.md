# Backend de Portal de Venta de Viajes Turísticos

Este proyecto implementa el backend de un portal de venta de viajes turísticos utilizando Django. Proporciona una API REST para la manipulación de productos, autenticación y autorización de usuarios, registro de usuarios, gestión de roles, y un sistema de carrito de compras para permitir las compras en el e-commerce.

## Descripción

Este backend proporciona las siguientes funcionalidades:

- **Manipulación de productos**: CRUD (Crear, Leer, Actualizar, Eliminar) de productos turísticos.
- **Autenticación y autorización**: API REST para la autenticación y autorización de usuarios.
- **Registro de usuarios**: API REST para el registro de nuevos usuarios.
- **Gestión de roles**: CRUD de roles (cliente, vendedor, administrador, etc.) solo accesible para administradores.
- **Carrito de compras**: API REST para gestionar el carrito de compras y permitir las compras en el e-commerce.

## Instalación

1. Clonar el repositorio:
    ```bash
    git clone https://github.com/usuario/nombre-del-proyecto-backend.git
    ```
2. Navegar al directorio del proyecto:
    ```bash
    cd nombre-del-proyecto-backend
    ```
3. Crear un entorno virtual:
    ```bash
    python -m venv env
    ```
4. Activar el entorno virtual:
    - En Windows:
        ```bash
        .\env\Scripts\activate
        ```
    - En macOS/Linux:
        ```bash
        source env/bin/activate
        ```
5. Instalar las dependencias:
    ```bash
    pip install -r requirements.txt
    ```
6. Crear el archivo `.env` y configurar las variables de entorno necesarias (ver `.env.example` para referencia).
7. Aplicar las migraciones:
    ```bash
    python manage.py migrate
    ```
8. Crear un superusuario para acceder al admin de Django:
    ```bash
    python manage.py createsuperuser
    ```

## Uso

1. Iniciar el servidor de desarrollo:
    ```bash
    python manage.py runserver
    ```
2. La API estará disponible en [http://localhost:8000](http://localhost:8000).

## API REST

### Endpoints

- **Productos**
  - `GET /api/products/` - Listar productos
  - `POST /api/products/` - Crear producto
  - `GET /api/products/{id}/` - Obtener producto por ID
  - `PUT /api/products/{id}/` - Actualizar producto por ID
  - `DELETE /api/products/{id}/` - Eliminar producto por ID

- **Usuarios**
  - `POST /api/auth/register/` - Registro de usuario
  - `POST /api/auth/login/` - Inicio de sesión
  - `POST /api/auth/logout/` - Cierre de sesión

- **Roles**
  - `GET /api/roles/` - Listar roles (solo administradores)
  - `POST /api/roles/` - Crear rol (solo administradores)
  - `GET /api/roles/{id}/` - Obtener rol por ID (solo administradores)
  - `PUT /api/roles/{id}/` - Actualizar rol por ID (solo administradores)
  - `DELETE /api/roles/{id}/` - Eliminar rol por ID (solo administradores)

- **Carrito de Compras**
  - `GET /api/cart/` - Ver carrito
  - `POST /api/cart/add/` - Agregar al carrito
  - `POST /api/cart/remove/` - Eliminar del carrito
  - `POST /api/cart/checkout/` - Proceder al pago

## Base de Datos

Se adjuntará el script MySQL para insertar datos mínimos y necesarios en la base de datos a efectos de poder testear el funcionamiento de la API REST.

```sql
-- Script para insertar datos mínimos en la base de datos
INSERT INTO roles (name) VALUES ('Cliente'), ('Vendedor'), ('Administrador');

INSERT INTO users (username, email, password, role_id) VALUES 
('admin', 'admin@example.com', 'hashed_password', 3),
('cliente', 'cliente@example.com', 'hashed_password', 1);

![image](https://github.com/TravelDreams2024/ISPC2024/assets/45200064/8af0fdcb-3d91-4aae-a7a0-ae1515a61357)

