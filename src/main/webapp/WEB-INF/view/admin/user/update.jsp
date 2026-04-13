<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <jsp:include page="/WEB-INF/view/layout/header.jsp" />

            <div class="row justify-content-center pt-4 mb-5">
                <div class="col-md-10 col-lg-8">
                    <div class="card shadow-sm border-0 bg-white">
                        <div
                            class="card-header bg-white border-bottom-0 pt-4 pb-0 d-flex justify-content-between align-items-center">
                            <h4 class="fw-bold text-success mb-0"><i class="fa-solid fa-user-pen me-2"></i>Sửa Thông Tin
                                Người Dùng</h4>
                            <a href="/admin/user" class="btn btn-sm btn-outline-secondary"><i
                                    class="fa-solid fa-arrow-left me-1"></i>Trở lại danh sách</a>
                        </div>
                        <div class="card-body p-4">

                            <form:form action="/admin/user/update" method="post" modelAttribute="newUser"
                                enctype="multipart/form-data" class="needs-validation">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <form:hidden path="id" />

                                <div class="row">
                                    <!-- Cột Trái -->
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="email" class="form-label fw-semibold">Email <span
                                                    class="text-muted fw-normal">(Không thể sửa)</span></label>
                                            <form:input path="email" type="email" cssClass="form-control bg-light"
                                                id="email" readonly="true" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="password" class="form-label fw-semibold">Mật khẩu mới <span
                                                    class="text-muted fw-normal">(Để trống nếu không đổi)</span></label>
                                            <form:password path="password" cssClass="form-control" id="password"
                                                value="" />
                                            <form:errors path="password" cssClass="text-danger small mt-1 d-block" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="fullName" class="form-label fw-semibold">Họ và Tên <span
                                                    class="text-danger">*</span></label>
                                            <form:input path="fullName" cssClass="form-control" id="fullName"
                                                required="true" />
                                            <form:errors path="fullName" cssClass="text-danger small mt-1 d-block" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="roleName" class="form-label fw-semibold">Vai trò <span
                                                    class="text-danger">*</span></label>
                                            <select name="role.name" class="form-select" id="roleName" required>
                                                <option value="USER" ${newUser.role.name=='USER' ? 'selected' : '' }>
                                                    USER</option>
                                                <option value="ADMIN" ${newUser.role.name=='ADMIN' ? 'selected' : '' }>
                                                    ADMIN</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Cột Phải -->
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="phone" class="form-label fw-semibold">Số điện thoại</label>
                                            <form:input path="phone" cssClass="form-control" id="phone" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="address" class="form-label fw-semibold">Địa chỉ</label>
                                            <form:input path="address" cssClass="form-control" id="address" />
                                        </div>

                                        <div class="mb-4">
                                            <label for="userFile" class="form-label fw-semibold">Avatar <span
                                                    class="text-muted fw-normal">(Chọn để cập nhật)</span></label>
                                            <input type="file" id="userFile" name="userFile" class="form-control"
                                                accept="image/*" onchange="previewImage(this);">
                                            <div class="mt-3 text-center">
                                                <c:choose>
                                                    <c:when test="${not empty newUser.avatar}">
                                                        <img src="/images/avatar/${newUser.avatar}" id="avatarPreview"
                                                            class="img-fluid rounded-circle shadow-sm"
                                                            style="width: 100px; height: 100px; object-fit: cover;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="https://ui-avatars.com/api/?name=${newUser.fullName}&background=random"
                                                            id="avatarPreview"
                                                            class="img-fluid rounded-circle shadow-sm"
                                                            style="width: 100px; height: 100px; object-fit: cover;">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr class="my-4">

                                <div class="text-end">
                                    <button type="submit" class="btn btn-success px-5"><i
                                            class="fa-solid fa-floppy-disk me-2"></i>Lưu Thay Đổi</button>
                                </div>

                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function previewImage(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            const preview = document.getElementById('avatarPreview');
                            preview.src = e.target.result;
                        }
                        reader.readAsDataURL(input.files[0]);
                    }
                }
            </script>

            <jsp:include page="/WEB-INF/view/layout/footer.jsp" />