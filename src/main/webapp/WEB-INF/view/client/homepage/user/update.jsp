<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <jsp:include page="/WEB-INF/view/layout/header.jsp" />

            <div class="row justify-content-center pt-4 mb-5">
                <div class="col-md-8 col-lg-6">
                    <div class="card shadow-sm border-0 bg-white">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                            <h4 class="fw-bold text-success mb-0"><i class="fa-solid fa-user-pen me-2"></i>Cập nhật
                                thông tin</h4>
                        </div>
                        <div class="card-body p-4">

                            <form:form action="/update" method="post" modelAttribute="newUser"
                                enctype="multipart/form-data" class="needs-validation">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <form:hidden path="id" />

                                <div class="text-center mb-4">
                                    <div class="position-relative d-inline-block" style="width: 120px; height: 120px;">
                                        <c:choose>
                                            <c:when test="${not empty newUser.avatar}">
                                                <img src="/images/avatar/${newUser.avatar}" id="avatarPreview"
                                                    class="img-fluid rounded-circle shadow-sm"
                                                    style="width: 120px; height: 120px; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://ui-avatars.com/api/?name=${newUser.fullName}&background=random&size=120"
                                                    id="avatarPreview" class="img-fluid rounded-circle shadow-sm"
                                                    style="width: 120px; height: 120px; object-fit: cover;">
                                            </c:otherwise>
                                        </c:choose>
                                        <label for="userFile"
                                            class="position-absolute bottom-0 end-0 bg-primary text-white rounded-circle p-2"
                                            style="cursor: pointer; transform: translate(10%, 10%); width: 35px; height: 35px; display: flex; align-items: center; justify-content: center; box-shadow: 0 2px 4px rgba(0,0,0,0.2);">
                                            <i class="fa-solid fa-camera small"></i>
                                        </label>
                                        <input type="file" id="userFile" name="userFile" class="d-none" accept="image/*"
                                            onchange="previewImage(this);">
                                    </div>
                                    <div class="small text-muted mt-2">Nhấn vào icon máy ảnh để đổi avatar</div>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label fw-semibold">Email <span
                                            class="text-muted fw-normal">(Không thể thay đổi)</span></label>
                                    <form:input path="email" cssClass="form-control bg-light" id="email"
                                        readonly="true" />
                                </div>

                                <div class="mb-3">
                                    <label for="fullName" class="form-label fw-semibold">Họ và Tên</label>
                                    <form:input path="fullName" cssClass="form-control" id="fullName" required="true" />
                                    <form:errors path="fullName" cssClass="text-danger small mt-1 d-block" />
                                </div>

                                <div class="mb-3">
                                    <label for="birthday" class="form-label fw-semibold">Ngày sinh</label>
                                    <form:input path="birthday" type="date" cssClass="form-control" id="birthday" />
                                </div>

                                <div class="mb-3">
                                    <label for="phone" class="form-label fw-semibold">Số điện thoại</label>
                                    <form:input path="phone" cssClass="form-control" id="phone" />
                                </div>

                                <div class="mb-4">
                                    <label for="address" class="form-label fw-semibold">Địa chỉ</label>
                                    <form:input path="address" cssClass="form-control" id="address" />
                                </div>

                                <div class="d-flex gap-2">
                                    <a href="/" class="btn btn-secondary px-4">Hủy</a>
                                    <button type="submit" class="btn btn-success px-4">Lưu Thay Đổi</button>
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
                            document.getElementById('avatarPreview').src = e.target.result;
                        }
                        reader.readAsDataURL(input.files[0]);
                    }
                }
            </script>

            <jsp:include page="/WEB-INF/view/layout/footer.jsp" />