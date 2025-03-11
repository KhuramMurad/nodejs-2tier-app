```markdown
# Node.js 2-Tier Application with MongoDB on Kubernetes

## Overview
This is a **2-tier application** built with **Node.js (backend), MongoDB (database), and Kubernetes** for deployment.  
It is containerized using Docker and deployed on a **local Minikube cluster**.  
The next step is to deploy it on **AWS EKS (Elastic Kubernetes Service).**

---

## 🏗️ Architecture

- **Frontend:** JavaScript (or client requests via API)
- **Backend:** Node.js + Express.js
- **Database:** MongoDB
- **Containerization:** Docker
- **Orchestration:** Kubernetes (Minikube → AWS EKS)

---

## 🚀 Deployment Steps

### **1. Local Deployment (Minikube)**
#### Prerequisites:
- Docker
- Minikube
- kubectl

#### Steps:
1. **Start Minikube**  
   ```bash
   minikube start
   ```
2. **Apply Kubernetes manifests**  
   ```bash
   kubectl apply -f k8s/
   ```
3. **Verify Running Pods & Services**  
   ```bash
   kubectl get pods
   kubectl get services
   ```
4. **Access the Application**  
   - Get the NodePort using:  
     ```bash
     minikube service list
     ```
   - Open the service URL in your browser.

---

### **2. Deployment on AWS EKS (Upcoming)**
#### Planned Steps:
✅ Create an AWS EKS Cluster  
✅ Deploy the application using Kubernetes manifests  
✅ Configure Ingress and Load Balancer  
✅ Implement CI/CD with GitHub Actions  

---

## 📁 Project Structure

```
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

## 📌 Next Steps
- [ ] Push this project to **GitHub**
- [ ] Deploy to **AWS EKS**
- [ ] Implement **CI/CD with GitHub Actions**
- [ ] Improve logging & monitoring with **Prometheus & Grafana**

---

## 🤝 Contributing
Feel free to fork this repo and submit a **pull request** if you have any improvements!

---

## 🔗 Contact
📧 Email: [khuram.saggu@gmail.com]  
🌐 GitHub: [github.com/khurammurad](https://github.com/khurammurad)  
🚀 LinkedIn: [linkedin.com/in/KhuramMurad](https://linkedin.com/in/KhuramMurad)

---

## 📜 License
This project is open-source under the **MIT License**.
```
