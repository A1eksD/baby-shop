# E-Commerce Project For Baby Tools
A small project with basic CRUD operations. In this application you can create baby-product listings and sort them in the admin area. The app was built with Django, which is based on Python and lets you spin up the project quickly.

## Table of Contents

1. [Prerequisites](#prerequisites)
1. [Hints](#hints)
1. [Quickstart](#quickstart)
  - [Download Repository](#download-repository)
1. [Usage Docker](#usage-docker)
  - [Install Docker](#install-docker)
  - [Create Dockerfile](#create-dockerfile)
  - [Build Docker Image](#build-docker-image)
  - [Start Docker Image](#start-docker-image)
  - [How to connect](#how-to-connect)
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

1. Download Repository
```powershell
git clone https://github.com/A1eksD/baby-shop
```

2. Create Python Venv
```powershell
python -m venv venv
```

3. Activate Python Venv
Windows:
```powershell
.\venv\Scripts\activate
```
Mac / Linux:
```powershell
source ./venv/bin/activate
```
> [!Note]
> Replace the path to the Python Virtual Environment ro match yours.

4. Install Requirements
```powershell
pip install -r </path/to>/requirements.txt
```

5. Install Database
```powershell
python manage.py makemigrations
python manage.py migrate
```
> [!Note]
> You need to be in the folder with your manage.py for this prompt.

6. Start the application
```powershell
python manage.py runserver
```
> [!Note]
> You need to be in the folder with your manage.py for this prompt.

---

## Usage Docker

### Install Docker
(If Docker is not yet installed)
```powershell
sudo apt update
sudo apt upgrade
sudo apt install docker.io
```

### Create Dockerfile

Create Docker file named `Dockerfile` at the same level as the `.gitignore`.

### Build Docker Image
- Fill the file with the following information:

```powershell
# 1. Base image
FROM python:3.9-alpine

# 2. Useful Python defaults
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 3. Working directory (project root)
WORKDIR /app

# 4. Copy only requirements first – keeps the cache valid
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
COPY . ${WORKDIR}

# 6. Expose port 8082
EXPOSE ${APP_PORT}

# 7. Declare a persistent volume
#    /app/data - save in host-sytem
VOLUME /app/data
#    /app/data/media - place to save Uploads/SQLite files
ENV MEDIA_ROOT=/app/data/media

# 8. On container start:
#    • Create and apply migrations
#    • Create / update the Django super-user
#    • Launch the Django development server on port 8082
#      (Use Gunicorn/Uvicorn instead of runserver for production)
CMD ["sh", "-c", "python babyshop_app/manage.py makemigrations --noinput && \
                  python babyshop_app/manage.py migrate --noinput && \
                  python babyshop_app/manage.py createsuperuser --noinput \
                        --username ${DJANGO_SUPERUSER_USERNAME} \
                        --email ${DJANGO_SUPERUSER_EMAIL} || true && \
                  python babyshop_app/manage.py runserver 0.0.0.0:${APP_PORT}"]

```

> [!Note]
> Also check whether you need/want to have a `.dockerignore` file. Place it at the same level as the `Dockerfile`. If you're not sure whether you need one, you can use this template: https://github.com/A1eksD/baby-shop/blob/main/.dockerignore

--- 

### Start Docker Image
1. Create Docker Volume (optional) 
```powershell
docker volume create <volume_name>
```

2. Create Docker Image
```powershell
docker build -t babyshop:latest --build-arg APP_PORT=${APP_PORT} .
```

3. Run container on server
```powershell
docker run -p ${APP_PORT}:${APP_PORT} \
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

### Useful commands

Shows all volumes
```powershell
docker volume ls
```

Delete one or more
```powershell
docker volume rm <volume-name>
```
