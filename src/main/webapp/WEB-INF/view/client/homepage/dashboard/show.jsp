<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
            <jsp:include page="/WEB-INF/view/layout/header.jsp" />

            <div class="row pt-4 mb-5">
                <!-- Sidebar / Left column -->
                <div class="col-md-4 col-lg-3 mb-4">
                    <div class="card shadow-sm border-0 bg-white">
                        <div class="card-body text-center p-4">
                            <c:choose>
                                <c:when test="${not empty user.avatar}">
                                    <img src="/images/avatar/${user.avatar}" alt="Avatar"
                                        class="img-fluid rounded-circle mb-3 shadow"
                                        style="width: 150px; height: 150px; object-fit: cover; border: 4px solid #fff;">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://ui-avatars.com/api/?name=${user.fullName}&background=random&size=150"
                                        alt="Avatar" class="img-fluid rounded-circle mb-3 shadow"
                                        style="width: 150px; height: 150px; object-fit: cover; border: 4px solid #fff;">
                                </c:otherwise>
                            </c:choose>

                            <h4 class="mb-1 fw-bold">${user.fullName}</h4>
                            <p class="text-muted small mb-3">${user.role.name == "ADMIN" ? "Quản trị viên" : "Thành
                                viên"}</p>
                            <div class="d-grid gap-2">
                                <a href="/update/${user.id}" class="btn btn-outline-primary btn-sm"><i
                                        class="fa-solid fa-pen-to-square me-1"></i>Sửa thông tin</a>
                                <a href="/change-password" class="btn btn-outline-warning btn-sm"><i
                                        class="fa-solid fa-key me-1"></i>Đổi mật khẩu</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main content / Right column -->
                <div class="col-md-8 col-lg-9">
                    <div class="card shadow-sm border-0 bg-white h-100">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                            <h5 class="fw-bold mb-0 text-primary"><i class="fa-solid fa-user me-2"></i>Thông tin cá nhân
                            </h5>
                        </div>
                        <div class="card-body p-4">
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 text-muted">Họ và Tên</h6>
                                </div>
                                <div class="col-sm-9 text-dark fw-medium">
                                    ${user.fullName}
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 text-muted">Email</h6>
                                </div>
                                <div class="col-sm-9 text-dark fw-medium">
                                    ${user.email}
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 text-muted">Số điện thoại</h6>
                                </div>
                                <div class="col-sm-9 text-dark fw-medium">
                                    ${not empty user.phone ? user.phone : '<em>Chưa cập nhật</em>'}
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 text-muted">Địa chỉ</h6>
                                </div>
                                <div class="col-sm-9 text-dark fw-medium">
                                    ${not empty user.address ? user.address : '<em>Chưa cập nhật</em>'}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/layout/footer.jsp" />