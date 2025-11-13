#!/bin/bash

# Manual Pipeline Execution Script
# This script simulates running the Jenkins pipeline stages manually

set -e

echo "========================================================================"
echo "             CI/CD PIPELINE EXECUTION - MANUAL MODE"
echo "========================================================================"
echo ""
echo "This script demonstrates the complete pipeline execution."
echo "Note: Requires Docker and Docker Compose to be installed."
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check prerequisites
check_prerequisites() {
    echo "Checking prerequisites..."
    
    if ! command -v docker &> /dev/null; then
        echo -e "${RED}✗ Docker is not installed${NC}"
        echo "Please install Docker Desktop from: https://www.docker.com/products/docker-desktop"
        exit 1
    fi
    
    if ! command -v docker-compose &> /dev/null; then
        echo -e "${RED}✗ Docker Compose is not installed${NC}"
        exit 1
    fi
    
    if ! docker info &> /dev/null; then
        echo -e "${RED}✗ Docker is not running${NC}"
        echo "Please start Docker Desktop"
        exit 1
    fi
    
    echo -e "${GREEN}✓ All prerequisites met${NC}"
    echo ""
}

# Stage 1: Checkout
stage_checkout() {
    echo "========================================================================"
    echo "STAGE 1: CHECKOUT"
    echo "========================================================================"
    echo "Checking out source code..."
    pwd
    ls -la
    echo -e "${GREEN}✓ Checkout complete${NC}"
    echo ""
}

# Stage 2: Build
stage_build() {
    echo "========================================================================"
    echo "STAGE 2: BUILD"
    echo "========================================================================"
    echo "Installing Python dependencies..."
    pip install -q -r app/requirements.txt
    echo -e "${GREEN}✓ Dependencies installed successfully${NC}"
    echo ""
}

# Stage 3: Test
stage_test() {
    echo "========================================================================"
    echo "STAGE 3: TEST"
    echo "========================================================================"
    echo "Running unit tests with pytest..."
    cd app
    pytest test_app.py -v
    cd ..
    echo -e "${GREEN}✓ All tests passed successfully${NC}"
    echo ""
}

# Stage 4: Package
stage_package() {
    echo "========================================================================"
    echo "STAGE 4: PACKAGE"
    echo "========================================================================"
    echo "Building Docker image: demo-cicd-app:latest"
    docker build -t demo-cicd-app:latest .
    echo ""
    echo "Verifying Docker image..."
    docker images | grep demo-cicd-app
    echo -e "${GREEN}✓ Docker image built successfully${NC}"
    echo ""
}

# Stage 5: Deploy
stage_deploy() {
    echo "========================================================================"
    echo "STAGE 5: DEPLOY"
    echo "========================================================================"
    echo "Stopping any existing containers..."
    docker-compose down || true
    echo ""
    echo "Starting application with Docker Compose..."
    docker-compose up -d
    echo ""
    echo "Waiting for application to start..."
    sleep 10
    echo ""
    echo "Container status:"
    docker-compose ps
    echo -e "${GREEN}✓ Application deployed successfully${NC}"
    echo ""
}

# Stage 6: Health Check
stage_health_check() {
    echo "========================================================================"
    echo "STAGE 6: HEALTH CHECK"
    echo "========================================================================"
    echo "Running health check script..."
    ./healthcheck.sh
    echo -e "${GREEN}✓ Health check passed - Application is healthy!${NC}"
    echo ""
}

# Main execution
main() {
    check_prerequisites
    
    echo "Starting pipeline execution at $(date)"
    echo ""
    
    stage_checkout
    stage_build
    stage_test
    stage_package
    stage_deploy
    stage_health_check
    
    echo "========================================================================"
    echo "               ✓✓✓ PIPELINE COMPLETED SUCCESSFULLY ✓✓✓"
    echo "========================================================================"
    echo ""
    echo "All stages completed:"
    echo "  ✓ Checkout"
    echo "  ✓ Build"
    echo "  ✓ Test (4/4 tests passed)"
    echo "  ✓ Package (Docker Image)"
    echo "  ✓ Deploy (Docker Compose)"
    echo "  ✓ Health Check"
    echo ""
    echo "Application is running at: http://localhost:5000"
    echo "Health endpoint: http://localhost:5000/health"
    echo ""
    echo "========================================================================"
    echo ""
    echo "To stop the application, run:"
    echo "  docker-compose down"
    echo ""
}

# Run main function
main
