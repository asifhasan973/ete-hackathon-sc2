#!/bin/bash

# Script to set up and run Jenkins with Docker-in-Docker

set -e

echo "================================================"
echo "Jenkins CI/CD Pipeline Setup"
echo "================================================"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "✗ Docker is not running. Please start Docker first."
    exit 1
fi

echo "✓ Docker is running"
echo ""

# Start Jenkins with Docker-in-Docker
echo "Starting Jenkins with Docker-in-Docker..."
docker-compose -f docker-compose-jenkins.yml up -d

echo ""
echo "Waiting for Jenkins to start..."
sleep 20

# Get initial admin password
echo ""
echo "================================================"
echo "Jenkins Initial Setup"
echo "================================================"
echo ""
echo "Jenkins is starting up. This may take a minute..."
echo ""

# Wait for Jenkins to be ready
for i in {1..30}; do
    if docker exec jenkins-cicd test -f /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null; then
        break
    fi
    echo "Waiting for Jenkins to initialize... ($i/30)"
    sleep 2
done

if docker exec jenkins-cicd test -f /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null; then
    ADMIN_PASSWORD=$(docker exec jenkins-cicd cat /var/jenkins_home/secrets/initialAdminPassword)
    echo "✓ Jenkins is ready!"
    echo ""
    echo "================================================"
    echo "Jenkins Access Information"
    echo "================================================"
    echo ""
    echo "URL: http://localhost:8080"
    echo ""
    echo "Initial Admin Password:"
    echo "$ADMIN_PASSWORD"
    echo ""
    echo "================================================"
    echo "Next Steps:"
    echo "================================================"
    echo ""
    echo "1. Open http://localhost:8080 in your browser"
    echo "2. Enter the initial admin password above"
    echo "3. Install suggested plugins"
    echo "4. Create your first admin user"
    echo "5. Create a new Pipeline job:"
    echo "   - New Item → Enter name → Pipeline"
    echo "   - In Pipeline section:"
    echo "     * Definition: Pipeline script from SCM"
    echo "     * SCM: Git"
    echo "     * Repository URL: /workspace (or your git repo)"
    echo "     * Script Path: Jenkinsfile"
    echo "6. Click 'Build Now' to run the pipeline"
    echo ""
    echo "================================================"
else
    echo "✗ Could not retrieve Jenkins password. Check logs:"
    echo "docker-compose -f docker-compose-jenkins.yml logs jenkins"
fi
