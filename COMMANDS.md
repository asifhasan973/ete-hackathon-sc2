# Quick Command Reference

## 🚀 Getting Started

### Initialize Git Repository

```bash
chmod +x init-git.sh
./init-git.sh
```

### View Quick Start Guide

```bash
chmod +x QUICKSTART.sh
./QUICKSTART.sh
```

---

## 🧪 Running Tests

### Run Unit Tests

```bash
# Install dependencies first
pip install -r app/requirements.txt

# Run tests
cd app
pytest test_app.py -v
cd ..
```

### Run Tests with Coverage

```bash
cd app
pytest test_app.py -v --cov=app --cov-report=html
cd ..
```

---

## 🐳 Docker Commands

### Build Docker Image

```bash
docker build -t demo-cicd-app:latest .
```

### Run Container Directly

```bash
docker run -d -p 5000:5000 --name demo-app demo-cicd-app:latest
```

### Using Docker Compose

#### Start Application

```bash
docker-compose up -d
```

#### Stop Application

```bash
docker-compose down
```

#### View Logs

```bash
docker-compose logs -f demo-app
```

#### Restart Application

```bash
docker-compose restart demo-app
```

#### View Container Status

```bash
docker-compose ps
```

---

## 🔧 Jenkins Commands

### Start Jenkins (Docker-in-Docker)

```bash
chmod +x setup-jenkins.sh
./setup-jenkins.sh
```

### Manual Jenkins Setup

```bash
# Start Jenkins
docker-compose -f docker-compose-jenkins.yml up -d

# Get admin password
docker exec jenkins-cicd cat /var/jenkins_home/secrets/initialAdminPassword

# View Jenkins logs
docker-compose -f docker-compose-jenkins.yml logs -f jenkins
```

### Stop Jenkins

```bash
docker-compose -f docker-compose-jenkins.yml down
```

---

## ✅ Health Check Commands

### Run Health Check Script

```bash
chmod +x healthcheck.sh
./healthcheck.sh
```

### Manual Health Checks

```bash
# Check health endpoint
curl http://localhost:5000/health

# Check home endpoint
curl http://localhost:5000

# Check info endpoint
curl http://localhost:5000/info

# Check with pretty JSON
curl http://localhost:5000/health | python3 -m json.tool
```

---

## 🔄 Pipeline Execution

### Manual Pipeline (All Stages)

```bash
chmod +x run-pipeline.sh
./run-pipeline.sh
```

### Run Individual Stages

#### Stage 1: Checkout

```bash
pwd
ls -la
```

#### Stage 2: Build

```bash
pip install -r app/requirements.txt
```

#### Stage 3: Test

```bash
cd app
pytest test_app.py -v
cd ..
```

#### Stage 4: Package

```bash
docker build -t demo-cicd-app:latest .
```

#### Stage 5: Deploy

```bash
docker-compose down || true
docker-compose up -d
sleep 10
docker-compose ps
```

#### Stage 6: Health Check

```bash
./healthcheck.sh
```

---

## 🔍 Monitoring & Debugging

### View Container Logs

```bash
docker-compose logs demo-app
docker-compose logs --tail=50 demo-app
docker-compose logs -f demo-app  # Follow logs
```

### Check Container Stats

```bash
docker stats demo-cicd-app --no-stream
```

### Inspect Container

```bash
docker inspect demo-cicd-app
```

### Check Container Health

```bash
docker inspect --format='{{.State.Health.Status}}' demo-cicd-app
```

### Execute Commands in Container

```bash
docker exec -it demo-cicd-app /bin/bash
docker exec demo-cicd-app python --version
```

---

## 🧹 Cleanup Commands

### Stop and Remove Containers

```bash
docker-compose down
```

### Remove Containers and Images

```bash
docker-compose down --rmi all
```

### Remove Everything (Containers, Images, Volumes)

```bash
docker-compose down -v --rmi all
```

### Clean Jenkins

```bash
docker-compose -f docker-compose-jenkins.yml down -v
```

### Complete Cleanup

```bash
# Stop all containers
docker-compose down
docker-compose -f docker-compose-jenkins.yml down

# Remove specific containers
docker rm -f demo-cicd-app jenkins-cicd jenkins-docker 2>/dev/null || true

# Remove images
docker rmi demo-cicd-app:latest 2>/dev/null || true

# Remove volumes
docker volume prune -f
```

---

## 📊 Verification Commands

### Check Python Version

```bash
python3 --version
```

### Check Docker Version

```bash
docker --version
docker-compose --version
```

### Check Port Usage

```bash
# macOS/Linux
lsof -i :5000
lsof -i :8080

# Or use netstat
netstat -an | grep 5000
```

### Check Docker is Running

```bash
docker info
```

### List Docker Images

```bash
docker images | grep demo-cicd-app
```

### List Running Containers

```bash
docker ps
docker ps -a  # All containers
```

---

## 📝 File Operations

### View Configuration Files

```bash
# View Jenkinsfile
cat Jenkinsfile

# View Dockerfile
cat Dockerfile

# View docker-compose.yml
cat docker-compose.yml

# View app code
cat app/app.py

# View tests
cat app/test_app.py
```

### Make Scripts Executable

```bash
chmod +x healthcheck.sh
chmod +x setup-jenkins.sh
chmod +x run-pipeline.sh
chmod +x init-git.sh
chmod +x QUICKSTART.sh
```

### Or all at once

```bash
chmod +x *.sh
```

---

## 🌐 Access URLs

### Application

- Home: http://localhost:5000
- Health: http://localhost:5000/health
- Info: http://localhost:5000/info

### Jenkins

- Dashboard: http://localhost:8080

---

## 📸 Screenshot Commands

### Test Endpoints for Screenshots

```bash
# Home endpoint
curl http://localhost:5000 | python3 -m json.tool

# Health endpoint
curl http://localhost:5000/health | python3 -m json.tool

# Info endpoint
curl http://localhost:5000/info | python3 -m json.tool
```

---

## 🔧 Troubleshooting Commands

### Port Already in Use

```bash
# Find process using port 5000
lsof -i :5000

# Kill the process (replace PID)
kill -9 <PID>
```

### Docker Not Starting

```bash
# Check Docker service
docker info

# Restart Docker (macOS)
killall Docker && open -a Docker
```

### Container Not Responding

```bash
# Check container status
docker-compose ps

# View recent logs
docker-compose logs --tail=50 demo-app

# Restart container
docker-compose restart demo-app
```

### Python Import Errors

```bash
# Reinstall dependencies
pip install --upgrade -r app/requirements.txt

# Or in container
docker-compose exec demo-app pip list
```

---

## 🎯 One-Line Commands

### Quick Test (No Docker)

```bash
pip install -q -r app/requirements.txt && cd app && pytest test_app.py -v && cd ..
```

### Quick Deploy

```bash
docker build -t demo-cicd-app:latest . && docker-compose up -d && sleep 10 && curl http://localhost:5000/health
```

### Quick Restart

```bash
docker-compose down && docker-compose up -d && sleep 10 && ./healthcheck.sh
```

### View All Logs

```bash
docker-compose logs demo-app 2>&1 | less
```

---

## 📚 Documentation Commands

### View Documentation

```bash
# Main README
cat README.md | less

# Quick start
./QUICKSTART.sh

# Deliverables summary
cat DELIVERABLES.md | less

# Screenshot guide
cat SCREENSHOTS_GUIDE.md | less

# Pipeline output
cat PIPELINE_CONSOLE_OUTPUT.txt | less
```

---

## 🎓 Learning Commands

### Understand Pipeline Stages

```bash
grep -A 10 "stage(" Jenkinsfile
```

### See All Endpoints in Code

```bash
grep "@app.route" app/app.py
```

### See All Tests

```bash
grep "def test_" app/test_app.py
```

### View Docker Build Steps

```bash
grep "^Step" Dockerfile
```

---

## 💾 Backup Commands

### Backup Configuration

```bash
tar -czf cicd-backup.tar.gz \
  Jenkinsfile \
  Dockerfile \
  docker-compose*.yml \
  app/ \
  *.sh \
  *.md
```

### Export Docker Image

```bash
docker save demo-cicd-app:latest | gzip > demo-cicd-app.tar.gz
```

### Import Docker Image

```bash
docker load < demo-cicd-app.tar.gz
```

---

## ✨ All-in-One Commands

### Complete Setup from Scratch

```bash
# 1. Test Python code
pip install -r app/requirements.txt
cd app && pytest test_app.py -v && cd ..

# 2. Build and deploy
docker build -t demo-cicd-app:latest .
docker-compose up -d

# 3. Wait and verify
sleep 10
./healthcheck.sh

# 4. Test endpoints
curl http://localhost:5000/health
```

### Complete Teardown

```bash
docker-compose down --rmi all -v
docker-compose -f docker-compose-jenkins.yml down -v
docker rm -f demo-cicd-app jenkins-cicd jenkins-docker 2>/dev/null || true
rm -rf app/__pycache__
```

---

## 🔑 Most Used Commands

```bash
# Start everything
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f demo-app

# Test health
curl http://localhost:5000/health

# Stop everything
docker-compose down
```

---

**Quick Reference Guide**  
For detailed explanations, see README.md
