<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Đổi mật khẩu</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
            </head>

            <body class="sb-nav-fixed">

                <!-- Header -->
                <jsp:include page="../layout/header.jsp"></jsp:include>

                <div id="layoutSidenav">

                    <!-- Sidebar -->
                    <jsp:include page="../layout/sidebar.jsp"></jsp:include>

                    <div id="layoutSidenav_content">
                        <main>

                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Đổi mật khẩu</h1>
                                <hr />

                                <div class="row">
                                    <div class="col-md-6 mx-auto">

                                        <!-- Thông báo -->
                                        <c:if test="${error != null}">
                                            <div class="alert alert-danger">${error}</div>
                                        </c:if>

                                        <c:if test="${success != null}">
                                            <div class="alert alert-success">${success}</div>
                                        </c:if>

                                        <!-- Form -->
                                        <form action="/change-password" method="post">

                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                            <div class="mb-3">
                                                <label class="form-label">Mật khẩu hiện tại</label>
                                                <input type="password" name="oldPassword" class="form-control"
                                                    required />
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Mật khẩu mới</label>
                                                <input type="password" name="newPassword" class="form-control"
                                                    required />
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Xác nhận mật khẩu</label>
                                                <input type="password" name="confirmPassword" class="form-control"
                                                    required />
                                            </div>

                                            <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>

                                            <a href="/" class="btn btn-secondary">Về trang chủ</a>
                                        </form>

                                    </div>
                                </div>

                            </div>

                        </main>

                        <!-- Footer -->
                        <jsp:include page="../layout/footer.jsp"></jsp:include>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>