# CI/CD Demo Project - Docker Edition

## Giới thiệu
Dự án demo quy trình CI/CD tự động hóa việc triển khai ứng dụng Web.
Hệ thống sử dụng Jenkins chạy trên Docker để xây dựng và triển khai ứng dụng mỗi khi có thay đổi mã nguồn.

## Kiến trúc hệ thống
1.  Source Control: GitHub
2.  CI/CD Server: Jenkins (chạy trong Docker Container)
3.  Deployment: Web App (Nginx chạy trong Docker Container)
4.  Flow:
    - Commit code -> GitHub
    - Jenkins quét GitHub mỗi phút
    - Khi phát hiện thay đổi: Jenkins Pull code -> Build Docker Image -> Deploy Container mới

## Cấu trúc Project
- index.html: Mã nguồn Web App
- Dockerfile: Cấu hình Docker cho Web App
- Dockerfile.jenkins: Custom Image cho Jenkins (kèm sẵn Docker CLI)
- docker-compose.yml: Script thông báo cho docker-compose cần dựng những gì khi chạy (Jenkins + Web)
- Jenkinsfile: Script cho Jenkins (Build & Deploy Steps)
- start.bat: Script khởi động nhanh cho Windows
- README.md: Hướng dẫn sử dụng

---

## Khởi động nhanh (Quick Start)

### Yêu cầu
- Docker Desktop, Docker Engine phải đang chạy sẵn
- Git

### Bước 1: Khởi động hệ thống
Đơn giản nhất ta chỉ cần chạy file .bat:
```bash
start.bat
```
Hoặc dùng lệnh
```bash
docker-compose up -d --build
```

### Bước 2: Truy cập
- Jenkins (CI/CD): http://localhost:8080
- Web App (Sản phẩm web): http://localhost:8081

---

## Hướng dẫn demo CI/CD tự động

Để kiểm chứng tính năng tự động, ta thực hiện các bước:

1.  Kiểm tra trạng thái hiện tại:
    - Mở Web App tại http://localhost:8081.

2.  Tao thay doi:
    - Mở file index.html.
    - Sửa tiêu đề/màu nền/script
    - Lưu file.

3.  Đẩy code lên GitHub:
    Mở terminal và chạy:
    ```bash
    git add .
    git commit -m "Update web content for Demo"
    git push origin main
    ```

4.  Quan sát tự động hóa:
    - Truy cập lại trang Jenkins.
    - Chờ khoảng 1 phút.
    - Ta sẽ thấy Job CI/CD tự động chạy (Build đang xử lí).

5.  Kiểm tra kết quả:
    - Sau khi Build thành công, quay lại sản phẩm web: http://localhost:8081.
    - Reload trang, ta thấy các chỉnh sửa đã push lên Git được áp dụng.

---

## Cài đặt Jenkins lần đầu
Nếu xóa toàn bộ các image lẫn volume, hay mới chạy lần đầu, ta cần thiết lập:

1.  Truy cập http://localhost:8080.
2.  Chạy lệnh sau để lấy mật khẩu admin tạm:
    ```bash
    docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
    ```
3.  Cài các plugin cho Jenkins (chọn các cài đặt được gợi ý).
4.  Tạo tài khoản Admin mới.
5.  Tạo job mới:
    - Chọn Pipeline, đặt tên cho job này
    - Chọn Pipeline script from SCM.
    - SCM: Git -> Điền URL Repo GitHub.
    - Branch: */main.
    - Script Path: Jenkinsfile.
    - Save & Build Now (lần đầu thiết lập ta phải chạy build lần đầu).

---

## Dọn dẹp
Để tắt và xóa sạch môi trường sau khi demo:
```bash
docker-compose down -v
```
- ```-v``` nghĩa là xóa luôn cả volume, dẫn đến mất mát dữ liệu, trong trường hợp này toàn bộ dữ liệu về Jenkins bị mất và ta phải tạo tài khoản và cài lại plugin từ đầu.
---

## Thông tin các thành viên nhóm:
### Phạm Minh Triết:
- MSSV: 23127132
- Email: 23127132@student.hcmus.edu.vn
### Nguyễn Đức Nhật Minh
- MSSV: 23127421
- Email: 23127421@student.hcmus.edu.vn