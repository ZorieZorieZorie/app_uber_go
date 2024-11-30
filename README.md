UberGo Aplicación - README
Descripción General

Esta aplicación es una implementación básica de un servicio de transporte tipo ride-sharing, creada utilizando el framework Flutter. Ofrece un flujo simple que incluye inicio de sesión, solicitud de servicio, pago y calificación, proporcionando una visión de la estructura y lógica fundamentales de una aplicación de transporte.
Características
1. Pantalla de Inicio de Sesión

    Permite al usuario ingresar su correo electrónico y contraseña.
    Valida los campos y muestra mensajes de error si no se completan correctamente.
    Tras un inicio de sesión exitoso, el usuario es dirigido a la pantalla de ingreso de dirección.

2. Pantalla de Dirección

    El usuario puede ingresar la ubicación de recogida deseada.
    Muestra una interfaz simple que simula un mapa.
    Una vez ingresada la dirección, el usuario es dirigido a la pantalla de pago.

3. Pantalla de Pago

    Solicita los datos de la tarjeta de crédito y el código CVC.
    Muestra el correo electrónico y la dirección de recogida ingresados como confirmación.
    Procesa el pago y lleva al usuario a la pantalla de calificación tras la confirmación.

4. Pantalla de Calificación

    Permite al usuario calificar el servicio con 1 a 5 estrellas.
    El usuario puede enviar una breve opinión escrita.
    Regresa a la pantalla de inicio de sesión para permitir una nueva solicitud de viaje.

Estructura del Código
Punto de Entrada

    main() inicializa la aplicación y lanza UberGoApp.

Widgets Principales

    UberGoApp
        Define el tema de la aplicación y elimina la etiqueta de depuración.
    LoginScreen
        Widget con estado que maneja la autenticación del usuario.
    RatingScreen
        Widget con estado que recoge las calificaciones del servicio.

Tecnologías y Frameworks

    Flutter: La aplicación está desarrollada con Flutter, utilizando su rico ecosistema de widgets para la interfaz de usuario.
    Diseño Material: Proporciona una interfaz moderna y consistente.

Cómo Ejecutar la Aplicación

    Clonar el Repositorio

git clone <url-del-repositorio>
cd <carpeta-del-repositorio>

Instalar Flutter

    Sigue la Guía de Instalación de Flutter si no lo tienes instalado.

Ejecutar la Aplicación

    Conecta un dispositivo físico o virtual.
    Ejecuta el siguiente comando:

        flutter run
