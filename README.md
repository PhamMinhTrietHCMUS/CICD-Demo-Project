# CI/CD Demo Project - Docker Edition

## Gioi thieu
Du an demo quy trinh CI/CD tu dong hoa viec trien khai ung dung Web.
He thong su dung Jenkins chay tren Docker de xay dung va trien khai ung dung moi khi co thay doi ma nguon.

## Kien truc he thong
1.  Source Control: GitHub
2.  CI/CD Server: Jenkins (chay trong Docker Container)
3.  Deployment: Web App (Nginx chay trong Docker Container)
4.  Flow:
    - Commit code -> GitHub
    - Jenkins quet GitHub (moi phut) -> Phat hien thay doi
    - Jenkins Pull code -> Build Docker Image -> Deploy Container moi

## Cau truc Project
- index.html: Ma nguon Web App
- Dockerfile: Cau hinh Docker cho Web App
- Dockerfile.jenkins: Custom Image cho Jenkins (kem san Docker CLI)
- docker-compose.yml: Dinh nghia toan bo he thong (Jenkins + Web)
- Jenkinsfile: Kich ban Pipeline (Build & Deploy Steps)
- start.bat: Script khoi dong nhanh cho Windows
- README.md: Huong dan su dung

---

## Khoi dong nhanh (Quick Start)

### Yeu cau
- Docker Desktop (Da cai dat va dang chay)
- Git

### Buoc 1: Khoi dong he thong
Cach don gian nhat la chay file script:
```bash
start.bat
```
Hoac dung lenh:
```bash
docker-compose up -d --build
```

### Buoc 2: Truy cap
- Jenkins (CI/CD): http://localhost:8080
- Web App (San pham): http://localhost:8081

---

## Huong dan Demo CI/CD Tu dong

De kiem chung tinh nang tu dong (Automation), hay lam theo cac buoc sau:

1.  Kiem tra trang thai hien tai:
    - Mo Web App tai http://localhost:8081.
    - Ghi nho noi dung/mau sac hien tai.

2.  Tao thay doi:
    - Mo file index.html.
    - Sua tieu de hoac mau nen (background color).
    - Luu file.

3.  Day code len GitHub:
    Mo terminal va chay:
    ```bash
    git add .
    git commit -m "Update web content for Demo"
    git push origin main
    ```

4.  Quan sat tu dong hoa:
    - Quay lai man hinh Jenkins dashboard.
    - Cho khoang 1 phut.
    - Ban se thay Job cicd-demo tu dong chay (Build dang xu ly).

5.  Kiem tra ket qua:
    - Sau khi Build thanh cong.
    - Quay lai Web App http://localhost:8081.
    - Reload trang -> Noi dung moi da duoc cap nhat!

---

## Cai dat Jenkins lan dau (Neu chay moi tu dau)
Neu ban xoa sach container va chay lai tu dau, can lam cac buoc setup mot lan duy nhat:

1.  Truy cap http://localhost:8080.
2.  Lay mat khau khoi tao:
    ```bash
    docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
    ```
3.  Cai dat Plugins goi y (Install suggested plugins).
4.  Tao tai khoan Admin.
5.  Tao Pipeline Job moi:
    - Chon Pipeline script from SCM.
    - SCM: Git -> Dien URL Repo GitHub cua ban.
    - Branch: */main.
    - Script Path: Jenkinsfile.
    - Save & Build Now (Lan dau tien phai kich hoat thu cong).

---

## Don dep he thong
De tat va xoa sach moi truong sau khi demo:
```bash
docker-compose down -v
```

---

## Thong tin nhom
- MSSV: 23127132
- Email: 23127132@student.hcmus.edu.vn