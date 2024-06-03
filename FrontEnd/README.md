# Nombre del Proyecto

Descripción del Proyecto: Portal de Venta de Viajes Turísticos

El Portal de Venta de Viajes Turísticos es una plataforma en línea diseñada para ofrecer a los usuarios la posibilidad de explorar y adquirir paquetes turísticos de manera fácil y conveniente. Los usuarios podrán explorar una amplia variedad de destinos turísticos, con información detallada sobre cada uno, lo que les permitirá seleccionar los paquetes que mejor se adapten a sus preferencias y necesidades.

### Características Principales

- **Exploración de Destinos Turísticos**: Los usuarios podrán navegar y explorar una la variedad de destinos turísticos, con descripciones y precio. 
- **Compra de Paquetes Turísticos**: Una vez seleccionados los destinos y paquetes turísticos deseados, los usuarios podrán comprarlos directamente a través de la página utilizando diversos métodos de pago seguros.
- **Dashboard de Usuario**: Los usuarios tendrán acceso a un dashboard personalizado donde podrán:
  - **Consultar Historial de Compras**: Revisar todas las compras anteriores realizadas en la plataforma, con detalles completos de cada transacción.
  - **Estado de Pedido**: Ver el estado actual de sus pedidos, desde la confirmación hasta la finalización del viaje.
  - **Perfil de Usuario**: Gestionar y actualizar la información de su perfil, como datos personales y preferencias de viaje.

Este portal está diseñado para proporcionar una experiencia de usuario intuitiva y enriquecedora, facilitando la planificación y compra de viajes turísticos de manera eficiente y segura.

## Instalación

1. Clonar el repositorio:
    ```bash
    git clone https://github.com/TravelDreams2024/ISPC2024
    ```
2. Navegar al directorio del proyecto:
    ```bash
    cd nombre-del-proyecto
    ```
3. Instalar las dependencias:
    ```bash
    npm install
    ```

## Uso

1. Iniciar el servidor de desarrollo:
    ```bash
    ng serve
    ```
2. Abrir [http://localhost:4200](http://localhost:4200) en el navegador para ver la aplicación en funcionamiento.

## Simulación del Backend

Para simular el backend durante el desarrollo, puedes utilizar `json-server` con el archivo `db.json`. Sigue estos pasos:

1. Instalar `json-server` globalmente si no lo tienes ya instalado:
    ```bash
    npm install -g json-server
    ```
2. Crear un archivo `db.json` en la raíz del proyecto con los datos necesarios para simular el backend. Ejemplo:
    ```json
    {
      "users": [
        { "id": 1, "name": "John Doe", "email": "john@example.com" }
      ],
      "orders": [
        { "id": 1, "userId": 1, "status": "completed" }
      ]
    }
    ```
3. Iniciar `json-server` para servir `db.json`:
    ```bash
    json-server --watch db.json
    ```
    ## Estructura Basica del proyecto 
![Captura de pantalla 2024-06-03 165644](https://github.com/TravelDreams2024/ISPC2024/assets/45200064/1c8a1a79-6837-424b-8f74-276c6aa42ba0)
