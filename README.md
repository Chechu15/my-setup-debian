# my-setup-debian
Post Instalation

# Automatización de instalación de programas en un equipo nuevo

Este script sirve para no tener que configurar mis PCs de forma manual cuando vaya a utilizar el SO de Debian. Puedes cogerlo de ejemplo para que se adapte a tu uso de trabajo.

## Instalación y Ejecución

Sigue estos pasos para ejecutar el script:

### 1. Instalar Git

```bash
sudo apt install git -y
```
### 2. Clonar el repositorio

```bash
git clone https://github.com/Chechu15/my-setup-fedora.git
```

### 3. Entrar en la Carpeta del Proyecto

```bash
cd my-setup-fedora
```
### 4. Dar Permisos de Ejecución al Script

```bash
sudo chmod +x instalacion_programas.sh
```
### 5. Ejecutar el Script con permisos de superusuario

```bash
sudo ./instalacion_programas.sh
```

