# E-Commerce Project For Baby Tools
A samll project with basic CRUD operatiosn.

## Table of Contents

1. [Prerequisites](#prerequisites)
1. [Hints](#hints)
1. [Photos](#photos)
1. [Usage](#usage)
  - [Install Venv and Project](#install-venv-and-project)
  - [Run Docker](#run-docker)
  - [Edit container](#edit-container)
  - [How to connect](#how-to-connect)


### Prerequisites

- Python 3.9
- Django 4.0.2
- Venv

---

### Hints
py
This section will cover some hot tips when trying to interacting with this repository:

- Settings & Configuration for Django can be found in `babyshop_app/babyshop/settings.py`
- Routing: Routing information, such as available routes can be found from any `urls.py` file in `babyshop_app` and corresponding subdirectories

---

### Photos

##### Home Page with login

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg"></img>
##### Home Page with filter
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg"></img>
##### Product Detail Page
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg"></img>

##### Home Page with no login
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg"></img>


##### Register Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg"></img>


##### Login Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg"></img>

---

## Install Venv and Project
> [!Note]
> local

#### Open in your Terminal/Powershell and got to your project folder and insert the folowing prompt:
```powershell
python -m venv venv
```

#### Then start your venv.
Windows:
```powershell
.\venv\Scripts\activate
```
Mac / Linux:
```powershell
source ./venv/bin/activate
```
> [!Note]
> Check the path for yourself.

#### Copy now the project withs HTTPS or SSH in your Folder.
```powershell
git clone <the key>
```

#### Install now the requirements:
```powershell
pip install -r </path/to>/requirements.txt
```

#### With this prompt you can start the applicaltion and check it out:
```powershell
python manage.py runserver
```
> [!Note]
> You need to be in the folder with your manage.py for this prompt.

---

## Create Docker file

#### if Docker is not yet installed.
```powershell
sudo apt update
sudo apt upgrade
sudo apt install docker.io
```

#### Create a file named `Dockerfile` at the same level as the `.gitignore`.

- The file should look like this:

```powershell
# 1. Base image
FROM python:3.10-alpine

# 2. Useful Python defaults
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 3. Working directory (project root)
WORKDIR /app

# 4. Copy only requirements first – keeps the cache valid
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
COPY . $WORKDIR

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

- Also check your `.dockerignore` if the file fit your requirements.

--- 

## Run Docker
- If you want to save files (optional) 
```powershell
docker volume create <folder_name>
```

- Run container on server
```powershell
docker run -p ${APP_PORT}:${APP_PORT} \
  -e DJANGO_SUPERUSER_USERNAME=${ADMIN_NAME} \
  -e DJANGO_SUPERUSER_PASSWORD=${ADMIN_PASSWORD} \
  -e DJANGO_SUPERUSER_EMAIL=${ADMIN_EMAIL} \
  babyshop
```

---

## Edit container

#### create volume
```powershell
docker volume create babyshop_db
```
#### create
```powershell
docker volume create <volume-name>
```

#### shows all volumes
```powershell
docker volume ls
```

#### delete one or more
```powershell
docker volume rm <volume-name>
```

---

## How to connect

#### Go to your browser and search for `<server-ip>:<port>`.