<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<style>
    .header-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 20px;
        margin-bottom: 25px;
        position: relative;
    }

    .header-bar .user-info {
        background: #f1f3f4;
        padding: 10px 20px;
        border-radius: 20px;
        font-size: 14px;
        color: #343a40;
    }

    .header-bar .user-info strong {
        color: #667eea;
        font-weight: 600;
    }

    /* === CSS MỚI CHO NÚT ĐĂNG XUẤT === */
    .btn-logout {
        display: inline-flex;
        align-items: center;
        padding: 12px 25px; 
        background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
        color: white; 
        text-decoration: none; 
        border-radius: 25px; 
        font-weight: 500;
        font-size: 14px;
        letter-spacing: 0.5px;
        box-shadow: 0 4px 15px rgba(220, 53, 69, 0.3);
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
    }

    .btn-logout:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(220, 53, 69, 0.4);
        background: linear-gradient(135deg, #c82333 0%, #dc3545 100%);
    }

</style>

<div class="header-bar">
    <div class="user-info">
        <c:if test="${not empty sessionScope.account}">
            Xin chào, <strong>${sessionScope.account.username}</strong>!
            (Vai trò: 
            <c:choose>
                <c:when test="${sessionScope.account.roleid == 1}">User</c:when>
                <c:when test="${sessionScope.account.roleid == 2}">Manager</c:when>
                <c:when test="${sessionScope.account.roleid == 3}">Admin</c:when>
            </c:choose>
            )
        </c:if>
    </div>
    
    <!-- SỬA LẠI NÚT ĐĂNG XUẤT VỚI CLASS MỚI -->
    <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Đăng xuất</a>
</div>