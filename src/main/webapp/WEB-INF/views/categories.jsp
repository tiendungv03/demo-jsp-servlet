<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="vi">
<head><meta charset="utf-8"><title>Danh mục</title></head>
<body>
<jsp:include page="/WEB-INF/views/_layout.jspf"/>
<div class="container my-4">
  <h4 class="mb-3">Danh mục</h4>
  <c:choose>
    <c:when test="${empty categories}">
      <div class="alert alert-info">Chưa có danh mục.</div>
    </c:when>
    <c:otherwise>
      <ul class="list-group bg-white rounded-4">
        <c:forEach var="citem" items="${categories}">
          <li class="list-group-item d-flex justify-content-between">
            <span>${citem.name}</span>
            <span class="badge text-bg-secondary">${citem.productCount}</span>
          </li>
        </c:forEach>
      </ul>
    </c:otherwise>
  </c:choose>
</div>
</body></html>
