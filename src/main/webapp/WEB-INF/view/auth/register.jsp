<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/view/layout/header.jsp" />

<div class="row justify-content-center mt-5 mb-5">
    <div class="col-md-8 col-lg-6">
        <div class="card shadow border-0 rounded-4">
            <div class="card-body p-5">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-success">Đăng Ký Tài Khoản</h2>
                    <p class="text-muted">Nhập thông tin của bạn để tạo tài khoản mới</p>
                </div>

                <form:form action="/register" method="post" modelAttribute="registerUser">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="row mb-3">
                        <div class="col-md-6 form-floating">
                            <form:input path="firstName" cssClass="form-control" id="firstName" placeholder="First Name"/>
                            <label for="firstName" class="ms-2">Họ</label>
                            <form:errors path="firstName" cssClass="text-danger small mt-1 d-block" />
                        </div>
                        <div class="col-md-6 form-floating mt-3 mt-md-0">
                            <form:input path="lastName" cssClass="form-control" id="lastName" placeholder="Last Name"/>
                            <label for="lastName" class="ms-2">Tên</label>
                            <form:errors path="lastName" cssClass="text-danger small mt-1 d-block" />
                        </div>
                    </div>

                    <div class="form-floating mb-3">
                        <form:input path="email" type="email" cssClass="form-control" id="email" placeholder="Email"/>
                        <label for="email">Địa chỉ Email</label>
                        <form:errors path="email" cssClass="text-danger small mt-1 d-block" />
                    </div>

                    <div class="form-floating mb-3">
                        <form:password path="password" cssClass="form-control" id="password" placeholder="Password"/>
                        <label for="password">Mật khẩu</label>
                        <div class="form-text text-muted small mt-1 px-2">Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt (@#$%^&+=!*()).</div>
                        <form:errors path="password" cssClass="text-danger small mt-1 d-block px-2" />
                    </div>

                    <div class="form-floating mb-4">
                        <form:password path="confirmPassword" cssClass="form-control" id="confirmPassword" placeholder="Confirm Password"/>
                        <label for="confirmPassword">Xác nhận mật khẩu</label>
                        <form:errors path="confirmPassword" cssClass="text-danger small mt-1 d-block" />
                    </div>

                    <button class="btn btn-success w-100 py-2 mb-3" type="submit">Đăng Ký</button>
                    
                    <div class="text-center text-muted">
                        Đã có tài khoản? <a href="/login" class="text-decoration-none fw-semibold">Đăng nhập ngay</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layout/footer.jsp" />
