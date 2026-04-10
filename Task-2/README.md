# Task 2: Docker Installation and Application Deployment

## 📌 Objective

To install Docker on a RHEL server, containerize a web application, and deploy it so it is accessible through a browser.

---

## ⚙️ Requirements

* RHEL-based Linux server
* User with sudo privileges (wheel group)
* Basic knowledge of Linux and Docker commands
* Network access to the server

---

## 🛠️ Implementation Steps

### 0. Ensure user has sudo privileges
Check if user has sudo access

```bash
sudo whoami 
```

Expected output:root

✔ If this works → user already has sudo privileges

If sudo is not available, grant sudo access (run as root)

Switch to root user:

```bash
su - 
```

Add user to the wheel group:

```bash
usermod -aG wheel mangesh
```

```bash
newgrp docker
```
 

### 1. Install Docker

```bash
sudo dnf install docker -y
```

---

### 2. Start and enable Docker service

```bash
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
```

Expected:

```bash
active (running)
```

---

### 3. Add user to Docker group

```bash
sudo usermod -aG docker mangesh
newgrp docker
```

---

### 4. Verify Docker installation

```bash
docker run hello-world
```

✔ Successful output confirms Docker is working

---

### 5. Create project directory

```bash
mkdir docker-app
cd docker-app
```

---

### 6. Create index.html file and paste the following code. 

```bash
nano index.html
```
```bash
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docker Deployment</title>
</head>
<body style="margin:0; padding:0; background-color:#f4f6f9; font-family:Arial, sans-serif; display:flex; justify-content:center; align-items:center; height:100vh;">

    <div style="background:#ffffff; padding:40px; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.1); text-align:center; width:90%; max-width:500px;">
        
        <h1 style="color:#2c3e50; margin-bottom:20px;">
            🚀 Successfully Deployed in Docker
        </h1>
        
        <p style="color:#555; font-size:16px; margin-bottom:15px;">
            This application is now running inside a Docker container.
        </p>
        
        <p style="color:#333; font-size:15px; background:#eef2ff; padding:10px; border-radius:6px;">
            📌 Task Submission: This deployment demonstrates successful containerization and execution of the application using Docker.
        </p>

        <p style="margin-top:20px; font-size:12px; color:#888;">
            Deployment Status: Active & Running
        </p>

    </div>

</body>
</html>
```

---

### 7. Create Dockerfile

```bash
nano Dockerfile
```

Add the following:

```Dockerfile
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
```

---

### 8. Build Docker image

```bash
docker build -t my-web-app .
```

---

### 9. Run Docker container

```bash
docker run -d -p 8000:80 my-web-app
```

---

### 10. Configure firewall to allow port 8000

```bash
sudo firewall-cmd --add-port=8000/tcp --permanent
sudo firewall-cmd --reload
```

---

### 11. Access application

Get server IP:

```bash
ip a
```

Open in browser:

```
http://<server-ip>:8000
```

---

## ✅ Expected Outcome

* Docker successfully installed and configured
* Web application containerized using Docker
* Container running successfully
* Application accessible through browser on port 8000

---

## 📁 Files Used

* Dockerfile
* index.html

---

## 🧠 Conclusion

Successfully installed Docker on a RHEL server, built a custom Docker image, and deployed a containerized web application accessible via port 8000.
