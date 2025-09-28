<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="vi">
<head><meta charset="utf-8"><title>Shop Demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
  body{background:#f8fafc}.card{border:none;border-radius:16px;box-shadow:0 8px 24px rgba(15,23,42,.06)}
  .muted{color:#64748b}
</style>
</head>
<body>
<nav class="navbar bg-white border-bottom sticky-top">
  <div class="container">
    <a class="navbar-brand fw-semibold" href="${pageContext.request.contextPath}/home">Shop Demo</a>
  </div>
</nav>

<div class="container my-4">
  <div class="row g-4">
    <div class="col-lg-3">
      <div class="bg-white p-3 rounded-4 shadow-sm">
        <h6 class="mb-3">Danh mục</h6>
        <div class="list-group list-group-flush">
          <c:forEach var="citem" items="${categories}">
            <a class="list-group-item ${citem.id == activeCatId ? 'active' : ''}"
               href="${pageContext.request.contextPath}/home?cat=${citem.id}">
              <div class="d-flex justify-content-between">
                <span>${citem.name}</span>
                <span class="badge text-bg-secondary">${citem.productCount}</span>
              </div>
            </a>
          </c:forEach>
        </div>
      </div>
    </div>

    <div class="col-lg-9">
      <h5 class="mb-3">Sản phẩm</h5>
      <c:choose>
        <c:when test="${empty products}">
          <div class="alert alert-warning">Chưa có sản phẩm trong danh mục này.</div>
        </c:when>
        <c:otherwise>
          <div class="row g-4">
            <c:forEach var="p" items="${products}">
              <div class="col-md-6 col-xl-4">
                <div class="card h-100">
                  <div class="card-body">
                    <h6 class="card-title mb-1">${p.name}</h6>
                    <div class="muted small mb-2">Mã: #${p.id}</div>
                    <p class="muted" style="min-height:40px;"><c:out value="${p.description}"/></p>
                    <div class="d-flex justify-content-between">
                      <strong>₫${p.price}</strong>
                      <span class="badge text-bg-light">⚖ ${p.weight} g</span>
                    </div>
                  </div>
                  <div class="card-footer bg-white">
                    <a class="btn btn-sm btn-primary w-100"
                       href="${pageContext.request.contextPath}/products/detail?id=${p.id}">
                      Xem chi tiết
                    </a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>
</body></html>

