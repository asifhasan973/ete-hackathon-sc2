#!/bin/bash

# Quick Start Guide - Display project information and next steps

cat << 'EOF'

╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║                  CI/CD PIPELINE PROJECT - QUICK START                        ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

✅ PROJECT STRUCTURE CREATED SUCCESSFULLY!

📁 Project Files:
   ├── app/
   │   ├── app.py              - Flask web application
   │   ├── test_app.py         - Unit tests (4 tests)
   │   └── requirements.txt    - Python dependencies
   ├── Dockerfile              - Container image definition
   ├── docker-compose.yml      - App deployment
   ├── docker-compose-jenkins.yml - Jenkins Docker setup
   ├── Jenkinsfile            - CI/CD pipeline (6 stages)
   ├── healthcheck.sh         - Health verification script
   ├── setup-jenkins.sh       - Jenkins setup automation
   ├── run-pipeline.sh        - Manual pipeline execution
   └── README.md              - Complete documentation

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 WHAT'S BEEN BUILT:

✓ Flask Application with 3 endpoints:
  - / (home)
  - /health (health check)
  - /info (application info)

✓ Declarative Jenkins Pipeline with 6 stages:
  1. Checkout  - Get source code
  2. Build     - Install dependencies
  3. Test      - Run unit tests (4 tests)
  4. Package   - Build Docker image
  5. Deploy    - Deploy with Docker Compose
  6. Health    - Verify application is healthy

✓ Docker Configuration:
  - Dockerfile with health checks
  - docker-compose.yml for orchestration
  - Jenkins Docker-in-Docker setup

✓ Testing & Verification:
  - 4 unit tests with pytest
  - Comprehensive health check script
  - Automated verification

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚀 HOW TO RUN THE PIPELINE:

OPTION 1: With Jenkins (Full CI/CD Experience)
────────────────────────────────────────────────

Prerequisites:
  • Docker Desktop installed and running
  • 4GB+ RAM available

Steps:
  1. Start Jenkins:
     $ ./setup-jenkins.sh

  2. Access Jenkins:
     Open http://localhost:8080
     
  3. Setup pipeline job (see README.md for details)
  
  4. Click "Build Now" and watch the magic! ✨


OPTION 2: Manual Pipeline Run (Quick Test)
──────────────────────────────────────────────

Prerequisites:
  • Docker Desktop installed and running

Steps:
  1. Make scripts executable:
     $ chmod +x run-pipeline.sh healthcheck.sh

  2. Run the pipeline:
     $ ./run-pipeline.sh

  3. Access the app:
     $ curl http://localhost:5000
     $ curl http://localhost:5000/health


OPTION 3: Test Without Docker (Unit Tests Only)
───────────────────────────────────────────────────

Prerequisites:
  • Python 3.11+

Steps:
  1. Install dependencies:
     $ pip install -r app/requirements.txt

  2. Run tests:
     $ cd app && pytest test_app.py -v

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 DOCUMENTATION:

  • README.md              - Complete setup and usage guide
  • PIPELINE_CONSOLE_OUTPUT.txt - Example successful run
  • SCREENSHOTS_GUIDE.md   - How to capture screenshots
  
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔍 VERIFY THE SETUP:

  1. Check tests pass:
     $ cd app && pytest test_app.py -v
     Expected: ✓ 4 passed

  2. Review pipeline stages:
     $ cat Jenkinsfile
     Expected: 6 stages defined

  3. Check Docker configuration:
     $ cat Dockerfile
     $ cat docker-compose.yml

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📸 TO COMPLETE DELIVERABLES:

The project is ready! To get screenshots:

  1. Install Docker Desktop if not already installed
  2. Run: ./setup-jenkins.sh (for Jenkins screenshots)
     OR
     Run: ./run-pipeline.sh (for manual pipeline)
  3. Take screenshots as documented in SCREENSHOTS_GUIDE.md
  4. See PIPELINE_CONSOLE_OUTPUT.txt for expected output

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎓 KEY LEARNING POINTS:

  ✓ Declarative Jenkins pipeline syntax
  ✓ Docker containerization best practices
  ✓ Docker Compose orchestration
  ✓ Automated testing in CI/CD
  ✓ Health check implementation
  ✓ Docker-in-Docker setup

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📦 DELIVERABLES CHECKLIST:

  ✅ Jenkinsfile (Declarative with 6 stages)
  ✅ Dockerfile (Application containerization)
  ✅ docker-compose.yml (Deployment orchestration)
  ✅ app/ directory (Demo Flask application)
  ✅ healthcheck.sh (Health verification)
  ✅ Unit tests (4 tests passing)
  ✅ Console output example (PIPELINE_CONSOLE_OUTPUT.txt)
  ⏸  Screenshots (requires Docker to be installed and run)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 TROUBLESHOOTING:

  Problem: Port 5000 already in use
  Solution: Kill process or change port in docker-compose.yml

  Problem: Docker not running
  Solution: Start Docker Desktop

  Problem: Permission denied on scripts
  Solution: chmod +x *.sh

  See README.md for more troubleshooting tips.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎉 READY TO GO!

Next step: Run the pipeline with one of the options above.

For detailed instructions, see: README.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
