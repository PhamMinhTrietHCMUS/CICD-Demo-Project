# CI/CD Demo Project - Docker Edition

## Mô tả
Triển khai CI/CD sử dụng Git, Jenkins và Docker (tất cả chạy trên Docker)

## Cấu trúc Project
```
├── index.html          # Web application
├── Dockerfile          # Docker config cho web app
├── docker-compose.yml  # Jenkins + Web App services
├── Jenkinsfile         # Jenkins pipeline
├── start.bat           # Script khởi động
└── README.md
```

---

## Yêu cầu

- **Docker Desktop**: https://www.docker.com/products/docker-desktop/
- **Git**: https://git-scm.com/download/win

---

## Khởi động nhanh

### Cách 1: Chạy script
```bash
start.bat
```

### Cách 2: Chạy thủ công
```bash
docker-compose up -d
```

---

## Các bước cấu hình chi tiết

### 1. Cấu hình Git (2 điểm)
```bash
git config --global user.name "23127132"
git config --global user.email "23127132@student.hcmus.edu.vn"
git add .
git commit -m "Setup CI/CD with Docker"
```

### 2. Cấu hình GitHub (1 điểm)
```bash
git remote add origin https://github.com/23127132/CICD-Demo-Project.git
git push -u origin main
```

### 3. Cấu hình Docker (2 điểm)
```bash
# Khởi động services
docker-compose up -d

# Kiểm tra containers
docker ps
```

### 4. Cấu hình Jenkins (2 điểm)

1. Truy cập: http://localhost:8080

2. Lấy initial password:
```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

3. Tạo admin user: **23127132**

4. Cài plugins: Git, Docker Pipeline, Pipeline

### 5. Kết nối Jenkins & Docker (2 điểm)

1. **Cài Docker CLI trong Jenkins**:
```bash
docker exec -it jenkins bash
apt-get update && apt-get install -y docker.io
exit
```

2. **Tạo Pipeline Job**:
   - New Item → Pipeline → `cicd-demo`
   - Pipeline script from SCM
   - Git URL: `https://github.com/23127132/CICD-Demo-Project.git`
   - Branch: `*/main`
   - Script Path: `Jenkinsfile`

3. **Build Now** và kiểm tra kết quả

---

## URLs

| Service | URL |
|---------|-----|
| Jenkins | http://localhost:8080 |
| Web App | http://localhost:8081 |

---

## Dọn dẹp

```bash
# Dừng tất cả
docker-compose down

# Xóa cả volumes
docker-compose down -v
```

---

## Thông tin nhóm
- MSSV: 23127132
- Họ tên: [Điền họ tên]
- SĐT: [Điền SĐT]  
- Email: 23127132@student.hcmus.edu.vn