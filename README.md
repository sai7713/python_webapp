# Docker Application Setup

A small web app that runs inside Docker. This guide shows how to build the
Docker image and run the app locally.

All commands below are written for **bash**.

---

## Prerequisites

### 1. Install Docker

Make sure Docker is installed on your machine.

### 2. Start Docker

Launch Docker Desktop and ensure the Docker engine is running.

### 3. Login to Docker Hub (optional)

Open a terminal and run:

```bash
docker login
```

You will be prompted to enter your **Docker Hub username** and **password**.

> **Note:** You only need to log in if you plan to push images to Docker Hub.

---

## 🚀 Quick Start

### 0. Prepare the working folder

Make sure the following files are together in the same folder before running
the Docker commands:

- `Dockerfile`
- `requirements.txt`
- `main.py`

If they are in different locations, copy them into one directory and run the
commands below from there.

### 1. Build the Docker image

Run the following command in the project directory:

```bash
docker build -t testing .
```

This builds a Docker image using the `Dockerfile` in the current directory and
tags it as **testing**.

### 2. Push the image to Docker Hub (optional)

If you want to share the image or deploy it from another machine, push it to
Docker Hub.

1. Tag the image for your Docker Hub repository (replace `YOUR_USERNAME`):

```bash
docker tag testing YOUR_USERNAME/testing:latest
```

2. Push the image:

```bash
docker push YOUR_USERNAME/testing:latest
```

> Make sure you ran `docker login` first (see “Login to Docker Hub”).

---

### 3. Run the container

Start the container using:

```bash
docker run -d -p 8080:5000 testing
```

Explanation:

- `-d` runs the container in **detached mode**
- `-p 8080:5000` maps **port 8080 on your machine** to **port 5000 inside the
  container**

> **Note:** On some macOS setups, port `5000` can already be in use. Mapping to
> `8080` avoids port conflicts.

### 3. Verify the application

Open your browser and visit:

- http://localhost:8080
- http://localhost:8080/inventory

If everything is working correctly, the application should load in your
browser.

---

## Useful Docker commands

Check running containers:

```bash
docker ps
```

Check all containers (including stopped ones):

```bash
docker ps -a
```

Stop a running container:

```bash
docker stop <container-id>
```

Remove a container:

```bash
docker rm <container-id>
```
