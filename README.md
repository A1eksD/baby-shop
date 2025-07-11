# E-Commerce Project For Baby Tools
A small project with basic CRUD operations. In this application you can create baby-product listings and sort them in the admin area. The app was built with Django, which is based on Python and lets you spin up the project quickly.

## Table of Contents

1. [Prerequisites](#prerequisites)
1. [Hints](#hints)
1. [Quickstart](#quickstart)
1. [Quick usage](#quick-usage)
1. [Usage Docker](#usage-docker)
1. [Photos](#photos)
1. [Useful commands](#useful-commands)


## Prerequisites

- Python 3.9
- Django 4.0.2
- Venv
- Docker
- git

---

## Hints
This section will cover some hot tips when trying to interacting with this repository:

- Settings & Configuration for Django can be found in `babyshop_app/babyshop/settings.py`
- Routing information, such as available routes can be found from any `urls.py` file in `babyshop_app` and corresponding subdirectories

---

## Quickstart

### Quick usage

1. Download Repository
```powershell
git clone https://github.com/A1eksD/baby-shop
```

2. Move than to the baby-shop folder
```powershell
cd baby-shop
```

3. Create Python Venv
```powershell
python -m venv venv
```

4. Activate Python Venv
Windows:
```powershell
.\venv\Scripts\activate
```
Mac / Linux:
```powershell
source ./venv/bin/activate
```

5. Install Requirements
```powershell
pip install -r </path/to>/requirements.txt
```

6. Install Database
```powershell
python manage.py makemigrations
python manage.py migrate
```

7. Start the application
```powershell
python manage.py runserver
```
> [!Note]
> Replace all paths to the Python Virtual Environment to match yours.
> Commands should always be run from the same folder where `manage.py` file exists.

---

## Usage Docker

### Install Docker
(If Docker is not yet installed)
```powershell
sudo apt update
sudo apt upgrade
sudo apt install docker.io
```

---

### Create Dockerfile
You can use the existing `Dockerfile`.

---

### Build Docker Image

Create Docker Image
```powershell
docker build --build-arg APP_PORT=${CONTAINER_PORT} -t babyshop .
```

--- 

### Start Docker Container

Run container on server
```powershell
docker run -p ${PORT}:${APP_PORT} \
  -e DJANGO_SUPERUSER_USERNAME=${ADMIN_NAME} \
  -e DJANGO_SUPERUSER_PASSWORD=${ADMIN_PASSWORD} \
  -e DJANGO_SUPERUSER_EMAIL=${ADMIN_EMAIL} \
  babyshop
```

---

### How to connect

Search in your browser for `<server-ip>:<port>`.

---

## Photos

### Home Page with login
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg"></img>

### Home Page with filter
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg"></img>

### Product Detail Page
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg"></img>

### Home Page with no login
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg"></img>


### Register Page
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg"></img>


### Login Page
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg"></img>

---

## Useful commands

Shows all volumes
```powershell
docker volume ls
```

Delete one or more
```powershell
docker volume rm <volume-name>
```
