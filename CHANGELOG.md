# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Versionado Semántico](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Por Agregar
- Funcionalidades futuras pendientes

## [1.0.1] - 2025-12-02

### Agregado
- **README.md profesional enterprise** con documentación completa
  - Badges profesionales (Build Status, License, Python Version, Robot Framework)
  - Tabla de contenidos navegable con enlaces internos
  - Arquitectura detallada del proyecto con explicación de capas
  - Guía de instalación paso a paso con verificación
  - Comandos de ejecución básicos y avanzados con ejemplos
  - Documentación de configuración Chrome incógnito optimizada
  - Explicación completa de reportería nativa con capturas
  - Ejemplo real de flujo automatizado (LoginFlow)
  - Roadmap detallado con 5 fases planificadas
  - Enlaces a CONTRIBUTING.md y documentación de soporte
  - Licencia MIT completa

- **Funcionalidades de captura mejoradas**
  - Keyword "Capturar Pantalla Manual" en Navegador.robot para capturas con nombre personalizado
  - Capturas manuales en flujos de login (login_exitoso.png, login_fallido.png)

### Mejorado
- Documentación del proyecto transformada a estándar enterprise
- Experiencia de desarrollador mejorada con guías claras
- Navegación interna del README con tabla de contenidos

## [1.0.0] - 2025-11-26

### Agregado
- **Estructura inicial del proyecto Robot Framework**
  - Carpetas organizadas: tests/, resources/pages/, resources/keywords/, resources/variables/, resources/flows/
  - README.md completo con documentación del proyecto

- **Bibliotecas instaladas**:
  - robotframework (7.3.2) - Framework base
  - robotframework-seleniumlibrary (6.8.0) - Automatización web  
  - robotframework-requests (0.9.7) - Pruebas de API REST
  - robotframework-jsonlibrary (0.5) - Validación de JSON
  - selenium (4.38.0) - WebDriver para navegadores
  - webdriver-manager (4.0.2) - Gestión automática de drivers
  - python-dotenv (1.2.1) - Variables de entorno

- **Page Object Model implementado**:
  - LoginPage.resource - Elementos y acciones de página de login
  - InventoryPage.resource - Elementos y validaciones de página inventory
  - Variables centralizadas con selectores reales de Saucedemo

- **Keywords y Flujos**:
  - LoginFlow.robot - Flujos completos de login exitoso y fallido
  - Navegador.robot - Keywords centralizados de manejo de navegador
  - common.robot - Keywords reutilizables (estructura base)

- **Variables Globales**:
  - globales.robot - URLs, timeouts, credenciales válidas centralizadas

- **Tests Funcionales**:
  - login_tests.robot - Suite con casos de login exitoso y fallido
  - Suite Setup/Teardown para optimización de navegador compartido

- **Configuración de Chrome Optimizada**:
  - Modo incógnito para evitar popups de contraseñas
  - Argumentos para suprimir notificaciones y extensiones
  - Captura automática de screenshots en fallos (run_on_failure)

- **Keywords Implementados**:
  - `Abrir Página De Login` - Navegación optimizada con Go To
  - `Ingresar Usuario` / `Ingresar Contraseña` - Input de credenciales
  - `Hacer Click En Login` - Acción de login con Sleep para observación
  - `Validar Mensaje De Error` - Verificación de mensajes de error
  - `Esperar Que La Página De Login Esté Lista` - Validación de carga de página
  - `Esperar Que Inventory Esté Lista` - Validación de página post-login
  - `Realizar Login Exitoso` - Flujo completo de login válido
  - `Realizar Login Fallido` - Flujo completo de login inválido con validación
  - `Abrir Navegador Una Vez` - Setup optimizado de navegador
  - `Cerrar Navegador` - Teardown de navegador

### Configurado
- **Git Repository**: Repositorio inicializado y subido a GitHub
- **Estructura Modular**: Separación clara de responsabilidades entre páginas, flujos y keywords
- **Suite Optimization**: Navegador compartido entre tests para mejor performance

### Validado
- Tests de login exitoso con credenciales válidas (standard_user/secret_sauce)
- Tests de login fallido con validación de mensajes de error
- Captura automática de screenshots en caso de fallos
- Eliminación de popups molestos de Chrome durante automatización
- Framework funcionando al 100% sin errores

---

## Tipos de cambios
- `Agregado` para nuevas características
- `Cambiado` para cambios en funcionalidad existente  
- `Deprecado` para características que serán removidas
- `Removido` para características removidas
- `Arreglado` para corrección de bugs
- `Seguridad` para vulnerabilidades