# Node.js 2-Tier Application with MongoDB and Kubernetes

## Overview
This project is a **2-tier web application** built with **Node.js** and **MongoDB**, containerized using **Docker**, and deployed on **Kubernetes (Minikube)**. The application consists of:
- **Frontend**: Serves the user interface (React, HTML, or a simple Node.js app).
- **Backend**: Handles API requests and interacts with MongoDB.
- **Database**: MongoDB for storing application data.

## Features
- **REST API** built with Express.js.
- **MongoDB** database integration.
- **Dockerized** application using Docker Compose.
- **Kubernetes Deployment** for production-like orchestration.
- **Minikube** setup for local Kubernetes testing.

## Technologies Used
- **Node.js** (Backend API)
- **Express.js** (Web Framework)
- **MongoDB** (Database)
- **Docker & Docker Compose** (Containerization)
- **Kubernetes & Minikube** (Orchestration)

---

## Architecture
```plaintext
┌──────────────┐    ┌──────────────┐    ┌───────────┐
│  Frontend    │──▶ │  Backend     │──▶ │  MongoDB  │
│ (React/HTML) │    │ (Node.js API)│    │ Database  │
└──────────────┘    └──────────────┘    └───────────┘
```

---

## Getting Started
### 1️⃣ Clone the Repository
```bash
git clone https://github.com/khurammurad/nodejs-2tier-app.git
cd nodejs-2tier-app
```

### 2️⃣ Run Locally using Docker Compose
Ensure Docker is installed and running:
```bash
docker-compose up -d
```
Access the application at:
- **Backend API**: `http://localhost:5000`
- **MongoDB**: `mongodb://mongo:27017/testdb`

To stop the application:
```bash
docker-compose down
```

---

## Kubernetes Deployment
### 1️⃣ Start Minikube
```bash
minikube start
```

### 2️⃣ Deploy Application to Kubernetes
```bash
kubectl apply -f k8s/
```
Check if pods are running:
```bash
kubectl get pods
```

### 3️⃣ Access Application on Minikube
Find the NodePort:
```bash
kubectl get services
```
Example output:
```plaintext
backend   NodePort    10.96.1.12    <none>        5000:31895/TCP
```
Now, access the application using Minikube's IP:
```bash
minikube ip
```
Example:
```
http://192.168.49.2:31895
```

---

## Project Files
### **Docker Setup**
- `Dockerfile.backend`: Builds the backend container.
- `Dockerfile.frontend`: Builds the frontend container.
- `docker-compose.yml`: Defines multi-container setup.

### **Kubernetes Manifests**
- `k8s/backend-deployment.yaml`: Deploys backend on Kubernetes.
- `k8s/mongo-deployment.yaml`: Deploys MongoDB on Kubernetes.
- `k8s/backend-service.yaml`: Exposes backend service.

---

## Future Enhancements
- Add **frontend UI** integration.
- Implement **CI/CD pipeline** with GitHub Actions.
- Migrate to **AWS EKS** or **Azure AKS** for cloud deployment.

---

## Author
Developed by **Khuram Murad**.

Feel free to contribute or report issues!

---

## License
This project is open-source and available under the **MIT License**.


