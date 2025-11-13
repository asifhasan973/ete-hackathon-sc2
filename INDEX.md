# 📚 Documentation Index

Welcome to the CI/CD Pipeline Demo project! This file helps you navigate all the documentation.

## 🎯 Start Here

**New to this project?** → Read these in order:

1. **[DELIVERABLES.md](DELIVERABLES.md)** - Project overview and what's been built
2. **[README.md](README.md)** - Complete guide and instructions
3. **[QUICKSTART.sh](QUICKSTART.sh)** - Quick start guide (run: `./QUICKSTART.sh`)

## 📖 Documentation Files

### Essential Documentation

| File                | Purpose                                 | When to Read              |
| ------------------- | --------------------------------------- | ------------------------- |
| **DELIVERABLES.md** | Project summary, deliverables checklist | First - Get overview      |
| **README.md**       | Complete setup and usage guide          | Second - Learn everything |
| **QUICKSTART.sh**   | Quick start interactive guide           | Quick reference           |

### Reference Documentation

| File                            | Purpose                            | When to Use           |
| ------------------------------- | ---------------------------------- | --------------------- |
| **COMMANDS.md**                 | All commands organized by category | Need specific command |
| **SCREENSHOTS_GUIDE.md**        | How to capture screenshots         | Ready to run pipeline |
| **PIPELINE_CONSOLE_OUTPUT.txt** | Example successful pipeline run    | See expected output   |

### Configuration Files

| File                           | Purpose                      | Description                  |
| ------------------------------ | ---------------------------- | ---------------------------- |
| **Jenkinsfile**                | CI/CD pipeline definition    | 6-stage declarative pipeline |
| **Dockerfile**                 | Application containerization | Build Flask app image        |
| **docker-compose.yml**         | App deployment               | Orchestrate demo-app         |
| **docker-compose-jenkins.yml** | Jenkins setup                | Docker-in-Docker Jenkins     |
| **.gitignore**                 | Git ignore patterns          | Exclude build artifacts      |

### Application Files

| File                     | Purpose               | Description                     |
| ------------------------ | --------------------- | ------------------------------- |
| **app/app.py**           | Flask web application | 3 endpoints (/, /health, /info) |
| **app/test_app.py**      | Unit tests            | 4 tests with pytest             |
| **app/requirements.txt** | Python dependencies   | Flask, pytest, requests         |

### Scripts

| Script               | Purpose                   | Usage                |
| -------------------- | ------------------------- | -------------------- |
| **healthcheck.sh**   | Verify app health         | `./healthcheck.sh`   |
| **setup-jenkins.sh** | Start Jenkins             | `./setup-jenkins.sh` |
| **run-pipeline.sh**  | Manual pipeline execution | `./run-pipeline.sh`  |
| **init-git.sh**      | Initialize Git repo       | `./init-git.sh`      |
| **QUICKSTART.sh**    | Display quick guide       | `./QUICKSTART.sh`    |

## 🗺️ Navigation Guide

### I want to...

#### Learn about the project

→ Read: `DELIVERABLES.md` → `README.md`

#### Run the pipeline quickly

→ Read: `QUICKSTART.sh` → Choose an option → Follow steps

#### Find a specific command

→ Read: `COMMANDS.md` → Search for your need

#### Understand the pipeline stages

→ Read: `Jenkinsfile` or `README.md` section "Pipeline Stages"

#### See what a successful run looks like

→ Read: `PIPELINE_CONSOLE_OUTPUT.txt`

#### Take screenshots

→ Read: `SCREENSHOTS_GUIDE.md`

#### Troubleshoot an issue

→ Read: `README.md` section "Troubleshooting"

#### Modify the application

→ Edit: `app/app.py` → Run tests: `cd app && pytest test_app.py -v`

#### Change the pipeline

→ Edit: `Jenkinsfile` → Test with: `./run-pipeline.sh` or Jenkins

#### Deploy with Docker

→ Run: `docker-compose up -d` → Verify: `./healthcheck.sh`

## 📊 File Organization

```
Documentation (What to read)
├── INDEX.md (this file)          - Navigation guide
├── DELIVERABLES.md               - Project summary
├── README.md                     - Main documentation
├── COMMANDS.md                   - Command reference
├── SCREENSHOTS_GUIDE.md          - Screenshot guide
└── PIPELINE_CONSOLE_OUTPUT.txt   - Example output

Configuration (How it works)
├── Jenkinsfile                   - Pipeline definition
├── Dockerfile                    - Container build
├── docker-compose.yml            - App deployment
├── docker-compose-jenkins.yml    - Jenkins setup
└── .gitignore                    - Git ignore

Application (What runs)
├── app/app.py                    - Web application
├── app/test_app.py               - Unit tests
└── app/requirements.txt          - Dependencies

Scripts (How to run)
├── healthcheck.sh                - Health verification
├── setup-jenkins.sh              - Jenkins automation
├── run-pipeline.sh               - Manual pipeline
├── init-git.sh                   - Git initialization
└── QUICKSTART.sh                 - Quick guide
```

## 🎓 Learning Path

### Beginner Path

1. Read `DELIVERABLES.md` - Understand what's been built
2. Run `./QUICKSTART.sh` - See quick start options
3. Try Option 3: Test Without Docker - Just run the tests
4. Read `README.md` - Learn more details

### Intermediate Path

1. Read `README.md` - Complete overview
2. Install Docker Desktop
3. Run `./run-pipeline.sh` - Execute full pipeline manually
4. Read `COMMANDS.md` - Learn all commands

### Advanced Path

1. Read all documentation
2. Run `./setup-jenkins.sh` - Set up Jenkins
3. Create Jenkins pipeline job
4. Modify code and re-run pipeline
5. Explore Docker-in-Docker setup

## 🔍 Quick Search

### By Topic

**CI/CD Pipeline**

- Overview: `README.md` → Architecture section
- Stages: `README.md` → Pipeline Stages section
- Definition: `Jenkinsfile`
- Example run: `PIPELINE_CONSOLE_OUTPUT.txt`

**Docker**

- Build config: `Dockerfile`
- Deploy config: `docker-compose.yml`
- Commands: `COMMANDS.md` → Docker Commands section

**Testing**

- Unit tests: `app/test_app.py`
- Running tests: `README.md` → Testing section
- Test commands: `COMMANDS.md` → Running Tests section

**Application**

- Source code: `app/app.py`
- Dependencies: `app/requirements.txt`
- Endpoints: `README.md` → Testing section

**Jenkins**

- Setup: `setup-jenkins.sh`
- Docker config: `docker-compose-jenkins.yml`
- Instructions: `README.md` → Jenkins Setup section

**Health Checks**

- Script: `healthcheck.sh`
- Endpoint: `app/app.py` → /health route
- Usage: `COMMANDS.md` → Health Check Commands

## 📱 Quick Reference Cards

### Documentation Quick Card

```
Need overview?        → DELIVERABLES.md
Need full guide?      → README.md
Need command?         → COMMANDS.md
Need quick start?     → ./QUICKSTART.sh
Need example output?  → PIPELINE_CONSOLE_OUTPUT.txt
```

### Action Quick Card

```
Run tests?           → cd app && pytest test_app.py -v
Deploy app?          → docker-compose up -d
Check health?        → ./healthcheck.sh
Start Jenkins?       → ./setup-jenkins.sh
Run pipeline?        → ./run-pipeline.sh
```

### File Quick Card

```
Pipeline config?     → Jenkinsfile
Docker build?        → Dockerfile
Docker deploy?       → docker-compose.yml
App code?            → app/app.py
Tests?               → app/test_app.py
```

## 🎯 Common Tasks

### Task: Run the Project for First Time

```
Steps:
1. Read: DELIVERABLES.md (overview)
2. Read: README.md → Quick Start section
3. Run: ./QUICKSTART.sh (choose option)
4. Follow: Displayed instructions
```

### Task: Understand How Pipeline Works

```
Files to Read:
1. README.md → Pipeline Stages section
2. Jenkinsfile (actual pipeline code)
3. PIPELINE_CONSOLE_OUTPUT.txt (example run)
```

### Task: Modify and Test Application

```
Steps:
1. Edit: app/app.py
2. Run: cd app && pytest test_app.py -v
3. Build: docker build -t demo-cicd-app:latest .
4. Deploy: docker-compose up -d
5. Verify: ./healthcheck.sh
```

### Task: Get Screenshots for Portfolio

```
Steps:
1. Read: SCREENSHOTS_GUIDE.md
2. Install: Docker Desktop
3. Run: ./setup-jenkins.sh (or ./run-pipeline.sh)
4. Capture: Screenshots as guided
5. See: PIPELINE_CONSOLE_OUTPUT.txt for expected output
```

## 💡 Tips

- **All scripts need execute permission**: Run `chmod +x *.sh` once
- **Read order matters**: Start with DELIVERABLES.md, then README.md
- **Commands organized by category**: Check COMMANDS.md for any command
- **Example output available**: See PIPELINE_CONSOLE_OUTPUT.txt
- **Multiple ways to run**: Choose from 3 options in QUICKSTART.sh

## 🆘 Help

### I'm Lost

→ Start with: `./QUICKSTART.sh`

### I Need a Command

→ Check: `COMMANDS.md`

### Something's Not Working

→ Read: `README.md` → Troubleshooting section

### I Want to Learn More

→ Read: `README.md` from start to finish

### I Need Screenshots

→ Read: `SCREENSHOTS_GUIDE.md`

## 📞 Support

For detailed help on any topic:

1. Check the relevant documentation file above
2. All files have clear structure and examples
3. README.md has comprehensive troubleshooting

---

**Quick Access**:

- 🎯 Overview: `DELIVERABLES.md`
- 📖 Complete Guide: `README.md`
- ⚡ Quick Start: `./QUICKSTART.sh`
- 💻 Commands: `COMMANDS.md`
- 📸 Screenshots: `SCREENSHOTS_GUIDE.md`

---

_Use this index anytime you're unsure which file to read!_
