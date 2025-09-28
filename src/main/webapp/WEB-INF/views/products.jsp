<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="vi">
<head><meta charset="utf-8"><title>Sản phẩm</title></head>
<body>
<jsp:include page="/WEB-INF/views/_layout.jspf"/>
<div class="container my-4">
  <h4 class="mb-3">Danh sách sản phẩm</h4>
  <c:choose>
    <c:when test="${empty products}">
      <div class="alert alert-info">Chưa có sản phẩm.</div>
    </c:when>
    <c:otherwise>
      <table class="table table-hover bg-white rounded-4">
        <thead><tr>
          <th>ID</th><th>Tên</th><th>Giá</th><th>Khối lượng</th><th>Danh mục</th><th>Mô tả</th><th></th>
        </tr></thead>
        <tbody>
        <c:forEach var="p" items="${products}">
          <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${p.price}</td>
            <td>${p.weight}</td>
            <td>${p.category}</td>
            <td><c:out value="${p.description}"/></td>
            <td><a class="btn btn-sm btn-outline-primary"
                   href="${pageContext.request.contextPath}/products/detail?id=${p.id}">Chi tiết</a></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>
</div>
</body></html>
