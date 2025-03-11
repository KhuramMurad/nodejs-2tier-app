# Node.js 2-Tier Application with MongoDB on Kubernetes

## 📌 Overview
This is a 2-tier application built with **Node.js (backend), MongoDB (database), and Kubernetes** for deployment.  
It is containerized using **Docker** and can be deployed using **Docker Compose** or **Kubernetes**.  
The next step is to deploy it on **AWS EKS (Elastic Kubernetes Service)**.

---

## 🏗️ Architecture
- **Frontend:** JavaScript (or client requests via API)
- **Backend:** Node.js + Express.js
- **Database:** MongoDB
- **Containerization:** Docker
- **Orchestration:** Kubernetes (Minikube → AWS EKS)

---

## 🚀 Deployment Steps

### **1️⃣ Deployment using Docker Compose (Local)**

#### **Prerequisites:**
- Docker
- Docker Compose

#### **Steps:**

1️⃣ **Clone the repository**
```bash
git clone https://github.com/khurammurad/nodejs-2tier-app.git
cd nodejs-2tier-app
```

2️⃣ **Start the application**
```bash
docker-compose up -d
```

3️⃣ **Verify Running Containers**
```bash
docker ps
```

4️⃣ **Access the Application**
- Open **[http://localhost](http://localhost)** in your browser.

5️⃣ **Stop the application**
```bash
docker-compose down
```

---

### **2️⃣ Local Deployment using Kubernetes (Minikube)**

#### **Prerequisites:**
- Docker
- Minikube
- kubectl

#### **Steps:**

1️⃣ **Start Minikube**
```bash
minikube start
```

2️⃣ **Apply Kubernetes manifests**
```bash
kubectl apply -f k8s/
```

3️⃣ **Verify Running Pods & Services**
```bash
kubectl get pods
kubectl get services
```

4️⃣ **Access the Application**
- Get the NodePort using:
```bash
minikube service list
```
- Open the service URL in your browser.

---

### **3️⃣ Deployment on AWS EKS (Upcoming)**
**Planned Steps:**
✅ Create an **AWS EKS Cluster**  
✅ Deploy the application using **Kubernetes manifests**  
✅ Configure **Ingress and Load Balancer**  
✅ Implement **CI/CD with GitHub Actions**  

---

## 📁 Project Structure
```bash
nodejs-2tier-app/
│── k8s/                  # Kubernetes manifests
│   ├── mongo-statefulset.yaml
│   ├── backend-deployment.yaml
│   ├── frontend-deployment.yaml
│   ├── service.yaml
│── src/                  # Node.js application
│── Dockerfile            # Dockerfile for backend
│── docker-compose.yaml   # Local Docker Compose setup
│── README.md             # Project documentation
```

---

## 📸 Screenshot

![Screenshot from 2025-03-11 09-26-10](https://github.com/user-attachments/assets/7cd3870d-8cca-44d2-9e3f-e882a4ffe919)


---

## 📌 Next Steps
✅ **Push this project to GitHub**  
✅ **Deploy to AWS EKS**  
✅ **Implement CI/CD with GitHub Actions**  
✅ **Improve logging & monitoring with Prometheus & Grafana**  

---

## 🤝 Contributing
Feel free to **fork** this repo and submit a **pull request** if you have any improvements!

---

## 🔗 Contact
🌐 **GitHub:** [github.com/khurammurad](https://github.com/khurammurad)  
🚀 **LinkedIn:** [linkedin.com/in/KhuramMurad](https://linkedin.com/in/KhuramMurad)  

---

## 📜 License
This project is open-source under the **MIT License**.
```
