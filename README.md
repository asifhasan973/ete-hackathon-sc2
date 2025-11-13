# CI/CD Pipeline Demo with Jenkins, Docker, and Docker Compose

A complete CI/CD pipeline demonstration that builds, tests, packages, and deploys a Flask web application using Jenkins, Docker, and Docker Compose.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Running the Pipeline](#running-the-pipeline)
- [Pipeline Stages](#pipeline-stages)
- [Testing](#testing)
- [Docker Setup](#docker-setup)
- [Jenkins Setup](#jenkins-setup)
- [Screenshots](#screenshots)
- [Troubleshooting](#troubleshooting)

## 🎯 Overview

This project demonstrates a complete CI/CD pipeline with the following workflow:

1. **Build** - Install dependencies
2. **Test** - Run unit tests with pytest
3. **Package** - Build Docker image
4. **Deploy** - Deploy using Docker Compose
5. **Health Check** - Verify application is running and healthy

## 🏗️ Architecture

```
┌─────────────┐
│   Jenkins   │
│  (Pipeline) │
└──────┬──────┘
       │
       ├─► Build (Python deps)
       ├─► Test (pytest)
       ├─► Package (Docker build)
       ├─► Deploy (docker-compose)
       └─► Health Check (healthcheck.sh)
              │
              ▼
       ┌─────────────┐
       │  Flask App  │
       │ (Container) │
       │  Port 5000  │
       └─────────────┘
```

## ✨ Features

- ✅ **Declarative Jenkins Pipeline** - Easy to read and maintain
- ✅ **Flask Web Application** - Simple Python app with REST endpoints
- ✅ **Unit Tests** - Automated testing with pytest
- ✅ **Docker Containerization** - Reproducible builds and deployments
- ✅ **Docker Compose Orchestration** - Simple service management
- ✅ **Health Monitoring** - Automated health checks with detailed reporting
- ✅ **Docker-in-Docker** - Run Jenkins inside Docker for complete isolation

## 📁 Project Structure

```
.
├── app/
│   ├── app.py              # Flask application
│   ├── test_app.py         # Unit tests
│   └── requirements.txt    # Python dependencies
├── Dockerfile              # Container image definition
├── docker-compose.yml      # App deployment orchestration
├── docker-compose-jenkins.yml  # Jenkins Docker-in-Docker setup
├── Jenkinsfile            # Declarative CI/CD pipeline
├── healthcheck.sh         # Health verification script
├── setup-jenkins.sh       # Jenkins setup automation
├── .gitignore            # Git ignore patterns
└── README.md             # This file
```

## 🔧 Prerequisites

- Docker Desktop (or Docker Engine + Docker Compose)
- Git (for version control)
- 4GB RAM minimum
- Ports 5000, 8080, 50000 available

### Check Prerequisites

```bash
docker --version
docker-compose --version
git --version
```

## 🚀 Quick Start

### Option 1: Manual Pipeline Execution (Without Jenkins)

This option runs the pipeline steps manually to quickly see the application in action.

```bash
# 1. Clone or navigate to the repository
cd /path/to/test

# 2. Install Python dependencies
pip install -r app/requirements.txt

# 3. Run tests
cd app
pytest test_app.py -v
cd ..

# 4. Build Docker image
docker build -t demo-cicd-app:latest .

# 5. Deploy with Docker Compose
docker-compose up -d

# 6. Run health check
chmod +x healthcheck.sh
./healthcheck.sh

# 7. Test the application
curl http://localhost:5000
curl http://localhost:5000/health

# 8. Stop the application
docker-compose down
```

### Option 2: Full Jenkins Pipeline (Automated)

Run the complete pipeline through Jenkins with Docker-in-Docker.

```bash
# 1. Start Jenkins
chmod +x setup-jenkins.sh
./setup-jenkins.sh

# 2. Access Jenkins at http://localhost:8080
# 3. Follow the setup wizard (see Jenkins Setup section below)
# 4. Create and run pipeline job
```

## 🔄 Running the Pipeline

### Creating a Jenkins Pipeline Job

1. **Access Jenkins**: http://localhost:8080
2. **Click** "New Item"
3. **Enter** job name (e.g., "demo-cicd-pipeline")
4. **Select** "Pipeline" and click OK
5. **Configure Pipeline**:
   - **Definition**: Pipeline script from SCM
   - **SCM**: Git (or select "Pipeline script" and paste Jenkinsfile content)
   - **Repository URL**: `/workspace` (inside Jenkins container)
   - **Script Path**: `Jenkinsfile`
6. **Save** and click "Build Now"

### Manual Pipeline Execution

If running without Jenkins, execute stages manually:

```bash
# Stage 1: Build
pip install -r app/requirements.txt

# Stage 2: Test
cd app && pytest test_app.py -v && cd ..

# Stage 3: Package
docker build -t demo-cicd-app:latest .

# Stage 4: Deploy
docker-compose up -d

# Stage 5: Health Check
chmod +x healthcheck.sh
./healthcheck.sh
```

## 📊 Pipeline Stages

### 1. Checkout

- Checks out source code from repository
- Displays workspace contents

### 2. Build

- Installs Python dependencies from `requirements.txt`
- Prepares application for testing

### 3. Test

- Runs unit tests using pytest
- Tests all API endpoints
- Validates application logic

### 4. Package

- Builds Docker image with tag `demo-cicd-app:latest`
- Creates containerized application

### 5. Deploy

- Stops any existing containers
- Deploys application using Docker Compose
- Waits for application to be ready

### 6. Health Check

- Verifies container is running
- Checks health endpoint returns HTTP 200
- Validates application is responding correctly
- Displays container stats and logs

## 🧪 Testing

### Run Unit Tests

```bash
cd app
pytest test_app.py -v
```

### Test Coverage

```bash
cd app
pytest test_app.py -v --cov=app --cov-report=html
```

### Manual API Testing

```bash
# Home endpoint
curl http://localhost:5000

# Health endpoint
curl http://localhost:5000/health

# Info endpoint
curl http://localhost:5000/info
```

### Expected Responses

**Home Endpoint** (`/`):

```json
{
  "message": "Hello World from CI/CD Pipeline!",
  "status": "running",
  "timestamp": "2025-11-13T10:30:00.000000",
  "version": "1.0.0"
}
```

**Health Endpoint** (`/health`):

```json
{
  "status": "healthy",
  "service": "demo-app",
  "timestamp": "2025-11-13T10:30:00.000000"
}
```

## 🐳 Docker Setup

### Build Image Manually

```bash
docker build -t demo-cicd-app:latest .
```

### Run Container Directly

```bash
docker run -d -p 5000:5000 --name demo-app demo-cicd-app:latest
```

### View Container Logs

```bash
docker-compose logs -f demo-app
```

### Stop and Remove Containers

```bash
docker-compose down
```

### Clean Up Docker Resources

```bash
# Remove containers and images
docker-compose down --rmi all

# Remove volumes
docker-compose down -v
```

## 🔨 Jenkins Setup

### Starting Jenkins with Docker-in-Docker

```bash
chmod +x setup-jenkins.sh
./setup-jenkins.sh
```

### Manual Jenkins Setup

```bash
# Start Jenkins
docker-compose -f docker-compose-jenkins.yml up -d

# Get initial admin password
docker exec jenkins-cicd cat /var/jenkins_home/secrets/initialAdminPassword

# Access Jenkins
open http://localhost:8080
```

### First-Time Configuration

1. Enter the initial admin password
2. Click "Install suggested plugins"
3. Create first admin user
4. Keep default Jenkins URL (http://localhost:8080)
5. Start using Jenkins

### Installing Required Plugins

Navigate to **Manage Jenkins** → **Manage Plugins** → **Available**

Install:

- Pipeline
- Docker Pipeline
- Git

### Configuring Pipeline Job

1. **New Item** → Enter name → **Pipeline**
2. In **Pipeline** section:
   - Definition: `Pipeline script from SCM`
   - SCM: `Git`
   - Repository URL: `/workspace`
   - Branch: `*/main` (or your branch)
   - Script Path: `Jenkinsfile`
3. **Save**

### Running the Pipeline

Click **"Build Now"** on your pipeline job.

## 📸 Screenshots

### Pipeline Execution Flow

The successful pipeline execution shows:

1. ✅ Checkout stage - Source code retrieved
2. ✅ Build stage - Dependencies installed
3. ✅ Test stage - All tests passed (4/4)
4. ✅ Package stage - Docker image built
5. ✅ Deploy stage - Application deployed
6. ✅ Health Check stage - Application healthy

### Console Output Sample

```
========================================
Stage 1: Checking out source code...
========================================
✓ Source code checked out

========================================
Stage 2: Building the application...
========================================
✓ Dependencies installed successfully

========================================
Stage 3: Running unit tests...
========================================
test_app.py::test_home_endpoint PASSED
test_app.py::test_health_endpoint PASSED
test_app.py::test_info_endpoint PASSED
test_app.py::test_invalid_endpoint PASSED
✓ All tests passed successfully

========================================
Stage 4: Building Docker image...
========================================
✓ Docker image built successfully

========================================
Stage 5: Deploying with Docker Compose...
========================================
✓ Application deployed successfully

========================================
Stage 6: Verifying application health...
========================================
✓ Health check passed - Application is healthy!

========================================
✓✓✓ PIPELINE COMPLETED SUCCESSFULLY ✓✓✓
========================================
```

### Health Check Output

```
================================================
Starting Health Check for Demo CI/CD Application
================================================

1. Checking if container is running...
✓ Container is running

2. Checking health endpoint...
   Attempt 1/5...
✓ Health endpoint returned HTTP 200

Health Response:
{
  "status": "healthy",
  "service": "demo-app",
  "timestamp": "2025-11-13T10:30:00.000000"
}

3. Checking home endpoint...
✓ Home endpoint returned HTTP 200

4. Checking Docker container health status...
✓ Docker health check passed

5. Container Information:
   ----------------------
NAME           STATUS    PORTS
demo-cicd-app  Up        0.0.0.0:5000->5000/tcp

================================================
✓✓✓ ALL HEALTH CHECKS PASSED ✓✓✓
================================================

Application Details:
  - Status: HEALTHY
  - URL: http://localhost:5000
  - Health: http://localhost:5000/health
  - Container: demo-cicd-app

You can access the application at:
  curl http://localhost:5000
  curl http://localhost:5000/health
================================================
```

## 🔍 Troubleshooting

### Port Already in Use

```bash
# Check what's using port 5000
lsof -i :5000

# Kill the process
kill -9 <PID>

# Or use different port in docker-compose.yml
ports:
  - "5001:5000"
```

### Jenkins Can't Access Docker

Ensure Jenkins has Docker access:

```bash
docker exec -it jenkins-cicd docker ps
```

### Container Won't Start

Check logs:

```bash
docker-compose logs demo-app
```

### Health Check Fails

1. Verify container is running: `docker-compose ps`
2. Check application logs: `docker-compose logs demo-app`
3. Test endpoint manually: `curl http://localhost:5000/health`
4. Verify port is accessible: `netstat -an | grep 5000`

### Python Dependencies Issues

```bash
# Rebuild with no cache
docker build --no-cache -t demo-cicd-app:latest .
```

### Clean Slate Restart

```bash
# Stop everything
docker-compose down
docker-compose -f docker-compose-jenkins.yml down

# Remove all project containers and images
docker rm -f demo-cicd-app jenkins-cicd jenkins-docker 2>/dev/null || true
docker rmi demo-cicd-app:latest 2>/dev/null || true

# Start fresh
./setup-jenkins.sh
```

## 🎓 Learning Points

This project demonstrates:

- **Declarative Pipeline Syntax** - Modern Jenkins pipeline configuration
- **Containerization** - Building reproducible application images
- **Docker Compose** - Multi-container orchestration
- **Health Monitoring** - Application health verification
- **Automated Testing** - Unit test integration in CI/CD
- **Docker-in-Docker** - Running Docker inside Docker containers
- **Infrastructure as Code** - All configuration in version control

## 📝 Next Steps

- Add integration tests
- Implement staging environment
- Add notifications (Slack, email)
- Set up automated versioning
- Configure production deployment
- Add monitoring and logging (Prometheus, Grafana)
- Implement rollback strategy

## 🤝 Contributing

Feel free to fork this project and adapt it for your needs!

## 📄 License

MIT License - Feel free to use this for learning and projects.

---

**Built with** ❤️ **for learning CI/CD pipelines**
