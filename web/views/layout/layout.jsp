<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${pageTitle}</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/layout.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dashboard.css">
</head>
<body>

<div class="app-container">

    <%@ include file="sidebar.jsp" %>

    <div class="main-area">

        <%@ include file="navbar.jsp" %>

        <div class="content">
            <jsp:include page="${contentPage}" />
        </div>

    </div>
</div>

</body>
</html>
