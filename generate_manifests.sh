#!/bin/bash

# Create Kubernetes manifest directory
MANIFEST_DIR="k8s"
mkdir -p "$MANIFEST_DIR"

# MongoDB Deployment YAML
cat <<EOF > "$MANIFEST_DIR/mongo-deployment.yaml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo
  template:
    metadata:
      labels:
        app: mongo
    spec:
      containers:
        - name: mongo
          image: mongo
          ports:
            - containerPort: 27017
          volumeMounts:
            - mountPath: /data/db
              name: mongo-storage
      volumes:
        - name: mongo-storage
          emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: mongo
spec:
  selector:
    app: mongo
  ports:
    - protocol: TCP
      port: 27017
      targetPort: 27017
EOF

echo "✅ Created MongoDB manifest: mongo-deployment.yaml"

# Backend Deployment YAML
cat <<EOF > "$MANIFEST_DIR/backend-deployment.yaml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
        - name: backend
          image: node:18
          command: ["sh", "-c", "npm install && node server.js"]
          workingDir: /app
          ports:
            - containerPort: 5000
          env:
            - name: MONGO_URI
              value: "mongodb://mongo:27017/testdb"
          volumeMounts:
            - name: backend-source
              mountPath: /app
      volumes:
        - name: backend-source
          emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: backend
spec:
  selector:
    app: backend
  ports:
    - protocol: TCP
      port: 5000
      targetPort: 5000
  type: NodePort
EOF

echo "✅ Created Backend manifest: backend-deployment.yaml"

# Frontend Deployment YAML
cat <<EOF > "$MANIFEST_DIR/frontend-deployment.yaml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: frontend
  template:
    metadata:
      labels:
        app: frontend
    spec:
      containers:
        - name: frontend
          image: nginx:alpine
          ports:
            - containerPort: 80
          volumeMounts:
            - name: frontend-source
              mountPath: /usr/share/nginx/html
      volumes:
        - name: frontend-source
          emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: frontend
spec:
  selector:
    app: frontend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort
EOF

echo "✅ Created Frontend manifest: frontend-deployment.yaml"

echo "🎉 All Kubernetes manifests created successfully in the '$MANIFEST_DIR' directory!"

