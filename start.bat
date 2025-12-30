@echo off
echo ========================================
echo    CI/CD Demo - Jenkins on Docker
echo ========================================
echo.

echo [1/3] Checking Docker...
docker --version
if %errorlevel% neq 0 (
    echo ERROR: Docker is not installed or not running!
    echo Please install Docker Desktop from https://www.docker.com/products/docker-desktop/
    pause
    exit /b 1
)

echo.
echo [2/3] Starting Jenkins and Web App...
docker-compose up -d

echo.
echo [3/3] Waiting for Jenkins to start...
timeout /t 30 /nobreak

echo.
echo ========================================
echo    Setup Complete!
echo ========================================
echo.
echo Jenkins:  http://localhost:8080
echo Web App:  http://localhost:8081
echo.
echo To get Jenkins initial password, run:
echo   docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
echo.
echo To stop all services:
echo   docker-compose down
echo.
pause
