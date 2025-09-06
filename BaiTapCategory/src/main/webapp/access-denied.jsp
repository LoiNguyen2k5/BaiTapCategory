<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lỗi Truy Cập</title>
<style>
    body { font-family: Arial, sans-serif; text-align: center; padding-top: 50px; }
    .error-container { max-width: 500px; margin: auto; }
    h1 { color: #dc3545; }
    p { font-size: 18px; }
    a { color: #007bff; text-decoration: none; }
</style>
</head>
<body>
    <div class="error-container">
        <h1>Truy cập bị từ chối!</h1>
        <p>Bạn không có quyền truy cập vào tài nguyên này.</p>
        
        <c:choose>
            <c:when test="${sessionScope.account.roleid == 1}">
                <p><a href="${pageContext.request.contextPath}/user/home">Quay về trang chủ</a></p>
            </c:when>
            <c:when test="${sessionScope.account.roleid == 2}">
                <p><a href="${pageContext.request.contextPath}/manager/home">Quay về trang chủ</a></p>
            </c:when>
            <c:when test="${sessionScope.account.roleid == 3}">
                <p><a href="${pageContext.request.contextPath}/admin/home">Quay về trang chủ</a></p>
            </c:when>
            <c:otherwise>
                <p><a href="${pageContext.request.contextPath}/login.jsp">Đi đến trang đăng nhập</a></p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>