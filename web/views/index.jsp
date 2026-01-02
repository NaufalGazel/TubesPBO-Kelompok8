<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login | HMIT Connect</title>

    <!-- CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/login.css">
</head>
<body>

    <div class="login-card">

        <!-- LOGO -->
        <div class="login-logo">
            <!-- logo sementara -->
            <img src="${pageContext.request.contextPath}/assets/img/logo-hmit.png"
                 alt="Logo">
            <span>HMIT Connect</span>
        </div>

        <!-- TITLE -->
        <div class="login-title">Selamat Datang</div>
        <div class="login-subtitle">
            Silakan masuk untuk melanjutkan.
        </div>

        <!-- FORM -->
        <form action="login" method="post" class="login-form">

            <label>Nama Pengguna</label>
            <input type="text"
                   name="username"
                   placeholder="Masukkan nama pengguna Anda"
                   required>

            <label>Kata Sandi</label>
            <input type="password"
                   name="password"
                   placeholder="Masukkan kata sandi Anda"
                   required>

            <button type="submit" class="login-btn">
                Masuk
            </button>

            <c:if test="${not empty error}">
                <div class="login-error">
                    ${error}
                </div>
            </c:if>

        </form>
    </div>

</body>
</html>
