<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.Pengumuman, model.User" %>

<%
    List<Pengumuman> pengumumanList =
        (List<Pengumuman>) request.getAttribute("pengumumanList");

    Boolean showStatus = (Boolean) request.getAttribute("showStatus");
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Pengumuman</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/layout.css">
    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/pengumuman.css">
</head>
<body>

<div class="app-container">

    <%@ include file="/views/layout/sidebar.jsp" %>

    <div class="main-area">

        <%@ include file="/views/layout/navbar.jsp" %>

        <div class="content">

            <!-- ================= HEADER ================= -->
            <div class="pengumuman-header">
                <div>
                    <h2>Daftar Pengumuman</h2>
                    <p>Informasi resmi dan pemberitahuan organisasi.</p>
                </div>

                <% if (user != null && !user.isAnggota()) { %>
                    <a href="<%= request.getContextPath() %>/pengumuman?action=create"
                       class="btn-primary">
                        Buat Pengumuman Baru
                    </a>
                <% } %>
            </div>

            <!-- ================= SEARCH ================= -->
            <input type="text"
                   id="searchInput"
                   placeholder="Cari judul pengumuman atau penulis..."
                   class="search-input">

            <!-- ================= TABLE ================= -->
            <div class="table-wrapper">
                <table class="pengumuman-table">
                    <thead>
                    <tr>
                        <th>Judul</th>
                        <th>Penulis</th>
                        <th>Tanggal</th>

                        <% if (Boolean.TRUE.equals(showStatus)) { %>
                            <th>Status</th>
                        <% } %>

                        <th>Aksi</th>
                    </tr>
                    </thead>

                    <tbody>
                    <%
                        if (pengumumanList == null || pengumumanList.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="5" class="empty-row">
                                Belum ada pengumuman
                            </td>
                        </tr>
                    <%
                        } else {
                            for (Pengumuman p : pengumumanList) {
                                boolean isOwner =
                                    user != null &&
                                    p.getPenulisId() == user.getId();
                    %>
                        <tr id="row-<%= p.getId() %>"
                            class="pengumuman-row"
                            data-search="<%= (p.getJudul() != null ? p.getJudul() : "").toLowerCase() %>">

                            <td><%= p.getJudul() %></td>
                            <td><%= p.getPenulisLabel() %></td>
                            <td><%= p.getTanggal() %></td>

                            <% if (Boolean.TRUE.equals(showStatus)) { %>
                                <td>
                                    <span class="status-badge
                                        <%= "DITERBITKAN".equalsIgnoreCase(p.getStatus())
                                            ? "status-publish"
                                            : "status-draft" %>">
                                        <%= p.getStatus() %>
                                    </span>
                                </td>
                            <% } %>

                            <td class="aksi-col">
                                <a href="javascript:void(0)"
                                   onclick="openDetail(<%= p.getId() %>)"
                                   class="link-detail">
                                    Detail
                                </a>

                                <% if (isOwner && !user.isAnggota()) { %>
                                    <a href="<%= request.getContextPath() %>/pengumuman?action=edit&id=<%= p.getId() %>"
                                       class="link-edit">
                                        Edit
                                    </a>
                                    <a href="javascript:void(0)"
                                       onclick="deletePengumuman(<%= p.getId() %>)"
                                       class="link-delete">
                                        Delete
                                    </a>
                                <% } %>
                            </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <!-- ================= PAGINATION ================= -->
            <div class="pagination">
                <button id="prevBtn">&lt; Previous</button>
                <span id="pageInfo"></span>
                <button id="nextBtn">Next &gt;</button>
            </div>

        </div>
    </div>
</div>

<!-- ================= MODAL DETAIL ================= -->
<div id="detailModal" class="modal-overlay">
    <div class="modal-box">
        <div id="detailContent">Loading...</div>
    </div>
</div>

<script>
    window.contextPath = "<%= request.getContextPath() %>";
</script>
<script src="<%= request.getContextPath() %>/assets/js/pengumuman.js"></script>

</body>
</html>
