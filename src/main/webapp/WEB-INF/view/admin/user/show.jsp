<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <jsp:include page="/WEB-INF/view/layout/header.jsp" />

            <div class="row pt-4 mb-5">
                <div class="col-12">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="fw-bold text-dark mb-0"><i class="fa-solid fa-users-gear me-2 text-primary"></i>Quản
                            lý người dùng</h3>
                        <a href="/admin/user/create" class="btn btn-primary"><i class="fa-solid fa-plus me-1"></i>Thêm
                            người dùng</a>
                    </div>

                    <div class="card shadow-sm border-0 bg-white">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th class="ps-4">ID</th>
                                            <th>Avatar</th>
                                            <th>Học và Tên</th>
                                            <th>Email</th>
                                            <th>Vai trò</th>
                                            <th class="pe-4 text-end">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="u" items="${users1}">
                                            <tr>
                                                <td class="ps-4 text-muted">#${u.id}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty u.avatar}">
                                                            <img src="/images/avatar/${u.avatar}" alt="Avatar"
                                                                class="rounded-circle object-fit-cover" width="40"
                                                                height="40">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="https://ui-avatars.com/api/?name=${u.fullName}&background=random"
                                                                alt="Avatar" class="rounded-circle object-fit-cover"
                                                                width="40" height="40">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="fw-medium text-dark">${u.fullName}</td>
                                                <td>${u.email}</td>
                                                <td>
                                                    <span
                                                        class="badge ${u.role.name == 'ADMIN' ? 'bg-danger' : 'bg-primary'} rounded-pill px-3">
                                                        ${u.role.name}
                                                    </span>
                                                </td>
                                                <td class="pe-4 text-end">
                                                    <div class="btn-group" role="group">
                                                        <a href="/admin/user/${u.id}"
                                                            class="btn btn-sm btn-outline-info" title="Xem chi tiết"><i
                                                                class="fa-solid fa-eye"></i></a>
                                                        <a href="/admin/user/update/${u.id}"
                                                            class="btn btn-sm btn-outline-success" title="Sửa"><i
                                                                class="fa-solid fa-pen"></i></a>
                                                        <a href="/admin/user/delete/${u.id}"
                                                            class="btn btn-sm btn-outline-danger" title="Xóa"><i
                                                                class="fa-solid fa-trash"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty users1}">
                                            <tr>
                                                <td colspan="6" class="text-center py-4 text-muted">Không có người dùng
                                                    nào!</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/layout/footer.jsp" />