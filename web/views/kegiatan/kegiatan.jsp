<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.Kegiatan, dto.ProgramStatDTO" %>

<%
    List<Kegiatan> kegiatanList =
        (List<Kegiatan>) request.getAttribute("kegiatanList");

    Boolean canCrud = (Boolean) request.getAttribute("canCrud");
    Boolean showDepartemen = (Boolean) request.getAttribute("showDepartemen");
    Boolean showBidang = (Boolean) request.getAttribute("showBidang");

    List<ProgramStatDTO> statList =
        (List<ProgramStatDTO>) request.getAttribute("statList");

    ProgramStatDTO singleStat =
        (ProgramStatDTO) request.getAttribute("singleStat");

    String statTitle =
        (String) request.getAttribute("statTitle");
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Program & Kegiatan</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/layout.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/kegiatan.css">
</head>
<body>

<div class="app-container">

    <%@ include file="/views/layout/sidebar.jsp" %>

    <div class="main-area">

        <%@ include file="/views/layout/navbar.jsp" %>

        <div class="content">

            <!-- ================= STATISTIK ================= -->
            <% if (statTitle != null) { %>
                <h2 class="stat-title"><%= statTitle %></h2>
            <% } %>

            <% if (statList != null && !statList.isEmpty()) { %>
                <div class="stat-grid">
                <% for (ProgramStatDTO s : statList) {
                       int total = s.getTotalProgram();
                       int done = s.getTerlaksana();
                       int percent = total == 0 ? 0 : (done * 100 / total);
                %>
                    <div class="stat-card">
                        <h1><%= percent %>%</h1>
                        <p><%= s.getLabel() %></p>

                        <div class="stat-row">
                            <span>Total Program</span>
                            <b><%= total %></b>
                        </div>
                        <div class="stat-row">
                            <span>Terlaksana</span>
                            <b><%= done %></b>
                        </div>
                    </div>
                <% } %>
                </div>

            <% } else if (singleStat != null) {
                   int total = singleStat.getTotalProgram();
                   int done = singleStat.getTerlaksana();
                   int percent = total == 0 ? 0 : (done * 100 / total);
            %>
                <div class="stat-grid">
                    <div class="stat-card">
                        <h1><%= percent %>%</h1>
                        <p>Progress Bidang</p>
                    </div>
                    <div class="stat-card">
                        <h1><%= total %></h1>
                        <p>Total Program</p>
                    </div>
                    <div class="stat-card">
                        <h1><%= done %></h1>
                        <p>Terlaksana</p>
                    </div>
                </div>
            <% } %>

            <!-- ================= HEADER ================= -->
            <div class="page-header">
                <div>
                    <h2>Daftar Program & Kegiatan</h2>
                    <p>Kelola dan pantau kegiatan organisasi.</p>
                </div>

                <% if (Boolean.TRUE.equals(canCrud)) { %>
                    <a href="<%= request.getContextPath() %>/program-kegiatan?action=form"
                       class="btn-primary">
                        Buat Kegiatan Baru
                    </a>
                <% } %>
            </div>

            <!-- ================= SEARCH ================= -->
            <input type="text"
                   id="searchInput"
                   class="search-box"
                   placeholder="Cari kegiatan atau program kerja...">

            <!-- ================= TABLE ================= -->
            <div class="table-wrapper">
                <table class="kegiatan-table">
                    <thead>
                    <tr>
                        <th>Nama Kegiatan</th>
                        <th>Program Kerja</th>
                        <th>Tanggal</th>

                        <% if (Boolean.TRUE.equals(showDepartemen)) { %>
                            <th>Departemen</th>
                        <% } %>

                        <% if (Boolean.TRUE.equals(showBidang)) { %>
                            <th>Bidang</th>
                        <% } %>

                        <th>PIC</th>
                        <th>Aksi</th>
                    </tr>
                    </thead>

                    <tbody>
                    <% if (kegiatanList != null) {
                           for (Kegiatan k : kegiatanList) {
                    %>
                        <tr class="kegiatan-row"
                            data-search="<%= (
                                k.getNama() + " " +
                                k.getProgramNama() + " " +
                                k.getPicNama() + " " +
                                k.getBidangNama() + " " +
                                k.getDepartemenNama()
                            ).toLowerCase() %>">

                            <td><%= k.getNama() %></td>
                            <td><%= k.getProgramNama() %></td>
                            <td><%= k.getTanggal() %></td>

                            <% if (Boolean.TRUE.equals(showDepartemen)) { %>
                                <td><%= k.getDepartemenNama() %></td>
                            <% } %>

                            <% if (Boolean.TRUE.equals(showBidang)) { %>
                                <td><%= k.getBidangNama() %></td>
                            <% } %>

                            <td><%= k.getPicNama() %></td>

                            <td class="aksi-col">
                                <a href="javascript:void(0)"
                                   onclick="openDetail(<%= k.getId() %>)"
                                   class="link-detail">
                                    Detail
                                </a>

                                <% if (Boolean.TRUE.equals(canCrud)) { %>
                                    <a href="<%= request.getContextPath() %>/program-kegiatan?action=form&id=<%= k.getId() %>"
                                       class="link-edit">
                                        Edit
                                    </a>

                                    <a href="javascript:void(0)"
                                       onclick="deleteKegiatan(<%= k.getId() %>)"
                                       class="link-delete">
                                        Delete
                                    </a>
                                <% } %>
                            </td>
                        </tr>
                    <% } } %>
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

<!-- ================= MODAL ================= -->
<div id="detailModal" class="modal-backdrop" style="display:none;">
    <div class="modal-box">
        <div id="detailContent">Loading...</div>
        <br>
    </div>
</div>

<script>
    window.contextPath = "<%= request.getContextPath() %>";
</script>
<script src="<%= request.getContextPath() %>/assets/js/kegiatan.js"></script>

</body>
</html>
