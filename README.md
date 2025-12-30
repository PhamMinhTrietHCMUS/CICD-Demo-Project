# CI/CD Demo Project

## Mô tả
Triển khai CI/CD sử dụng Git, Jenkins và Docker

## Cấu trúc
```
├── index.html      # Web app
├── Dockerfile      # Docker config  
├── Jenkinsfile     # Jenkins pipeline
└── .gitignore
```

## Các bước

### 1. Git
```bash
git config --global user.name "MSSV"
git config --global user.email "MSSV@email.com"
git add .
git commit -m "first commit"
```

### 2. GitHub
```bash
git remote add origin https://github.com/MSSV/repo.git
git push -u origin main
```

### 3. Docker
```bash
docker build -t cicd-app .
docker run -d -p 8080:80 cicd-app
```

### 4. Jenkins
- Tạo Pipeline job
- Kết nối GitHub repo
- Chạy build

Truy cập: http://localhost:8080