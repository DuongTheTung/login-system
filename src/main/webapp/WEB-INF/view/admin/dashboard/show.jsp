<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/view/layout/header.jsp" />

<div class="row mt-4 mb-5">
    <div class="col-12">
        <h3 class="fw-bold text-dark mb-4"><i class="fa-solid fa-chart-line me-2 text-primary"></i>Dashboard</h3>
        
        <div class="row g-4">
            <!-- Tổng số user -->
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-primary text-white h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title text-capitalize fw-semibold mb-1">Tổng số User</h6>
                                <h2 class="mb-0 fw-bold">${totalUsers}</h2>
                            </div>
                            <div class="display-4 opacity-50">
                                <i class="fa-solid fa-users"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Tổng số Admin -->
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-info text-white h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title text-capitalize fw-semibold mb-1">Số Admin</h6>
                                <h2 class="mb-0 fw-bold">${totalAdmins}</h2>
                            </div>
                            <div class="display-4 opacity-50">
                                <i class="fa-solid fa-user-shield"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Số tài khoản đang hoạt động -->
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-success text-white h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title text-capitalize fw-semibold mb-1">Đang hoạt động</h6>
                                <h2 class="mb-0 fw-bold">${activeAccounts}</h2>
                            </div>
                            <div class="display-4 opacity-50">
                                <i class="fa-solid fa-user-check"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Số tài khoản bị khóa -->
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-danger text-white h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title text-capitalize fw-semibold mb-1">Đã khóa</h6>
                                <h2 class="mb-0 fw-bold">${lockedAccounts}</h2>
                            </div>
                            <div class="display-4 opacity-50">
                                <i class="fa-solid fa-user-lock"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layout/footer.jsp" />
