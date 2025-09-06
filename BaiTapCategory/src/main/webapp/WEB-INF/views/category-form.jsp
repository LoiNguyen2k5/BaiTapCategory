<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%-- =================================================================== --%>
<%-- BƯỚC 1: XÁC ĐỊNH CÁC BIẾN ĐỘNG Ở ĐẦU TRANG --%>
<%-- =================================================================== --%>

<%-- Tạo biến tiền tố (prefix) dựa trên vai trò của người dùng trong session --%>
<c:set var="prefix" value="/user" /> <%-- Mặc định an toàn --%>
<c:if test="${sessionScope.account.roleid == 2}"><c:set var="prefix" value="/manager" /></c:if>
<c:if test="${sessionScope.account.roleid == 3}"><c:set var="prefix" value="/admin" /></c:if>

<%-- Xác định URL action của form (create hay update) và tiêu đề trang --%>
<c:set var="pageTitle" value="Thêm Danh mục mới" />
<c:set var="formActionUrl" value="${pageContext.request.contextPath}${prefix}/category/create" />

<c:if test="${not empty category}">
    <c:set var="pageTitle" value="Chỉnh sửa Danh mục" />
    <c:set var="formActionUrl" value="${pageContext.request.contextPath}${prefix}/category/update" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>
<style>
    body { font-family: Arial, sans-serif; padding: 20px; }
    .form-container { max-width: 500px; margin: auto; }
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; margin-bottom: 5px; }
    .form-group input { width: 100%; padding: 8px; box-sizing: border-box; }
    .btn { padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; }
    img.current-icon { max-width: 100px; height: auto; display: block; margin-top: 5px; }
</style>
</head>
<body>
    <div class="form-container">
        <h2>${pageTitle}</h2>
        
        <%-- =================================================================== --%>
        <%-- BƯỚC 2: SỬ DỤNG MỘT FORM DUY NHẤT VỚI ACTION ĐỘNG --%>
        <%-- =================================================================== --%>
        
        <form action="${formActionUrl}" method="post" enctype="multipart/form-data">
            
            <%-- Trường ẩn này chỉ được thêm vào khi ở chế độ "update" --%>
            <c:if test="${not empty category}">
                <input type="hidden" name="cateid" value="${category.cateId}" />
            </c:if>

            <div class="form-group">
                <label for="catename">Tên danh mục:</label>
                <input type="text" id="catename" name="catename" value="${category.cateName}" required />
            </div>
            
            <%-- Hiển thị ảnh hiện tại (chỉ ở chế độ "edit") --%>
            <c:if test="${not empty category}">
                <div class="form-group">
                    <label>Ảnh hiện tại:</label>
                    <c:if test="${not empty category.icon}">
                        <c:url value="/image" var="imgUrl">
                            <c:param name="fname" value="${category.icon}" />
                        </c:url>
                        <img src="${imgUrl}" class="current-icon" />
                    </c:if>
                    <c:if test="${empty category.icon}">
                        <span>(Chưa có ảnh)</span>
                    </c:if>
                </div>
            </c:if>
            
            <div class="form-group">
                <label for="icon">
                    <c:choose>
                        <c:when test="${not empty category}">Chọn ảnh mới (nếu muốn thay đổi):</c:when>
                        <c:otherwise>Icon:</c:otherwise>
                    </c:choose>
                </label>
                <input type="file" id="icon" name="icon" />
            </div>

            <button type="submit" class="btn">
                <c:choose>
                    <c:when test="${not empty category}">Cập nhật</c:when>
                    <c:otherwise>Thêm</c:otherwise>
                </c:choose>
            </button>
        </form>
            
        <br>
        
        <%-- =================================================================== --%>
        <%-- BƯỚC 3: SỬA LẠI LINK "QUAY LẠI" ĐỂ TRỎ VỀ ĐÚNG TRANG HOME --%>
        <%-- =================================================================== --%>
        <a href="${pageContext.request.contextPath}${prefix}/home">Quay lại danh sách</a>
    </div>
</body>
</html>