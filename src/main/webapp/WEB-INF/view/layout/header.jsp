<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login System</title>
                <!-- Bootstrap 5 CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Font Awesome -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
                <style>
                    body {
                        background-color: #f8f9fa;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    }

                    .navbar-brand {
                        font-weight: bold;
                        color: #0d6efd !important;
                    }

                    .avatar-img {
                        width: 38px;
                        height: 38px;
                        object-fit: cover;
                        border-radius: 50%;
                        border: 2px solid #fff;
                        box-shadow: 0 0 3px rgba(0, 0, 0, 0.2);
                    }

                    .card {
                        border: none;
                        border-radius: 10px;
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
                    }

                    .form-control:focus {
                        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
                    }

                    .btn-primary {
                        background-color: #0d6efd;
                        border: none;
                        padding: 10px 20px;
                        border-radius: 8px;
                        font-weight: 500;
                    }

                    .btn-primary:hover {
                        background-color: #0b5ed7;
                        transform: translateY(-1px);
                        box-shadow: 0 4px 8px rgba(13, 110, 253, 0.2);
                    }
                </style>
            </head>

            <body>

                <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm mb-4">
                    <div class="container">
                        <!-- Brand removed as requested -->

                        <button class="navbar-toggler" type="-button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNav">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" href="/"><i class="fa-solid fa-house me-1"></i>Trang
                                        chủ</a>
                                </li>
                            </ul>

                            <div class="d-flex align-items-center">
                                <c:choose>
                                    <c:when test="${not empty pageContext.request.userPrincipal}">
                                        <ul class="navbar-nav">
                                            <!-- Quản lý User (Chỉ Admin) -->
                                            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                                                <li class="nav-item me-3">
                                                    <a class="nav-link text-primary fw-semibold" href="/admin">
                                                        Dashboard
                                                    </a>
                                                </li>
                                                <li class="nav-item me-3">
                                                    <a class="nav-link text-danger fw-semibold" href="/admin/user">
                                                        Quản lý User
                                                    </a>
                                                </li>
                                            </c:if>

                                            <!-- Dropdown User -->
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle d-flex align-items-center gap-2"
                                                    href="#" id="userDropdown" role="button" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                    <c:choose>
                                                        <c:when test="${not empty currentUser.avatar}">
                                                            <img src="/images/avatar/${currentUser.avatar}" alt="Avatar"
                                                                class="avatar-img">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="https://ui-avatars.com/api/?name=${currentUser.fullName}&background=random"
                                                                alt="Avatar" class="avatar-img">
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <span class="fw-semibold text-dark">${currentUser.fullName}</span>
                                                </a>
                                                <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0"
                                                    aria-labelledby="userDropdown">
                                                    <li><a class="dropdown-item py-2" href="/"><i
                                                                class="fa-solid fa-id-card me-2 text-primary"></i>Thông
                                                            tin cá nhân</a></li>
                                                    <li><a class="dropdown-item py-2"
                                                            href="/update/${currentUser.id}"><i
                                                                class="fa-solid fa-user-pen me-2 text-success"></i>Đổi
                                                            thông tin cá nhân</a></li>
                                                    <li><a class="dropdown-item py-2" href="/change-password"><i
                                                                class="fa-solid fa-key me-2 text-warning"></i>Đổi mật
                                                            khẩu</a></li>
                                                    <li>
                                                        <hr class="dropdown-divider">
                                                    </li>
                                                    <li>
                                                        <form action="/logout" method="POST" class="m-0 p-0">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button type="submit"
                                                                class="dropdown-item py-2 text-danger">
                                                                <i class="fa-solid fa-right-from-bracket me-2"></i>Đăng
                                                                xuất
                                                            </button>
                                                        </form>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/login" class="btn btn-outline-primary me-2 px-4 rounded-pill">Đăng
                                            nhập</a>
                                        <a href="/register" class="btn btn-primary px-4 rounded-pill">Đăng ký</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </nav>

                <!-- Nội dung chính -->
                <div class="container min-vh-100">