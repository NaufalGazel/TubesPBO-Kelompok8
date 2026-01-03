<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tentang - Struktur Kepengurusan</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/layout.css">
    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/tentang.css">
</head>
<body>

<div class="app-container">

    <%@ include file="/views/layout/sidebar.jsp" %>

    <div class="main-area">

        <%@ include file="/views/layout/navbar.jsp" %>

        <div class="content tentang-page">

            <!-- ================= LOGO & TITLE ================= -->
            <div class="tentang-header">
                <img src="<%= request.getContextPath() %>/assets/img/logo-himpunan.png"
                     alt="HMIT Logo"
                     class="tentang-logo">

                <h1>KABINET YUDISTHIRA</h1>
            </div>

            <!-- ================= INTI ================= -->
            <h2 class="section-title">INTI</h2>

            <!-- Ketua & Wakil -->
            <div class="card-grid grid-2">
                <%
                    List<Map<String, String>> intiUtama =
                        (List<Map<String, String>>) request.getAttribute("intiUtama");

                    for (Map<String, String> p : intiUtama) {
                %>
                    <div class="profile-card large">
                        <img src="<%= request.getContextPath() %>/assets/img/<%= p.get("foto") %>"
                             alt="<%= p.get("nama") %>">

                        <span class="badge"><%= p.get("jabatan") %></span>
                        <h3><%= p.get("nama") %></h3>
                    </div>
                <%
                    }
                %>
            </div>

            <!-- Sekretaris & Bendahara -->
            <div class="card-grid grid-4">
                <%
                    List<Map<String, String>> intiLainnya =
                        (List<Map<String, String>>) request.getAttribute("intiLainnya");

                    for (Map<String, String> p : intiLainnya) {
                %>
                    <div class="profile-card">
                        <img src="<%= request.getContextPath() %>/assets/img/<%= p.get("foto") %>"
                             alt="<%= p.get("nama") %>">

                        <span class="badge"><%= p.get("jabatan") %></span>
                        <h3><%= p.get("nama") %></h3>
                    </div>
                <%
                    }
                %>
            </div>

            <!-- ================= KEPALA DEPARTEMEN ================= -->
            <h2 class="section-title">Kepala Departemen</h2>

            <div class="card-grid grid-3">
                <%
                    List<Map<String, String>> kepalaDepartemen =
                        (List<Map<String, String>>) request.getAttribute("kepalaDepartemen");

                    for (Map<String, String> p : kepalaDepartemen) {
                %>
                    <div class="profile-card">
                        <img src="<%= request.getContextPath() %>/assets/img/<%= p.get("foto") %>"
                             alt="<%= p.get("nama") %>">

                        <span class="badge"><%= p.get("jabatan") %></span>
                        <h3><%= p.get("nama") %></h3>
                    </div>
                <%
                    }
                %>
            </div>

            <!-- ================= KEPALA BIDANG ================= -->
            <h2 class="section-title">Kepala Bidang</h2>

            <div class="card-grid grid-4">
                <%
                    List<Map<String, String>> kepalaBidang =
                        (List<Map<String, String>>) request.getAttribute("kepalaBidang");

                    for (int i = 0; i < kepalaBidang.size(); i++) {
                        Map<String, String> p = kepalaBidang.get(i);
                %>
                    <div class="profile-card">
                        <img src="<%= request.getContextPath() %>/assets/img/<%= p.get("foto") %>"
                             alt="<%= p.get("nama") %>">

                        <span class="badge"><%= p.get("jabatan") %></span>
                        <h3><%= p.get("nama") %></h3>
                    </div>
                <%
                    }
                %>
            </div>

        </div>
    </div>
</div>

</body>
</html>
