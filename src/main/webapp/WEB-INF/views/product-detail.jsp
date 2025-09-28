<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="vi">
<head><meta charset="utf-8"><title>Chi tiết sản phẩm</title></head>
<body>
<jsp:include page="/WEB-INF/views/_layout.jspf"/>
<div class="container my-4">
  <c:if test="${p == null}">
    <div class="alert alert-danger">Không tìm thấy sản phẩm.</div>
  </c:if>
  <c:if test="${p != null}">
    <div class="card p-4">
      <h4 class="mb-1">${p.name}</h4>
      <div class="muted mb-3">Danh mục: ${p.category} | Mã: #${p.id}</div>
      <p class="mb-3"><c:out value="${p.description}"/></p>
      <div><strong>Giá:</strong> ₫${p.price} &nbsp; | &nbsp; <strong>Khối lượng:</strong> ${p.weight} g</div>
    </div>
  </c:if>
</div>
</body></html>
