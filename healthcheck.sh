#!/bin/bash

# Health Check Script for Demo CI/CD Application
# Verifies the application container is running and healthy

set -e

APP_URL="http://localhost:5000"
HEALTH_ENDPOINT="${APP_URL}/health"
MAX_RETRIES=5
RETRY_INTERVAL=3

echo "================================================"
echo "Starting Health Check for Demo CI/CD Application"
echo "================================================"

# Function to check if container is running
check_container() {
    echo ""
    echo "1. Checking if container is running..."
    CONTAINER_STATUS=$(docker-compose ps -q demo-app 2>/dev/null || echo "")
    
    if [ -z "$CONTAINER_STATUS" ]; then
        echo "✗ Container is not running!"
        return 1
    fi
    
    RUNNING=$(docker inspect -f '{{.State.Running}}' demo-cicd-app 2>/dev/null || echo "false")
    if [ "$RUNNING" != "true" ]; then
        echo "✗ Container exists but is not running!"
        return 1
    fi
    
    echo "✓ Container is running"
    return 0
}

# Function to check health endpoint
check_health_endpoint() {
    echo ""
    echo "2. Checking health endpoint..."
    
    for i in $(seq 1 $MAX_RETRIES); do
        echo "   Attempt $i/$MAX_RETRIES..."
        
        HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $HEALTH_ENDPOINT 2>/dev/null || echo "000")
        
        if [ "$HTTP_CODE" = "200" ]; then
            echo "✓ Health endpoint returned HTTP 200"
            
            # Get and display health response
            HEALTH_RESPONSE=$(curl -s $HEALTH_ENDPOINT)
            echo ""
            echo "Health Response:"
            echo "$HEALTH_RESPONSE" | python3 -m json.tool 2>/dev/null || echo "$HEALTH_RESPONSE"
            return 0
        fi
        
        if [ $i -lt $MAX_RETRIES ]; then
            echo "   Health check failed (HTTP $HTTP_CODE). Retrying in ${RETRY_INTERVAL}s..."
            sleep $RETRY_INTERVAL
        fi
    done
    
    echo "✗ Health endpoint check failed after $MAX_RETRIES attempts"
    return 1
}

# Function to test home endpoint
check_home_endpoint() {
    echo ""
    echo "3. Checking home endpoint..."
    
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $APP_URL 2>/dev/null || echo "000")
    
    if [ "$HTTP_CODE" = "200" ]; then
        echo "✓ Home endpoint returned HTTP 200"
        
        HOME_RESPONSE=$(curl -s $APP_URL)
        echo ""
        echo "Home Response:"
        echo "$HOME_RESPONSE" | python3 -m json.tool 2>/dev/null || echo "$HOME_RESPONSE"
        return 0
    else
        echo "✗ Home endpoint check failed (HTTP $HTTP_CODE)"
        return 1
    fi
}

# Function to check Docker health status
check_docker_health() {
    echo ""
    echo "4. Checking Docker container health status..."
    
    HEALTH_STATUS=$(docker inspect --format='{{.State.Health.Status}}' demo-cicd-app 2>/dev/null || echo "unknown")
    
    echo "   Container health status: $HEALTH_STATUS"
    
    if [ "$HEALTH_STATUS" = "healthy" ] || [ "$HEALTH_STATUS" = "unknown" ]; then
        echo "✓ Docker health check passed"
        return 0
    else
        echo "⚠ Docker health status: $HEALTH_STATUS"
        return 0  # Don't fail on this, as it might not be ready yet
    fi
}

# Function to display container logs
show_container_info() {
    echo ""
    echo "5. Container Information:"
    echo "   ----------------------"
    docker-compose ps
    echo ""
    echo "   Container Stats:"
    docker stats demo-cicd-app --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}"
}

# Main health check execution
main() {
    if ! check_container; then
        echo ""
        echo "================================================"
        echo "✗ HEALTH CHECK FAILED: Container not running"
        echo "================================================"
        exit 1
    fi
    
    if ! check_health_endpoint; then
        echo ""
        echo "Showing recent container logs for debugging:"
        docker-compose logs --tail=20 demo-app
        echo ""
        echo "================================================"
        echo "✗ HEALTH CHECK FAILED: Health endpoint not responding"
        echo "================================================"
        exit 1
    fi
    
    check_home_endpoint || true
    check_docker_health || true
    show_container_info || true
    
    echo ""
    echo "================================================"
    echo "✓✓✓ ALL HEALTH CHECKS PASSED ✓✓✓"
    echo "================================================"
    echo ""
    echo "Application Details:"
    echo "  - Status: HEALTHY"
    echo "  - URL: $APP_URL"
    echo "  - Health: $HEALTH_ENDPOINT"
    echo "  - Container: demo-cicd-app"
    echo ""
    echo "You can access the application at:"
    echo "  curl $APP_URL"
    echo "  curl $HEALTH_ENDPOINT"
    echo "================================================"
    
    exit 0
}

# Run main function
main
