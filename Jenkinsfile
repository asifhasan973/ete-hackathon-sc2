pipeline {
    agent any
    
    environment {
        APP_NAME = 'demo-cicd-app'
        APP_VERSION = '1.0.0'
        DOCKER_IMAGE = "${APP_NAME}:latest"
        COMPOSE_PROJECT_NAME = 'cicd-demo'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '=========================================='
                echo 'Stage 1: Checking out source code...'
                echo '=========================================='
                checkout scm
                sh 'echo "Current directory: $(pwd)"'
                sh 'ls -la'
            }
        }
        
        stage('Build') {
            steps {
                echo '=========================================='
                echo 'Stage 2: Building the application...'
                echo '=========================================='
                script {
                    // Install Python dependencies
                    sh '''
                        echo "Installing Python dependencies..."
                        pip install -r app/requirements.txt
                        echo "✓ Dependencies installed successfully"
                    '''
                }
            }
        }
        
        stage('Test') {
            steps {
                echo '=========================================='
                echo 'Stage 3: Running unit tests...'
                echo '=========================================='
                script {
                    sh '''
                        echo "Running pytest..."
                        cd app
                        pytest test_app.py -v --tb=short
                        echo "✓ All tests passed successfully"
                    '''
                }
            }
        }
        
        stage('Package') {
            steps {
                echo '=========================================='
                echo 'Stage 4: Building Docker image...'
                echo '=========================================='
                script {
                    sh '''
                        echo "Building Docker image: ${DOCKER_IMAGE}"
                        docker build -t ${DOCKER_IMAGE} .
                        echo "✓ Docker image built successfully"
                        
                        echo "Verifying Docker image..."
                        docker images | grep ${APP_NAME}
                    '''
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo '=========================================='
                echo 'Stage 5: Deploying with Docker Compose...'
                echo '=========================================='
                script {
                    sh '''
                        echo "Stopping any existing containers..."
                        docker-compose down || true
                        
                        echo "Starting application with Docker Compose..."
                        docker-compose up -d
                        
                        echo "Waiting for application to start..."
                        sleep 10
                        
                        echo "✓ Application deployed successfully"
                        docker-compose ps
                    '''
                }
            }
        }
        
        stage('Health Check') {
            steps {
                echo '=========================================='
                echo 'Stage 6: Verifying application health...'
                echo '=========================================='
                script {
                    sh '''
                        echo "Running health check script..."
                        chmod +x healthcheck.sh
                        ./healthcheck.sh
                        
                        echo "✓ Health check passed - Application is healthy!"
                    '''
                }
            }
        }
    }
    
    post {
        success {
            echo '=========================================='
            echo '✓✓✓ PIPELINE COMPLETED SUCCESSFULLY ✓✓✓'
            echo '=========================================='
            echo 'All stages completed:'
            echo '  ✓ Build'
            echo '  ✓ Test'
            echo '  ✓ Package (Docker Image)'
            echo '  ✓ Deploy (Docker Compose)'
            echo '  ✓ Health Check'
            echo ''
            echo 'Application is running at: http://localhost:5000'
            echo 'Health endpoint: http://localhost:5000/health'
            echo '=========================================='
        }
        
        failure {
            echo '=========================================='
            echo '✗✗✗ PIPELINE FAILED ✗✗✗'
            echo '=========================================='
            echo 'Cleaning up...'
            sh 'docker-compose down || true'
        }
        
        always {
            echo '=========================================='
            echo 'Pipeline execution completed'
            echo "Timestamp: ${new Date()}"
            echo '=========================================='
        }
    }
}
