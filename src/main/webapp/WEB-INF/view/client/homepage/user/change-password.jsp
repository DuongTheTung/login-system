<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <jsp:include page="/WEB-INF/view/layout/header.jsp" />

            <div class="row justify-content-center pt-4 mb-5">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow-sm border-0 bg-white">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                            <h4 class="fw-bold text-warning mb-0"><i class="fa-solid fa-key me-2"></i>Đổi Mật Khẩu</h4>
                        </div>
                        <div class="card-body p-4">

                            <c:if test="${not empty error}">
                                <div class="alert alert-danger" role="alert">
                                    <i class="fa-solid fa-circle-exclamation me-1"></i> ${error}
                                </div>
                            </c:if>

                            <c:if test="${not empty success}">
                                <div class="alert alert-success" role="alert">
                                    <i class="fa-solid fa-circle-check me-1"></i> ${success}
                                </div>
                            </c:if>

                            <form action="/change-password" method="post" class="needs-validation">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="mb-3">
                                    <label for="oldPassword" class="form-label fw-semibold">Mật khẩu hiện tại</label>
                                    <input type="password" class="form-control" id="oldPassword" name="oldPassword"
                                        required>
                                </div>

                                <div class="mb-3">
                                    <label for="newPassword" class="form-label fw-semibold">Mật khẩu mới</label>
                                    <input type="password" class="form-control" id="newPassword" name="newPassword"
                                        required minlength="2">
                                    <div class="form-text">Mật khẩu phải có ít nhất 2 ký tự.</div>
                                </div>

                                <div class="mb-4">
                                    <label for="confirmPassword" class="form-label fw-semibold">Xác nhận mật khẩu
                                        mới</label>
                                    <input type="password" class="form-control" id="confirmPassword"
                                        name="confirmPassword" required minlength="2">
                                </div>

                                <div class="d-flex gap-2">
                                    <a href="/" class="btn btn-secondary px-4">Hủy</a>
                                    <button type="submit" class="btn btn-warning px-4 text-dark fw-medium">Lưu Thay
                                        Đổi</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/layout/footer.jsp" />