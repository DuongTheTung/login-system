<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Thông tin sinh viên</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <style>
                body {
                    background-color: #f8f9fa;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                }

                .welcome-section {
                    margin-bottom: 20px;
                }

                .student-card {
                    border: 1px solid #dc3545;
                    /* Màu đỏ đô đặc trưng */
                    border-radius: 8px;
                    background: #fff;
                    overflow: hidden;
                }

                .card-header-custom {
                    background-color: #fff;
                    padding: 10px 15px;
                    border-bottom: 1px solid #eee;
                    color: #333;
                    font-weight: bold;
                    display: flex;
                    align-items: center;
                }

                .card-header-custom i {
                    color: #dc3545;
                    margin-right: 8px;
                }

                .info-container {
                    padding: 20px;
                    display: flex;
                }

                .avatar-box {
                    width: 150px;
                    margin-right: 30px;
                    text-align: center;
                }

                .avatar-box img {
                    width: 120px;
                    height: 160px;
                    object-fit: cover;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                }

                .details-grid {
                    display: grid;
                    grid-template-columns: 1fr 1fr 1fr;
                    /* Chia 3 cột như ảnh */
                    width: 100%;
                    gap: 10px;
                }

                .info-item {
                    display: flex;
                    margin-bottom: 8px;
                    font-size: 14px;
                }

                .label {
                    min-width: 110px;
                    color: #555;
                }

                .value {
                    font-weight: 600;
                    color: #000;
                }

                /* Đường kẻ dọc ngăn cách các cột */
                .grid-col {
                    padding: 0 15px;
                    border-right: 1px solid #eee;
                }

                .grid-col:last-child {
                    border-right: none;
                }
            </style>
        </head>

        <body>
            <jsp:include page="../layout/header.jsp"></jsp:include>
            <div id="layoutSidenav">
                <div class="container mt-4">

                    <div class="welcome-section">
                        <h4 class="fw-bold">👋 Chào mừng ${fullName}</h4>
                    </div>

                    <div class="student-card shadow-sm">
                        <div class="card-header-custom">
                            <i class="fa-solid fa-user"></i> Thông tin sinh viên
                        </div>

                        <div class="info-container">
                            <div class="avatar-box">
                                <c:choose>
                                    <c:when test="${not empty user.avatar}">
                                        <img src="/images/avatar/${user.avatar}" alt="Avatar">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/120x160?text=No+Image"
                                            alt="Default Avatar">
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="details-grid">
                                <div class="grid-col">
                                    <div class="info-item">
                                        <span class="label">Mã SV:</span>
                                        <span class="value">B23DCCN${user.id}</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Tên sinh viên:</span>
                                        <span class="value">${user.fullName}</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Ngày sinh:</span>
                                        <span class="value">19/02/2005</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Giới tính:</span>
                                        <span class="value">Nam</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Trạng thái:</span>
                                        <span class="value text-success">Đang học</span>
                                    </div>
                                </div>

                                <div class="grid-col">
                                    <div class="info-item">
                                        <span class="label">Số điện thoại:</span>
                                        <span class="value">${user.phone}</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Số CMND/ CCCD:</span>
                                        <span class="value"></span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Dân tộc:</span>
                                        <span class="value">Kinh</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Tôn giáo:</span>
                                        <span class="value">Không</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Nơi sinh:</span>
                                        <span class="value">${user.address}</span>
                                    </div>
                                </div>

                                <div class="grid-col">
                                    <div class="info-item">
                                        <span class="label">Quốc tịch:</span>
                                        <span class="value">Việt Nam</span>
                                    </div>
                                    <div class="info-item">
                                        <span class="label">Email 1:</span>
                                        <span class="value">${email}</span>
                                    </div>

                                    <div class="info-item">
                                        <span class="label">Địa chỉ:</span>
                                        <span class="value">${user.address}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>


        </html>