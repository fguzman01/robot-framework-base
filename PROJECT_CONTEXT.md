# Proyecto Robot Framework – Contexto General

## 🎯 Objetivo del Proyecto

Este es un framework de automatización de pruebas construido con **Robot Framework** que implementa el patrón **Page Object Model (POM)** con una arquitectura modular y escalable. El objetivo principal es proporcionar una base sólida para automatización de pruebas web utilizando Selenium, con capacidad de expansión hacia pruebas de API, integración con herramientas de reporte avanzadas y manejo de múltiples entornos.

El framework está diseñado para ser:
- **Mantenible**: Separación clara de responsabilidades
- **Escalable**: Fácil adición de nuevas páginas, flujos y tests
- **Reutilizable**: Keywords y componentes modulares
- **Profesional**: Configuración empresarial con reportería y capturas

---

## 🏗️ Arquitectura del Proyecto

### Estructura de Carpetas

```
robot-framework/
├── README.md                           # Documentación principal del proyecto
├── CHANGELOG.md                        # Historial de cambios versionado
├── PROJECT_CONTEXT.md                  # Este archivo - contexto arquitectónico
├── requirements.txt                    # Dependencias Python (futuro)
├── .gitignore                         # Archivos excluidos de Git (futuro)
│
├── configs/                           # Configuraciones y variables de entorno
│   └── .env                          # Variables por ambiente (desarrollo/testing/prod)
│
├── resources/                         # Recursos reutilizables del framework
│   ├── pages/                        # Page Object Models - Elementos de UI
│   │   ├── LoginPage.resource        # Página de login de SauceDemo
│   │   └── InventoryPage.resource    # Página de inventario post-login
│   │
│   ├── flows/                        # Flujos de negocio complejos
│   │   └── LoginFlow.robot          # Flujos de autenticación completos
│   │
│   ├── keywords/                     # Keywords técnicos y utilidades
│   │   ├── common.robot             # Keywords comunes transversales
│   │   └── Navegador.robot          # Keywords de manejo de navegador
│   │
│   └── variables/                    # Variables globales y configuración
│       └── globales.robot           # URLs, credenciales, timeouts
│
├── tests/                            # Casos de prueba organizados por módulo
│   └── login/                       # Suite de pruebas de autenticación
│       └── login_tests.robot        # Tests de login exitoso y fallido
│
├── libraries/                        # Bibliotecas Python personalizadas (futuro)
│
└── results/                          # Archivos generados (futuro)
    ├── screenshots/                 # Capturas de pantalla
    ├── logs/                       # Archivos de log
    └── reports/                    # Reportes HTML y XML
```

---

## 📋 Definición Detallada de Cada Capa

### 🖥️ **pages/** - Page Object Models
**Propósito**: Encapsula los elementos de UI y acciones básicas de cada página web.

**Características**:
- Contiene selectores CSS/XPath de elementos UI
- Keywords simples para interacciones básicas (click, input, wait)
- Una página web = un archivo .resource
- **NO** contiene lógica de negocio compleja
- **NO** combina múltiples páginas

**Ejemplo**: `LoginPage.resource` contiene selectores del formulario de login y keywords como `Ingresar Usuario`, `Ingresar Contraseña`, `Hacer Click En Login`.

### 🔄 **flows/** - Flujos de Negocio
**Propósito**: Combina múltiples páginas y acciones para crear flujos de negocio completos.

**Características**:
- Orquesta keywords de múltiples páginas
- Implementa casos de uso de negocio completos
- Maneja navegación entre páginas
- Incluye validaciones de flujo end-to-end
- **SÍ** contiene lógica de negocio

**Ejemplo**: `LoginFlow.robot` combina `LoginPage` e `InventoryPage` para crear `Realizar Login Exitoso`.

### ⚙️ **keywords/** - Keywords Técnicos y Utilidades
**Propósito**: Proporciona funcionalidades técnicas transversales y utilidades del framework.

**Características**:
- Keywords técnicos no relacionados con páginas específicas
- Configuración de navegador, capturas, esperas genéricas
- Utilidades de datos, logging, debugging
- Funciones de setup/teardown globales

**Ejemplo**: `Navegador.robot` contiene configuración de Chrome, `common.robot` tendrá utilidades generales.

### 📊 **variables/** - Variables Globales y Configuración
**Propósito**: Centraliza configuración, URLs, credenciales y constantes del proyecto.

**Características**:
- Variables que se usan en múltiples archivos
- Configuración por ambiente (dev/test/prod)
- URLs base, timeouts, credenciales
- **NO** contiene keywords, solo variables

**Ejemplo**: `globales.robot` define `${BASE_URL}`, `${USUARIO_VALIDO}`, `${TIMEOUT}`.

### 🧪 **tests/** - Casos de Prueba
**Propósito**: Define los casos de prueba ejecutables organizados por funcionalidad.

**Características**:
- Archivos .robot ejecutables por Robot Framework
- Organizados en carpetas por módulo/funcionalidad
- Usa keywords de flows/ para casos complejos
- Suite Setup/Teardown para optimización
- Tags para categorización y filtrado

**Ejemplo**: `login_tests.robot` ejecuta scenarios de login usando `LoginFlow.robot`.

---

## 📝 Convenciones del Proyecto

### Nombres de Keywords
- **Páginas**: Verbos en infinitivo - `Ingresar Usuario`, `Hacer Click En Login`
- **Flows**: Verbos con contexto completo - `Realizar Login Exitoso`, `Completar Proceso De Compra`
- **Utilidades**: Verbos descriptivos - `Capturar Pantalla Manual`, `Esperar Elemento Visible`

### Nombres de Variables
- **Constantes**: MAYÚSCULAS con guiones bajos - `${BASE_URL}`, `${TIMEOUT}`
- **Selectores**: Descriptivos con sufijo del tipo - `${USERNAME_FIELD}`, `${LOGIN_BUTTON}`
- **Datos**: Contexto claro - `${USUARIO_VALIDO}`, `${PASSWORD_VALIDA}`

### Organización de Archivos
- **Un archivo por página**: LoginPage.resource, InventoryPage.resource
- **Un archivo por flujo de negocio**: LoginFlow.robot, CheckoutFlow.robot
- **Keywords agrupados por funcionalidad**: Navegador.robot, API.robot
- **Tests agrupados por módulo**: login/, checkout/, api/

### Buenas Prácticas
- ✅ Usar Resources para imports, no Libraries directas en tests
- ✅ Documentar todos los keywords con [Documentation]
- ✅ Usar argumentos descriptivos: `[Arguments]    ${usuario}    ${password}`
- ✅ Preferir selectores CSS sobre XPath cuando sea posible
- ✅ Implementar esperas explícitas: `Wait Until Element Is Visible`
- ✅ Usar tags para categorización: `[Tags]    login    smoke    positive`

---

## 📊 Reportería

### Archivos de Salida Estándar
- **`log.html`**: Log detallado de ejecución con cada paso y timing
- **`report.html`**: Reporte ejecutivo con estadísticas y métricas
- **`output.xml`**: Datos estructurados para procesamiento posterior

### Configuración de Capturas
- **Automáticas**: `run_on_failure=Capture Page Screenshot` en SeleniumLibrary
- **Manuales**: Keyword `Capturar Pantalla Manual` con nombres personalizados
- **Almacenamiento**: Screenshots guardados en directorio raíz (futuro: results/screenshots/)

### Configuración Avanzada (Futuro)
- Integración con **Allure** para reportes interactivos
- **Dashboard de métricas** con tendencias históricas
- **Integración CI/CD** con Jenkins/GitHub Actions

---

## 🚀 Roadmap de Evolución

### Fase 2: API Testing
- [ ] Implementar keywords para pruebas de API REST
- [ ] Agregar validación de schemas JSON
- [ ] Crear flujos híbridos web + API
- [ ] Tests de integración backend/frontend

### Fase 3: Reportería Avanzada
- [ ] Integración con Allure Framework
- [ ] Dashboard de métricas y tendencias
- [ ] Reportes customizados por stakeholder
- [ ] Integración con herramientas de CI/CD

### Fase 4: Manejo de Entornos
- [ ] Configuración multi-ambiente (dev/test/staging/prod)
- [ ] Variables de entorno con archivos .env
- [ ] Profiles de ejecución por ambiente
- [ ] Gestión de credenciales seguras

### Fase 5: Funcionalidades E-commerce
- [ ] Page Objects del carrito de compras
- [ ] Flujos de checkout completos
- [ ] Tests de procesos de pago
- [ ] Validación de inventario y precios

### Fase 6: Optimización y Escalabilidad
- [ ] Ejecución paralela de tests
- [ ] Pool de navegadores
- [ ] Tests de performance básicos
- [ ] Integración con bases de datos

---

## 🔧 Cómo Agregar Nuevos Componentes

### Para GitHub Copilot y Desarrolladores

#### ➕ Agregar Nueva Página
1. **Crear archivo**: `resources/pages/NombrePage.resource`
2. **Estructura obligatoria**:
   ```robotframework
   *** Settings ***
   Library    SeleniumLibrary
   Resource   ../variables/globales.robot

   *** Variables ***
   # Selectores de elementos UI
   ${ELEMENTO_PRINCIPAL}    css=.selector

   *** Keywords ***
   Acción Básica De La Página
       # Implementación
   ```
3. **Contenido**: Solo selectores y acciones básicas de UI
4. **Importar en flows**: Agregar `Resource    ../pages/NombrePage.resource`

#### ➕ Agregar Nuevo Flujo
1. **Crear archivo**: `resources/flows/NombreFlow.robot`
2. **Importar dependencias**: Pages necesarias, variables, Navegador.robot
3. **Implementar keywords de negocio**: Combinando múltiples páginas
4. **Importar en tests**: `Resource    ../../resources/flows/NombreFlow.robot`

#### ➕ Agregar Nueva Suite de Tests
1. **Crear carpeta**: `tests/nueva_funcionalidad/`
2. **Crear archivo**: `tests/nueva_funcionalidad/nombre_tests.robot`
3. **Estructura obligatoria**:
   ```robotframework
   *** Settings ***
   Suite Setup     Abrir Navegador Una Vez
   Suite Teardown  Cerrar Navegador
   Resource        ../../resources/flows/FlowNecesario.robot

   *** Test Cases ***
   Nombre Del Test
       Keyword Del Flow
   ```

#### ➕ Agregar Nuevas Variables
- **Globales**: Agregar a `resources/variables/globales.robot`
- **Específicas**: Crear nuevo archivo en `resources/variables/`
- **Por ambiente**: Usar archivos .env en `configs/`

---

## 📦 Dependencias Principales

### Core del Framework
- **robotframework** (7.3.2) - Framework base de automatización
- **robotframework-seleniumlibrary** (6.8.0) - Automatización web con Selenium
- **selenium** (4.38.0) - WebDriver para control de navegadores

### Testing y Validación
- **robotframework-requests** (0.9.7) - Cliente HTTP para pruebas de API
- **robotframework-jsonlibrary** (0.5) - Validación y manipulación de JSON

### Utilidades y Configuración
- **webdriver-manager** (4.0.2) - Gestión automática de drivers de navegador
- **python-dotenv** (1.2.1) - Carga de variables de entorno desde archivos .env

### Configuración de Navegador
- **Chrome en modo incógnito** - Evita popups de contraseñas y cookies
- **Argumentos optimizados** - Supresión de notificaciones y extensiones
- **Captura automática** - Screenshots en fallos para debugging

---

## 🤖 Notas Importantes para GitHub Copilot

### Principios Arquitectónicos OBLIGATORIOS
1. **Mantener arquitectura modular** - Cada capa tiene un propósito específico
2. **Usar las capas correctas** - Pages para UI, Flows para negocio, Keywords para utilidades
3. **NO duplicar lógica** - Reutilizar keywords existentes antes de crear nuevos
4. **Seguir convenciones** - Nombres consistentes, estructura de archivos estándar

### Decisiones de Diseño Críticas
- **Page Objects**: Solo elementos UI y acciones básicas
- **Flows**: Lógica de negocio que combine múltiples páginas
- **Suite Setup/Teardown**: Un navegador compartido por suite para eficiencia
- **Modo incógnito**: Configuración obligatoria para evitar popups
- **Imports**: Siempre usar Resource, nunca Library directo en tests

### Patrones a Mantener
- Variables centralizadas en `globales.robot`
- Keywords de navegador en `Navegador.robot`
- Capturas manuales con nombres descriptivos
- Documentation en todos los keywords importantes
- Tags en tests para categorización

### Anti-patrones a Evitar
- ❌ Lógica de negocio en Page Objects
- ❌ Selectores hardcodeados en flows o tests
- ❌ Keywords duplicados entre archivos
- ❌ Tests sin Suite Setup/Teardown
- ❌ Imports circulares entre resources

---

## 📋 Estado de Evolución

**Versión Actual**: 1.0.0 (Funcionalidad base completa)  
**Próxima Versión**: 1.1.0 (Mejoras en capturas y documentación)

Este archivo `PROJECT_CONTEXT.md` se actualizará continuamente a medida que el framework evolucione, agregando nuevas funcionalidades, patterns y convenciones. Sirve como la **fuente única de verdad** para mantener coherencia arquitectónica en el proyecto.

---

**Última actualización**: Diciembre 2, 2025  
**Mantenido por**: Equipo de QA Automation  
**Versión del documento**: 1.0