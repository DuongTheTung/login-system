<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <style>
            /* Màu đỏ đô đặc trưng của PTIT */
            .bg-custom-red {
                background-color: #a31d24 !important;
            }

            .navbar-brand {
                font-size: 1.2rem;
                font-weight: bold;
            }

            /* Tùy chỉnh Avatar và thông tin cạnh Avatar */
            .user-info-header {
                color: white;
                line-height: 1.2;
                text-align: right;
                margin-right: 10px;
            }

            .user-info-header .name {
                font-weight: 500;
                font-size: 0.9rem;
                display: block;
            }

            .user-info-header .id {
                font-size: 0.8rem;
                opacity: 0.9;
            }

            .avatar-circle {
                width: 35px;
                height: 35px;
                border-radius: 50%;
                border: 2px solid rgba(255, 255, 255, 0.5);
                object-fit: cover;
            }

            /* Menu xổ xuống giống ảnh mẫu */
            .dropdown-menu-custom {
                width: 250px;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                border: none;
                padding: 10px 0;
            }

            .dropdown-item-info {
                padding: 5px 20px;
                font-size: 0.9rem;
            }

            .logout-btn {
                color: #d9534f !important;
                font-weight: bold;
            }

            .logout-btn:hover {
                background-color: #f8d7da;
            }
        </style>

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-custom-red">
            <a class="navbar-brand ps-3" href="/">Start Bootstrap</a>

            <div class="ms-auto"></div>

            <ul class="navbar-nav align-items-center me-3">


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center text-white" id="navbarDropdown"
                        href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">

                        <div class="user-info-header d-none d-sm-block">
                            <span class="name">${fullName}</span>
                            <span class="id">B23DCCN${id}</span>
                        </div>

                        <c:set var="avatarPath" value="${not empty user.avatar ? user.avatar : 'default.png'}" />
                        <img src="/images/avatar/${avatarPath}" class="avatar-circle" alt="Avatar">
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-custom shadow"
                        aria-labelledby="navbarDropdown">
                        <li class="dropdown-item-info">
                            <i class="fa-solid fa-address-card me-2"></i> Họ tên: <strong>${fullName}</strong>
                        </li>
                        <li class="dropdown-item-info">
                            <i class="fa-solid fa-user-tag me-2"></i> Tài khoản: <strong>B23DCCN${id}</strong>
                        </li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>

                        <li><a class="dropdown-item" href="/"><i class="fa-solid fa-user-gear me-2"></i> Thông tin cá
                                nhân</a></li>
                        <li><a class="dropdown-item" href="/change-password"><i class="fa-solid fa-key me-2"></i> Đổi
                                mật khẩu</a></li>
                        <li><a class="dropdown-item" href="/update/${id}"><i class="fa-solid fa-user-gear me-2"></i>
                                Update Thông tin cá
                                nhân</a></li>

                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li>
                            <form method="post" action="/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button class="dropdown-item logout-btn">
                                    <i class="fa-solid fa-right-from-bracket me-2"></i> Đăng xuất
                                </button>
                            </form>
                        </li>
                    </ul>
                </li>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
            </ul>

        </nav>