<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <jsp:include page="/WEB-INF/view/layout/header.jsp" />

            <div class="row justify-content-center mt-5 mb-5">
                <div class="col-md-6 col-lg-4">
                    <div class="card shadow border-0 rounded-4">
                        <div class="card-body p-5">
                            <div class="text-center mb-4">
                                <h2 class="fw-bold text-primary">Đăng Nhập</h2>
                                <p class="text-muted">Nhập email và mật khẩu của bạn</p>
                            </div>

                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger" role="alert">
                                    Sai tài khoản hoặc mật khẩu!
                                </div>
                            </c:if>
                            <c:if test="${param.logout != null}">
                                <div class="alert alert-success" role="alert">
                                    Đăng xuất thành công!
                                </div>
                            </c:if>

                            <form action="/login" method="post" class="needs-validation" novalidate>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="username" name="username"
                                        placeholder="Email" required autofocus>
                                    <label for="username">Email</label>
                                    <div class="invalid-feedback">
                                        Vui lòng nhập Email.
                                    </div>
                                </div>

                                <div class="form-floating mb-4">
                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="Password" required>
                                    <label for="password">Mật khẩu</label>
                                    <div class="invalid-feedback">
                                        Vui lòng nhập Mật khẩu.
                                    </div>
                                </div>



                                <button class="btn btn-primary w-100 py-2 mb-3" type="submit">Đăng nhập</button>

                                <div class="text-center text-muted mt-3">
                                    Chưa có tài khoản? <a href="/register" class="text-decoration-none fw-semibold">Đăng
                                        ký ngay</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/layout/footer.jsp" />