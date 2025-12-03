# Guía de Contribución – Robot Framework Project

Bienvenido al proyecto de automatización con Robot Framework. Esta guía te ayudará a contribuir de manera efectiva siguiendo nuestros estándares arquitectónicos y buenas prácticas establecidas.

## 📋 Requisitos Previos

### Entorno de Desarrollo
- **Python**: Versión 3.8 o superior (recomendado 3.11+)
- **pip**: Gestor de paquetes de Python actualizado
- **Git**: Para control de versiones
- **VS Code**: Editor recomendado con extensiones de Robot Framework

### Navegador y Drivers
- **Google Chrome**: Versión actualizada
- **ChromeDriver**: Gestionado automáticamente por webdriver-manager
- No es necesario descargar drivers manualmente

### Instalación de Dependencias
```bash
# Clonar el repositorio
git clone https://github.com/fguzman01/robot-framework-base.git
cd robot-framework-base

# Crear entorno virtual (recomendado)
python -m venv venv
venv\Scripts\activate  # Windows
source venv/bin/activate  # macOS/Linux

# Instalar dependencias principales
pip install robotframework==7.3.2
pip install robotframework-seleniumlibrary==6.8.0
pip install robotframework-requests==0.9.7
pip install robotframework-jsonlibrary==0.5
pip install webdriver-manager==4.0.2
pip install python-dotenv==1.2.1

# Verificar instalación
robot --version
```

---

## 🔄 Flujo de Trabajo General para Contribuir

### 1. Preparar el Entorno
```bash
# Clonar y configurar
git clone https://github.com/fguzman01/robot-framework-base.git
cd robot-framework-base
git checkout main
git pull origin main
```

### 2. Crear Branch por Feature
**Convención de nombres de branches**:
- `feature/nombre-descriptivo` - Nueva funcionalidad
- `fix/descripcion-del-bug` - Corrección de errores  
- `chore/tarea-administrativa` - Tareas de mantenimiento
- `docs/actualizar-documentacion` - Cambios en documentación

```bash
# Ejemplos de branches correctos
git checkout -b feature/checkout-flow
git checkout -b fix/login-page-selectors
git checkout -b chore/update-chrome-options
```

### 3. Desarrollo y Testing
- Seguir la arquitectura definida en `PROJECT_CONTEXT.md`
- Ejecutar tests frecuentemente para validar cambios
- Mantener coherencia con convenciones existentes
- Agregar documentación cuando sea necesario

### 4. Commits con Mensajes Claros
Usar **Conventional Commits** (ver sección específica abajo)

### 5. Pull Requests
- **PRs pequeñas**: Máximo 300-500 líneas de cambio
- **Descripción clara**: Qué cambios, por qué, cómo probar
- **Tests incluidos**: Validar que funcionalidad nueva tiene tests
- **Sin conflictos**: Resolver merge conflicts antes del PR

### 6. Revisión y Merge
- Al menos una revisión antes de merge
- Tests automatizados deben pasar
- Mantener historial limpio con squash cuando sea apropiado

---

## 🏗️ Reglas para la Estructura del Código

### ❌ Prohibiciones Estrictas
- **NO mezclar Pages con Flows**: Pages solo elementos UI, Flows solo lógica de negocio
- **NO lógica de negocio en tests**: Tests deben ser declarativos, usar keywords de flows
- **NO duplicar keywords**: Reutilizar existentes o refactorizar para compartir
- **NO selectores hardcodeados**: Centralizar en variables de páginas
- **NO imports circulares**: Mantener jerarquía clara de dependencias

### ✅ Cuándo Crear Nuevos Componentes

#### Crear Nueva Página (`/resources/pages/`)
**Cuándo**: Nueva página web que no existe en el proyecto
**Contenido**: Solo selectores y acciones básicas de UI
```robotframework
# Ejemplo: ProductPage.resource
*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/globales.robot

*** Variables ***
${PRODUCT_TITLE}        css=.inventory_item_name
${ADD_TO_CART_BUTTON}   css=.btn_inventory

*** Keywords ***
Verificar Producto Visible
    Wait Until Element Is Visible    ${PRODUCT_TITLE}

Agregar Producto Al Carrito
    Click Button    ${ADD_TO_CART_BUTTON}
```

#### Crear Nuevo Flow (`/resources/flows/`)
**Cuándo**: Nueva funcionalidad de negocio que combine múltiples páginas
**Contenido**: Lógica de negocio completa, navegación entre páginas
```robotframework
# Ejemplo: CheckoutFlow.robot
*** Keywords ***
Completar Proceso De Compra
    [Arguments]    ${producto}    ${datos_cliente}
    Navegar A Productos
    Seleccionar Producto    ${producto}
    Agregar Al Carrito
    Proceder Al Checkout
    Ingresar Datos Cliente    ${datos_cliente}
    Confirmar Compra
    Validar Compra Exitosa
```

#### Crear Keywords Utilitarios (`/resources/keywords/`)
**Cuándo**: Funcionalidad técnica transversal no específica de páginas
**Ejemplos**: Manejo de datos, configuración, utilidades de debugging

#### Crear Variables (`/resources/variables/`)
**Cuándo**: Constantes que se usan en múltiples archivos
**Contenido**: URLs, timeouts, credenciales, configuraciones

### 📸 Capturas Manuales
- **Dónde colocar**: En flows, después de acciones críticas
- **Cuándo usar**: Para documentar estados importantes del flujo
- **Nomenclatura**: Descriptiva del momento capturado
```robotframework
Completar Login Exitoso
    Realizar Login    ${usuario}    ${password}
    Capturar Pantalla Manual    login_completado.png
    Validar Dashboard Visible
```

---

## 📝 Estándares Específicos del Proyecto

### Nomenclatura de Keywords
- **Idioma**: Español para keywords de negocio
- **Formato**: PascalCase con espacios - `Realizar Login Exitoso`
- **Verbos**: Usar verbos en infinitivo - `Ingresar`, `Validar`, `Completar`
- **Contexto**: Incluir contexto suficiente - `Validar Mensaje De Error`

### Nomenclatura de Variables
- **Formato**: MAYÚSCULAS con guiones bajos
- **Selectores**: Tipo de elemento como sufijo - `${USERNAME_FIELD}`, `${LOGIN_BUTTON}`
- **URLs**: Contexto claro - `${BASE_URL}`, `${API_ENDPOINT}`
- **Datos**: Propósito evidente - `${USUARIO_VALIDO}`, `${TIMEOUT}`

### Organización de Archivos
```
/resources/pages/        → Un archivo por página web
    LoginPage.resource   → Solo elementos y acciones de login
    CartPage.resource    → Solo elementos y acciones de carrito

/resources/flows/        → Un archivo por flujo de negocio  
    LoginFlow.robot      → Flujos completos de autenticación
    CheckoutFlow.robot   → Flujos completos de compra

/resources/keywords/     → Keywords técnicos agrupados
    Navegador.robot      → Manejo de navegador
    DataUtils.robot      → Utilidades de datos

/resources/variables/    → Variables por dominio
    globales.robot       → Variables del proyecto
    test_data.robot      → Datos específicos de pruebas
```

### Tests Limpios y Minimalistas
```robotframework
*** Settings ***
Suite Setup     Abrir Navegador Una Vez
Suite Teardown  Cerrar Navegador
Resource        ../../resources/flows/LoginFlow.robot

*** Test Cases ***
Login Exitoso Con Credenciales Válidas
    [Tags]    smoke    login    positive
    Realizar Login Exitoso    ${USUARIO_VALIDO}    ${PASSWORD_VALIDA}

Login Fallido Con Usuario Inválido  
    [Tags]    login    negative
    Realizar Login Fallido    usuario_inexistente    ${PASSWORD_VALIDA}    Username and password do not match
```

---

## 🚀 Estilo de Commits (Conventional Commits)

Usar el formato: `tipo(alcance): descripción`

### Tipos de Commits
- **feat**: Nueva funcionalidad
- **fix**: Corrección de bug
- **refactor**: Cambio de código sin afectar funcionalidad
- **style**: Cambios de formato (espacios, indentación)
- **docs**: Cambios en documentación
- **chore**: Tareas administrativas (configuración, dependencias)
- **test**: Agregar o modificar tests

### Ejemplos de Commits Correctos
```bash
# Nuevas funcionalidades
feat: agregar flujo de compra completo con validaciones
feat(checkout): implementar página de resumen de pedido
feat(api): agregar keywords para pruebas de API REST

# Correcciones
fix: corregir selector de botón login en LoginPage
fix(inventory): resolver problema de carga lenta de productos  
fix(navegador): eliminar popup de contraseñas en Chrome

# Refactoring
refactor: extraer keywords comunes a archivo utils
refactor(flows): simplificar flujo de registro de usuario

# Documentación
docs: actualizar README con nuevas instrucciones de instalación
docs(api): agregar ejemplos de uso de RequestsLibrary

# Tareas administrativas
chore: actualizar configuración de Chrome a versión 120
chore(deps): actualizar robotframework a versión 7.3.2
chore: agregar .gitignore para archivos temporales
```

### Ejemplos de Commits Incorrectos ❌
```bash
# Muy genéricos
git commit -m "arreglos varios"
git commit -m "update"

# Sin contexto
git commit -m "fix bug" 

# Muy largos o confusos
git commit -m "feat: agregar nueva página de productos con selectores CSS optimizados y keywords para navegación, búsqueda, filtrado, ordenamiento y validación de elementos de UI incluyendo imágenes, títulos, precios y botones de acción"
```

---

## ✨ Buenas Prácticas Recomendadas

### Coherencia Arquitectónica
- **Consultar PROJECT_CONTEXT.md** antes de hacer cambios arquitectónicos
- **Mantener separación de capas** según el patrón establecido
- **Reutilizar antes que crear** - revisar keywords existentes
- **Seguir convenciones** de nomenclatura y organización

### Desarrollo Eficiente
- **Keywords cortos y específicos** - una responsabilidad por keyword
- **Evitar lógica compleja** en keywords básicos de páginas
- **Documentar keywords complejos** con `[Documentation]`
- **Usar argumentos descriptivos** - `${usuario}` mejor que `${user}`

### Testing y Validación
- **Ejecutar tests antes de commit** para evitar romper funcionalidad
- **Revisar reportes nativos** (log.html, report.html) antes de agregar más tests
- **Mantener independencia entre tests** - no depender del orden de ejecución
- **Usar tags apropiadas** para categorización y filtrado

### Mantenimiento del Código
- **DRY (Don't Repeat Yourself)** - refactorizar código duplicado
- **KISS (Keep It Simple, Stupid)** - soluciones simples y claras
- **Single Responsibility** - cada keyword/archivo con propósito único
- **Fail Fast** - validaciones tempranas para detectar problemas rápido

---

## 🧪 Cómo Ejecutar los Tests Correctamente

### Ejecutar Suite Completa
```bash
# Todos los tests del proyecto
robot tests/

# Con directorio de salida específico
robot --outputdir results tests/
```

### Ejecutar Suite Específica
```bash
# Solo tests de login
robot tests/login/

# Test específico por nombre
robot --test "Login Exitoso" tests/login/login_tests.robot

# Tests por tag
robot --include smoke tests/
robot --include "login AND positive" tests/
```

### Ejecutar con Reportes y Screenshots
```bash
# Con configuración completa
robot --outputdir results --loglevel DEBUG tests/login/

# Con timestamp en archivos
robot --timestampoutputs --outputdir results tests/

# Solo modo dry-run para validar sintaxis
robot --dryrun tests/
```

### Configuraciones Útiles para Desarrollo
```bash
# Ejecutar con pausa en fallos para debugging
robot --listener DebugLibrary tests/

# Ejecutar con variables específicas  
robot --variable BROWSER:firefox tests/

# Ejecutar con timeout customizado
robot --variable TIMEOUT:30s tests/
```

### Validar Cambios Localmente
```bash
# Validar sintaxis sin ejecutar
robot --dryrun tests/

# Ejecutar solo tests afectados por cambios
robot --include affected tests/

# Ejecutar con máximo detalle para debugging
robot --loglevel TRACE --outputdir debug_results tests/
```

---

## 🔧 Mantención del Proyecto

### Documentación Viva
- **Actualizar PROJECT_CONTEXT.md** si hay cambios arquitectónicos significativos
- **Documentar decisiones** de diseño importantes en comentarios o docs
- **Mantener README.md actualizado** con instrucciones de instalación y uso

### Control de Versiones
- **Actualizar CHANGELOG.md** en cada release con cambios notables
- **Usar tags semánticos** para releases (v1.0.0, v1.1.0, etc.)
- **Mantener historial limpio** con commits atómicos y descriptivos

### Calidad del Código
- **Revisar consistencia** en cada PR antes de merge
- **Refactorizar código obsoleto** cuando sea necesario
- **Eliminar código muerto** y archivos no utilizados
- **Mantener dependencias actualizadas** de forma controlada

### Contribuciones Consistentes
- **Seguir esta guía religiosamente** en cada contribución
- **Pedir revisión** cuando no estés seguro de la arquitectura
- **Comunicar cambios grandes** antes de implementar
- **Mantener compatibilidad hacia atrás** cuando sea posible

---

## 🎯 Checklist Antes de Enviar PR

- [ ] ✅ Código sigue la arquitectura de PROJECT_CONTEXT.md
- [ ] ✅ Nombres de keywords y variables siguen convenciones
- [ ] ✅ No hay lógica duplicada o código muerto
- [ ] ✅ Tests existentes siguen funcionando
- [ ] ✅ Nuevos tests incluidos si es funcionalidad nueva
- [ ] ✅ Commits siguen Conventional Commits
- [ ] ✅ Documentación actualizada si es necesario
- [ ] ✅ CHANGELOG.md actualizado para cambios notables
- [ ] ✅ Branch actualizado con main antes de PR

---

**¡Gracias por contribuir al proyecto!** 🚀

Tu adherencia a estas guías ayuda a mantener un código base limpio, escalable y mantenible para todo el equipo.

---

**Última actualización**: Diciembre 2, 2025  
**Versión de la guía**: 1.0  
**Mantenido por**: Equipo de QA Automation