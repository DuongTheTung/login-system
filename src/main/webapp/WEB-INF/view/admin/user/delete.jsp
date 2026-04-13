<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/view/layout/header.jsp" />

<div class="row pt-5 justify-content-center">
    <div class="col-md-6 col-lg-5">
        <div class="card shadow border-danger border-opacity-50 bg-white border-2">
            <div class="card-body p-5 text-center">
                <div class="text-danger mb-4">
                    <i class="fa-solid fa-triangle-exclamation" style="font-size: 5rem;"></i>
                </div>
                
                <h3 class="fw-bold text-dark mb-3">Xóa Người Dùng</h3>
                
                <p class="text-muted fs-5 mb-4">
                    Bạn có chắc chắn muốn xóa người dùng <strong class="text-dark">${newUser.email}</strong> không? Hành động này không thể hoàn tác.
                </p>

                <form:form action="/admin/user/delete" method="post" modelAttribute="newUser">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <form:hidden path="id" />
                    <div class="d-flex justify-content-center gap-3">
                        <a href="/admin/user" class="btn btn-secondary px-4 py-2">Hủy bỏ</a>
                        <button type="submit" class="btn btn-danger px-4 py-2"><i class="fa-solid fa-trash me-2"></i>Xác nhận xóa</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layout/footer.jsp" />
