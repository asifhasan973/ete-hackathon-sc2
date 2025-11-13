#!/bin/bash

# Initialize Git repository for the CI/CD project

echo "Initializing Git repository for CI/CD Pipeline Demo..."
echo ""

# Initialize git if not already done
if [ ! -d .git ]; then
    git init
    echo "✓ Git repository initialized"
else
    echo "✓ Git repository already exists"
fi

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Complete CI/CD pipeline with Jenkins, Docker, and Flask

Features:
- Flask web application with /health endpoint
- 4 unit tests with pytest
- Declarative Jenkinsfile with 6 stages (Build, Test, Package, Deploy, Health Check)
- Dockerfile for containerization
- docker-compose.yml for deployment orchestration
- docker-compose-jenkins.yml for Jenkins Docker-in-Docker setup
- Comprehensive health check script
- Complete documentation and guides

Pipeline stages:
1. Checkout - Source code retrieval
2. Build - Install dependencies
3. Test - Run unit tests (4/4 passing)
4. Package - Build Docker image
5. Deploy - Deploy with Docker Compose
6. Health Check - Verify application health

Deliverables:
✓ Jenkinsfile (Declarative pipeline)
✓ Dockerfile (Application containerization)
✓ docker-compose.yml (Deployment)
✓ app/ (Demo Flask application)
✓ healthcheck.sh (Health verification)
✓ Unit tests (4 tests passing)
✓ Console output example (PIPELINE_CONSOLE_OUTPUT.txt)
✓ Documentation (README.md, SCREENSHOTS_GUIDE.md)
"

echo ""
echo "✓ Initial commit created"
echo ""
echo "Git repository ready! Current status:"
git log --oneline -1
echo ""
echo "To push to a remote repository:"
echo "  git remote add origin <your-repo-url>"
echo "  git branch -M main"
echo "  git push -u origin main"
echo ""
