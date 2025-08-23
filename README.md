# 📌 Estructura del Proyecto

Este proyecto sigue los principios de **Clean Architecture** para mantener un código modular, escalable y fácil de mantener. A continuación, se describen las principales carpetas y su propósito:

## 📂 **Estructura de Carpetas**

### 🌍 **app/**

- `app.dart`: Punto de entrada de la aplicación donde se inicializan dependencias y configuraciones globales.

### ⚙️ **config/** (Configuraciones generales)

- `assets/`: Gestión de recursos estáticos como imágenes, fuentes y JSONs.
- `routes/`: Definición y manejo centralizado de rutas de la aplicación.
- `styles/`: Configuración de estilos globales como text styles y decoraciones.
- `theme/`: Definición del tema global de la aplicación (colores, tipografías, etc.).

### 🏗️ **core/** (Código base reutilizable)

- `components/`: Widgets reutilizables a nivel global.
- `const/`: Definición de constantes generales como URLs, claves de API o configuraciones de BD.
- `fundation/`: Clases base esenciales para la arquitectura, como `DataState` y `UseCase`.
- `helper/`: Clases auxiliares para manejo de datos, formateo y operaciones recurrentes.

### 📌 **main.dart**

Archivo principal que inicia la aplicación y configura dependencias.

---

## 🚀 **Features**

Cada módulo o funcionalidad de la aplicación se encapsula dentro de una **feature** dentro de `features/`. Esto mantiene el código bien organizado y desacoplado.

📌 **Cada feature se estructura en tres capas:**

### 🗄️ **Data** (Capa de Datos)

Maneja la obtención de información desde fuentes externas, como APIs o bases de datos locales.

#### 🔹 Qué encontrarás aquí:

- Modelos de datos (`models/`)
- Implementaciones de repositorios (`repositories/impl/`)
- Fuentes de datos (`datasources/` para API o almacenamiento local)

### 🏛️ **Domain** (Capa de Dominio)

Define las reglas de negocio y casos de uso de la aplicación. Es independiente de Flutter y de frameworks externos.

#### 🔹 Qué encontrarás aquí:

- Entidades (`entities/` con las representaciones de negocio)
- Casos de uso (`usecases/` que ejecutan acciones específicas)
- Abstracciones de repositorios (`repositories/` con las interfaces)

### 🎨 **Presentation** (Capa de Presentación)

Contiene la interfaz de usuario y la lógica de presentación.

#### 🔹 Qué encontrarás aquí:

- Pantallas y widgets especificos de las pantallas que NO se compartiran entre FEATURES (`screens/` y `widgets/`)
- Estado de la UI (`providers/`)

---

Con esta estructura, logramos una aplicación **modular**, **escalable** y de fácil mantenimiento. ¡Bienvenido al proyecto! 🚀

---

## 📜 **Uso de Archivos de Barril (`barrel files`)**

Para mantener un código más limpio y evitar imports extensos, es **obligatorio** utilizar archivos de barril en cada carpeta.

🔹 **Ejemplo de un archivo de barril en `core/components/`:**

```dart
// core/components/components.dart
export 'custom_button.dart';
export 'custom_text_field.dart';
```

## Generador de código (Retrofit, AutoRoute, JsonAnnotation)

```bash
dart pub run build_runner build --delete-conflicting-outputs
```