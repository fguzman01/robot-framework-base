# Robot Framework Automation Project

> **Framework de automatización modular y escalable construido con Robot Framework, SeleniumLibrary y Page Object Model**

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/fguzman01/robot-framework-base)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Python Version](https://img.shields.io/badge/python-3.8%2B-blue)](https://www.python.org/downloads/)
[![Robot Framework](https://img.shields.io/badge/robot--framework-7.3.2-green)](https://robotframework.org/)

---

## 📋 Tabla de Contenidos

- [Descripción General](#-descripción-general)
- [Arquitectura del Proyecto](#️-arquitectura-del-proyecto)
- [Requisitos Previos](#-requisitos-previos)
- [Instalación](#-instalación)
- [Ejecución de Pruebas](#-ejecución-de-pruebas)
- [Manejo del Navegador](#-manejo-del-navegador)
- [Reportería](#-reportería)
- [Ejemplo de Flujo Automatizado](#-ejemplo-de-flujo-automatizado)
- [Roadmap del Proyecto](#-roadmap-del-proyecto)
- [Cómo Contribuir](#-cómo-contribuir)
- [Changelog](#-changelog)
- [Licencia](#-licencia)

---

## 🎯 Descripción General

Este proyecto es un **framework de automatización de pruebas enterprise** construido con Robot Framework que implementa el patrón **Page Object Model (POM)** con una arquitectura modular y escalable.

### ¿Qué es este Framework?
Un framework completo para automatización de pruebas web que proporciona una base sólida, mantenible y escalable para equipos de QA y desarrollo. Diseñado siguiendo las mejores prácticas de la industria.

### Objetivo del Proyecto
- ✅ **Automatización web robusta** con Selenium WebDriver
- ✅ **Arquitectura modular** basada en separación de responsabilidades  
- ✅ **Reutilización de código** através de components compartidos
- ✅ **Mantenibilidad** con estructura clara y documentada
- ✅ **Escalabilidad** para proyectos enterprise de cualquier tamaño

### Tecnologías Utilizadas
- **[Robot Framework 7.3.2](https://robotframework.org/)** - Framework base de automatización
- **[SeleniumLibrary 6.8.0](https://robotframework.org/SeleniumLibrary/)** - Automatización de navegadores web
- **[RequestsLibrary 0.9.7](https://github.com/MarketSquare/robotframework-requests)** - Pruebas de API REST
- **[JsonLibrary 0.5](https://github.com/robotframework-thailand/robotframework-jsonlibrary)** - Validación y manipulación JSON
- **[WebDriver Manager 4.0.2](https://github.com/SergeyPirogov/webdriver_manager)** - Gestión automática de drivers

### Enfoque Modular
El framework implementa una **arquitectura en capas** claramente separadas:
- **Pages**: Page Object Models con elementos de UI
- **Flows**: Lógica de negocio y casos de uso completos
- **Keywords**: Funcionalidades técnicas transversales
- **Variables**: Configuración centralizada y datos de prueba
- **Tests**: Casos de prueba ejecutables y organizados

---

## 🏗️ Arquitectura del Proyecto

### Estructura de Carpetas

```
robot-framework/
├── README.md                           # Este archivo
├── CONTRIBUTING.md                     # Guía de contribución
├── CHANGELOG.md                        # Historial de cambios
├── PROJECT_CONTEXT.md                  # Documentación arquitectónica
├── requirements.txt                    # Dependencias Python (futuro)
│
├── configs/                           # Configuraciones por ambiente
│   └── .env                          # Variables de entorno
│
├── resources/                         # Componentes reutilizables
│   ├── pages/                        # Page Object Models
│   │   ├── LoginPage.resource        # Elementos y acciones de login
│   │   └── InventoryPage.resource    # Elementos y acciones de inventario
│   │
│   ├── flows/                        # Flujos de negocio
│   │   └── LoginFlow.robot          # Flujos de autenticación completos
│   │
│   ├── keywords/                     # Keywords técnicos globales
│   │   ├── Navegador.robot          # Manejo de navegador y capturas
│   │   └── common.robot             # Keywords comunes transversales
│   │
│   └── variables/                    # Variables y configuración
│       └── globales.robot           # URLs, credenciales, timeouts
│
├── tests/                            # Casos de prueba
│   └── login/                       # Suite de autenticación
│       └── login_tests.robot        # Tests de login exitoso y fallido
│
├── libraries/                        # Bibliotecas Python custom (futuro)
└── results/                          # Archivos generados (futuro)
    ├── screenshots/                 # Capturas de pantalla
    ├── logs/                       # Archivos de log
    └── reports/                    # Reportes HTML y XML
```

### Capas de la Arquitectura

| Capa | Propósito | Contenido |
|------|-----------|-----------|
| **`pages/`** | Page Object Models | Selectores UI y acciones básicas de páginas |
| **`flows/`** | Flujos de negocio | Lógica completa que combina múltiples páginas |
| **`keywords/`** | Utilidades técnicas | Keywords transversales, configuración, helpers |
| **`variables/`** | Configuración global | URLs, credenciales, timeouts, datos de prueba |
| **`tests/`** | Casos de prueba | Tests ejecutables organizados por funcionalidad |

---

## 📋 Requisitos Previos

### Entorno de Desarrollo
- **Python 3.8+** (recomendado Python 3.11+)
- **pip** (gestor de paquetes actualizado)
- **Git** para control de versiones
- **Google Chrome** (versión actualizada)

### Instalación de Dependencias Base
```bash
# Verificar Python
python --version  # Debe ser 3.8+

# Actualizar pip
python -m pip install --upgrade pip

# Instalar Robot Framework core
pip install robotframework==7.3.2
```

### Verificación del Entorno
```bash
# Verificar instalación
robot --version
python -c "import robot; print('Robot Framework instalado correctamente')"
```

---

## ⚙️ Instalación

### 1. Clonar el Repositorio
```bash
git clone https://github.com/fguzman01/robot-framework-base.git
cd robot-framework-base
```

### 2. Crear Entorno Virtual (Recomendado)
```bash
# Crear entorno virtual
python -m venv venv

# Activar entorno virtual
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate
```

### 3. Instalar Dependencias
```bash
# Instalar todas las dependencias del proyecto
pip install robotframework==7.3.2
pip install robotframework-seleniumlibrary==6.8.0
pip install robotframework-requests==0.9.7
pip install robotframework-jsonlibrary==0.5
pip install webdriver-manager==4.0.2
pip install python-dotenv==1.2.1

# Futura implementación con requirements.txt
# pip install -r requirements.txt
```

### 4. Verificar Instalación
```bash
# Ejecutar test de verificación
robot --dryrun tests/login/login_tests.robot

# Debería mostrar: "2 tests, 2 passed, 0 failed"
```

### 5. Configurar Variables Globales (Opcional)
```bash
# Crear archivo de configuración local
cp configs/.env.example configs/.env

# Editar variables según tu entorno
# BASE_URL=https://www.saucedemo.com/
# TIMEOUT=10s
```

---

## 🚀 Ejecución de Pruebas

### Comandos Básicos

```bash
# Ejecutar toda la suite de pruebas
robot tests/

# Ejecutar suite específica
robot tests/login/

# Ejecutar test específico
robot --test "Login Exitoso" tests/login/login_tests.robot
```

### Ejecución con Configuraciones Avanzadas

```bash
# Con directorio de salida específico
robot --outputdir results tests/

# Con nivel de log detallado
robot --loglevel DEBUG tests/login/

# Con tags específicas
robot --include smoke tests/
robot --include "login AND positive" tests/

# Con timestamp en archivos de salida
robot --timestampoutputs tests/
```

### Comandos para Desarrollo

```bash
# Solo validar sintaxis (dry-run)
robot --dryrun tests/

# Ejecutar con variables customizadas
robot --variable TIMEOUT:30s tests/

# Generar reportes en formato específico
robot --log custom_log.html --report custom_report.html tests/
```

### Ejemplo de Salida Exitosa
```
==============================================================================
Login Tests
==============================================================================
Login Exitoso                                                         | PASS |
------------------------------------------------------------------------------
Login Fallido                                                         | PASS |
------------------------------------------------------------------------------
Login Tests                                                           | PASS |
2 tests, 2 passed, 0 failed
==============================================================================
Output:  output.xml
Log:     log.html  
Report:  report.html
```

---

## 🌐 Manejo del Navegador

### Configuración Optimizada de Chrome
El framework utiliza **Chrome en modo incógnito** con configuraciones optimizadas para automatización:

```robotframework
# resources/keywords/Navegador.robot
Abrir Navegador Una Vez
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --incognito
    Call Method    ${chrome_options}    add_argument    --disable-save-password-bubble
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Open Browser    ${BASE_URL}    chrome    options=${chrome_options}
    Maximize Browser Window
```

### Suite Setup/Teardown Optimizado
**Un navegador compartido** para toda la suite mejora significativamente el performance:

```robotframework
# tests/login/login_tests.robot
*** Settings ***
Suite Setup     Abrir Navegador Una Vez    # ✅ Se ejecuta UNA vez al inicio
Suite Teardown  Cerrar Navegador           # ✅ Se ejecuta UNA vez al final
```

### Beneficios del Enfoque
- ⚡ **Performance mejorado**: Sin overhead de apertura/cierre repetitivo
- 🛡️ **Sin popups molestos**: Modo incógnito evita notificaciones de contraseñas
- 🔧 **Configuración consistente**: Mismas opciones para todos los tests
- 💾 **Recursos optimizados**: Menor consumo de memoria y CPU

---

## 📊 Reportería

### Reportes Nativos de Robot Framework

El framework genera automáticamente tres tipos de reportes:

| Archivo | Propósito | Audiencia |
|---------|-----------|-----------|
| **`report.html`** | Reporte ejecutivo con métricas | Managers, Stakeholders |
| **`log.html`** | Log detallado paso a paso | QA Engineers, Developers |
| **`output.xml`** | Datos estructurados | CI/CD, Herramientas de análisis |

### Capturas Automáticas en Fallos

```robotframework
# Configuración en flows/
Library    SeleniumLibrary    run_on_failure=Capture Page Screenshot
```
- ✅ **Captura automática** cada vez que un test falla
- 📸 **Screenshot del estado actual** del navegador
- 🔍 **Debugging facilitado** con evidencia visual

### Capturas Manuales Personalizadas

```robotframework
# Ejemplo en flows
Realizar Login Exitoso
    [Arguments]    ${usuario}    ${password}
    Abrir Página De Login
    Ingresar Usuario        ${usuario}
    Ingresar Contraseña     ${password}
    Hacer Click En Login
    Capturar Pantalla Manual    login_exitoso.png    # ✅ Captura manual
    Esperar Que Inventory Esté Lista
```

### Ubicación de Archivos Generados
```
robot-framework/
├── report.html              # Reporte ejecutivo
├── log.html                 # Log detallado  
├── output.xml               # Datos XML
├── login_exitoso.png        # Screenshots manuales
├── login_fallido.png        # Screenshots manuales
└── selenium-screenshot-*.png # Screenshots automáticas
```

---

## 💡 Ejemplo de Flujo Automatizado

### Flow Completo: Login Exitoso

```robotframework
# resources/flows/LoginFlow.robot
*** Keywords ***
Realizar Login Exitoso
    [Arguments]    ${usuario}    ${password}
    Abrir Página De Login                    # 🌐 Navegar a login
    Ingresar Usuario        ${usuario}       # ⌨️ Input username  
    Ingresar Contraseña     ${password}      # ⌨️ Input password
    Hacer Click En Login                     # 🖱️ Submit form
    Esperar Que Inventory Esté Lista        # ✅ Validar redirección
```

### Test que Usa el Flow

```robotframework
# tests/login/login_tests.robot
*** Settings ***
Suite Setup     Abrir Navegador Una Vez
Suite Teardown  Cerrar Navegador
Resource        ../../resources/flows/LoginFlow.robot
Resource        ../../resources/variables/globales.robot

*** Test Cases ***
Login Exitoso Con Credenciales Válidas
    [Documentation]    Verifica que un usuario puede loguearse con credenciales válidas
    [Tags]            smoke    login    positive
    Realizar Login Exitoso    ${USUARIO_VALIDO}    ${PASSWORD_VALIDA}
```

### Ejecución del Ejemplo
```bash
# Ejecutar solo este test
robot --test "Login Exitoso Con Credenciales Válidas" tests/login/

# Resultado esperado:
# ✅ Login Exitoso Con Credenciales Válidas | PASS |
```

---

## 🚀 Roadmap del Proyecto

### 🎯 Fase Actual: v1.0 - Foundation ✅
- [x] Arquitectura modular con Page Object Model
- [x] Tests de login (exitoso/fallido)  
- [x] Configuración optimizada de Chrome
- [x] Reportería nativa con capturas
- [x] Documentación completa

### 🔮 Próximas Fases

#### v1.1 - API Testing
- [ ] Keywords para pruebas de API REST
- [ ] Validación de schemas JSON
- [ ] Tests híbridos Web + API
- [ ] Integración de RequestsLibrary

#### v1.2 - Reportería Avanzada  
- [ ] Integración con Allure Framework
- [ ] Dashboard interactivo de métricas
- [ ] Reportes customizados por stakeholder
- [ ] Trending de resultados históricos

#### v1.3 - Multi-Ambiente
- [ ] Variables por ambiente (.env files)
- [ ] Profiles de ejecución (dev/test/prod)
- [ ] Gestión segura de credenciales
- [ ] Configuración de CI/CD

#### v1.4 - E-commerce Completo
- [ ] Page Objects de carrito y checkout
- [ ] Flujos end-to-end de compra
- [ ] Tests de inventario y precios
- [ ] Validación de procesos de pago

#### v1.5 - Enterprise Features
- [ ] Ejecución paralela de tests
- [ ] Integración con Jenkins/GitHub Actions  
- [ ] Tests de performance básicos
- [ ] Conectividad con bases de datos

---

## 🤝 Cómo Contribuir

¡Las contribuciones son bienvenidas y apreciadas! 

### Proceso de Contribución
1. 📖 **Leer la guía completa**: [`CONTRIBUTING.md`](CONTRIBUTING.md)
2. 🌿 **Crear branch**: `git checkout -b feature/nueva-funcionalidad`
3. ✍️ **Seguir convenciones**: Conventional Commits y arquitectura modular
4. 🧪 **Probar localmente**: Ejecutar tests antes de enviar PR
5. 📝 **Documentar cambios**: Actualizar docs si es necesario
6. 🔄 **Enviar Pull Request**: Con descripción clara de los cambios

### Convenciones Importantes
- ✅ Usar **Conventional Commits**: `feat:`, `fix:`, `docs:`, etc.
- ✅ Mantener **separación de capas**: Pages, Flows, Keywords, Tests
- ✅ Seguir **nomenclatura establecida**: Keywords en español, Variables en MAYÚSCULAS
- ✅ **No duplicar código**: Reutilizar components existentes
- ✅ **Documentar keywords complejos**: Con `[Documentation]`

### Quick Start para Contribuir
```bash
# Setup de desarrollo
git clone https://github.com/fguzman01/robot-framework-base.git
cd robot-framework-base  
git checkout -b feature/mi-contribucion
pip install -r requirements.txt
robot --dryrun tests/  # Validar que todo funciona
```

Para más detalles, consulta [`CONTRIBUTING.md`](CONTRIBUTING.md).

---

## 📝 Changelog

Todos los cambios notables están documentados en [`CHANGELOG.md`](CHANGELOG.md).

### Versiones Recientes
- **v1.0.0** (2025-11-26): Lanzamiento inicial con arquitectura completa
- **v1.0.1** (2025-12-02): Capturas manuales y documentación mejorada

Para el historial completo de cambios, ver [`CHANGELOG.md`](CHANGELOG.md).

---

## 📄 Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

```
MIT License

Copyright (c) 2025 Robot Framework Automation Project

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🙏 Agradecimientos

- **Robot Framework Team** - Por crear un framework excepcional
- **SeleniumHQ** - Por la automatización web robusta  
- **Comunidad Open Source** - Por las librerías y herramientas

### 👥 Para Desarrolladores

Este proyecto implementa patrones y prácticas probadas en la industria:
- **Page Object Model** para mantenibilidad
- **Separation of Concerns** para escalabilidad  
- **DRY Principle** para reutilización
- **Convention over Configuration** para productividad

### ⚠️ Estado del Proyecto

> **Nota**: Este proyecto está en **desarrollo activo**. 
> La API puede cambiar entre versiones menores.
> Para uso en producción, usar releases tagged.

### 🆘 Soporte

- 📚 **Documentación**: [`PROJECT_CONTEXT.md`](PROJECT_CONTEXT.md)
- 🐛 **Issues**: [GitHub Issues](https://github.com/fguzman01/robot-framework-base/issues)  
- 💬 **Discusiones**: [GitHub Discussions](https://github.com/fguzman01/robot-framework-base/discussions)
- 📖 **Robot Framework Docs**: [robotframework.org](https://robotframework.org/)

---

**¡Construido con ❤️ usando Robot Framework!** 🤖

*Este README es un documento vivo que evoluciona con el proyecto.*