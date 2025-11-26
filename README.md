# Robot Framework Testing Project

Este proyecto utiliza Robot Framework para automatización de pruebas, incluyendo pruebas de interfaz web con Selenium y pruebas de API con RequestsLibrary.

## Descripción del Proyecto

Un framework de automatización completo que incluye:
- ✅ Pruebas de interfaz web con **SeleniumLibrary**
- ✅ Pruebas de API REST con **RequestsLibrary**
- ✅ Validación de JSON con **JsonLibrary**
- ✅ Gestión automática de WebDrivers con **webdriver-manager**
- ✅ Variables de entorno con **python-dotenv**
- ✅ Estructura modular con Page Objects y Keywords reutilizables

## Estructura del Proyecto

```
├── tests/                    # Casos de prueba (.robot)
├── resources/
│   ├── pages/               # Page Object Models
│   ├── keywords/            # Keywords personalizadas
│   └── variables/           # Variables globales y por ambiente
├── libraries/               # Bibliotecas Python personalizadas
├── configs/                 # Archivos de configuración (.env, settings)
└── README.md
```

## Project Setup

### Requisitos del Sistema

- **Python 3.8+** (recomendado 3.11+)
- **pip** (gestor de paquetes de Python)
- **Google Chrome** (para pruebas web)
- **Git** (opcional, para control de versiones)

### Dependencias Principales

Las siguientes bibliotecas están incluidas en este proyecto:

| Biblioteca | Versión | Propósito |
|------------|---------|-----------|
| robotframework | 7.3.2 | Framework base para automatización |
| robotframework-seleniumlibrary | 6.8.0 | Automatización de navegadores web |
| robotframework-requests | 0.9.7 | Pruebas de API REST |
| robotframework-jsonlibrary | 0.5 | Validación y manipulación de JSON |
| selenium | 4.38.0 | WebDriver para control de navegadores |
| webdriver-manager | 4.0.2 | Gestión automática de drivers |
| python-dotenv | 1.2.1 | Carga de variables de entorno |

## Installing Dependencies

### 1. Clonar o descargar el proyecto
```bash
git clone <repository-url>
cd robot-framework
```

### 2. Crear un entorno virtual (recomendado)
```bash
python -m venv venv

# En Windows
venv\Scripts\activate

# En macOS/Linux
source venv/bin/activate
```

### 3. Instalar todas las dependencias
```bash
# Instalación paso a paso (como se hizo en este proyecto)
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests
pip install robotframework-jsonlibrary
pip install python-dotenv
pip install webdriver-manager

# O crear un requirements.txt con todas las dependencias
pip freeze > requirements.txt
```

### 4. Verificar instalación
```bash
pip list
robot --version
```

## Running Tests

### Ejecutar todas las pruebas
```bash
robot tests/
```

### Ejecutar un archivo específico
```bash
robot tests/ejemplo_web.robot
```

### Ejecutar con etiquetas específicas
```bash
robot --include api tests/
robot --include web tests/
```

### Generar reportes en directorio específico
```bash
robot --outputdir results tests/
```

### Ejecutar en modo verbose
```bash
robot --loglevel DEBUG tests/
```

## Configuración de Variables de Entorno

Crea un archivo `.env` en la carpeta `configs/` con tus variables:

```env
# configs/.env
BASE_URL=https://example.com
API_URL=https://api.example.com
API_KEY=your-api-key-here
BROWSER=chrome
TIMEOUT=10
ENVIRONMENT=development
```

## Ejemplos de Uso

### Estructura típica de un test
```robot
*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource   ../resources/keywords/common_keywords.robot
Variables  ../resources/variables/environments.robot

*** Test Cases ***
Ejemplo Test Web
    [Tags]    web
    Open Browser    ${BASE_URL}    ${BROWSER}
    Page Should Contain    Welcome
    Close Browser

Ejemplo Test API
    [Tags]    api
    Create Session    api    ${API_URL}
    ${response}=    GET On Session    api    /users
    Status Should Be    200
```

## Mejores Prácticas

1. **Organización**: Mantén los tests, keywords y variables separados
2. **Reutilización**: Crea keywords reutilizables en `resources/keywords/`
3. **Page Objects**: Define elementos de página en `resources/pages/`
4. **Variables**: Centraliza configuraciones en `resources/variables/`
5. **Etiquetas**: Usa tags para categorizar y filtrar tests
6. **Reportes**: Revisa siempre log.html y report.html después de ejecutar

## Soporte y Documentación

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [RequestsLibrary Documentation](https://github.com/MarketSquare/robotframework-requests)

---

**Creado con Robot Framework 7.3.2** 🤖