<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <jsp:include page="/WEB-INF/view/layout/header.jsp" />

            <div class="row pt-4 mb-5 justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card shadow-sm border-0 bg-white">
                        <div
                            class="card-header bg-white border-bottom-0 pt-4 pb-0 d-flex justify-content-between align-items-center">
                            <h4 class="fw-bold text-info mb-0"><i class="fa-solid fa-address-card me-2"></i>Chi tiết
                                Người dùng</h4>
                            <a href="/admin/user" class="btn btn-sm btn-outline-secondary"><i
                                    class="fa-solid fa-arrow-left me-1"></i>Trở lại</a>
                        </div>
                        <div class="card-body p-4 text-center text-md-start">

                            <div class="row align-items-center mb-4">
                                <div class="col-md-4 text-center mb-3 mb-md-0">
                                    <c:choose>
                                        <c:when test="${not empty user.avatar}">
                                            <img src="/images/avatar/${user.avatar}" alt="Avatar"
                                                class="img-fluid rounded-circle shadow"
                                                style="width: 130px; height: 130px; object-fit: cover; border: 3px solid #f8f9fa;">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="https://ui-avatars.com/api/?name=${user.fullName}&background=random&size=130"
                                                alt="Avatar" class="img-fluid rounded-circle shadow"
                                                style="width: 130px; height: 130px; object-fit: cover; border: 3px solid #f8f9fa;">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="mt-3">
                                        <span
                                            class="badge ${user.role.name == 'ADMIN' ? 'bg-danger' : 'bg-primary'} px-3 py-2 rounded-pill shadow-sm">
                                            ${user.role.name}
                                        </span>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <h4 class="fw-bold mb-3">${user.fullName}</h4>

                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fa-solid fa-envelope text-muted me-3" style="width: 20px;"></i>
                                        <span class="fs-6">${user.email}</span>
                                    </div>

                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fa-solid fa-phone text-muted me-3" style="width: 20px;"></i>
                                        <span class="fs-6">${not empty user.phone ? user.phone : '<em
                                                class="text-muted">Chưa cập nhật</em>'}</span>
                                    </div>

                                    <div class="d-flex align-items-start mb-2">
                                        <i class="fa-solid fa-location-dot text-muted me-3 mt-1"
                                            style="width: 20px;"></i>
                                        <span class="fs-6">${not empty user.address ? user.address : '<em
                                                class="text-muted">Chưa cập nhật</em>'}</span>
                                    </div>
                                </div>
                            </div>

                            <hr class="mb-4">

                            <div class="d-flex justify-content-center gap-2">
                                <a href="/admin/user/update/${user.id}" class="btn btn-success px-4"><i
                                        class="fa-solid fa-pen-to-square me-2"></i>Sửa</a>
                                <a href="/admin/user/delete/${user.id}" class="btn btn-danger px-4"><i
                                        class="fa-solid fa-trash me-2"></i>Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/layout/footer.jsp" />