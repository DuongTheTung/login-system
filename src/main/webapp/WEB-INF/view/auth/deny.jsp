<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <jsp:include page="/WEB-INF/view/layout/header.jsp" />

            <div class="row justify-content-center mt-5 mb-5">
                <div class="col-md-6">
                    <div class="text-center p-5 rounded-4 shadow-sm bg-white border border-danger border-opacity-25">
                        <h1 class="display-1 text-danger fw-bold"><i class="fa-solid fa-triangle-exclamation"></i> 403
                        </h1>
                        <h2 class="h3 mb-3">Truy cập bị từ chối</h2>
                        <p class="text-muted mb-4">Bạn không có quyền truy cập vào trang này. Vui lòng liên hệ quản trị
                            viên nếu bạn nghĩ đây là lỗi.</p>
                        <a href="/" class="btn btn-primary px-4"><i class="fa-solid fa-house me-2"></i>Về Trang Chủ</a>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/layout/footer.jsp" />