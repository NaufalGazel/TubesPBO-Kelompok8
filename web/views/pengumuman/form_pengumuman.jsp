<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Pengumuman, java.text.SimpleDateFormat" %>

<%
    Pengumuman pengumuman =
        (Pengumuman) request.getAttribute("pengumuman");

    boolean isEdit = pengumuman != null;

    String judul = "";
    String deskripsi = "";
    String tempat = "";
    String status = "DRAFT";
    String tanggal = "";
    String waktu = "";

    if (isEdit) {
        judul = pengumuman.getJudul();
        deskripsi = pengumuman.getDeskripsi();
        tempat = pengumuman.getTempat();
        status = pengumuman.getStatus();

        if (pengumuman.getTanggal() != null) {
            tanggal = new SimpleDateFormat("yyyy-MM-dd")
                        .format(pengumuman.getTanggal());
        }

        if (pengumuman.getWaktu() != null) {
            waktu = new SimpleDateFormat("HH:mm")
                        .format(pengumuman.getWaktu());
        }
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title><%= isEdit ? "Edit Pengumuman" : "Tambah Pengumuman" %></title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/layout.css">
    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/form_pengumuman.css">
</head>
<body>

<div class="app-container">

    <%@ include file="/views/layout/sidebar.jsp" %>

    <div class="main-area">

        <%@ include file="/views/layout/navbar.jsp" %>

        <div class="content">

            <!-- ================= FORM CONTAINER ================= -->
            <div class="form-container">

                <h2 class="form-title">
                    <%= isEdit ? "Buat / Edit" : "Buat / Edit" %>
                </h2>
                <p class="form-subtitle">Kelola Pengumuman</p>

                <form method="post"
                      action="<%= request.getContextPath() %>/pengumuman">

                    <%-- ID hanya saat edit --%>
                    <% if (isEdit) { %>
                        <input type="hidden" name="id"
                               value="<%= pengumuman.getId() %>">
                    <% } %>

                    <!-- Judul -->
                    <div class="form-group">
                        <label>Judul Pengumuman</label>
                        <input type="text"
                               name="judul"
                               placeholder="Masukkan judul pengumuman"
                               value="<%= judul %>"
                               required>
                    </div>

                    <!-- Tanggal & Waktu -->
                    <div class="form-row">
                        <div class="form-group">
                            <label>Tanggal</label>
                            <input type="date"
                                   name="tanggal"
                                   value="<%= tanggal %>"
                                   required>
                        </div>

                        <div class="form-group">
                            <label>Waktu</label>
                            <input type="time"
                                   name="waktu"
                                   value="<%= waktu %>"
                                   required>
                        </div>
                    </div>

                    <!-- Tempat -->
                    <div class="form-group">
                        <label>Tempat</label>
                        <input type="text"
                               name="tempat"
                               placeholder="Masukkan Tempat Acara"
                               value="<%= tempat %>">
                    </div>

                    <!-- Status -->
                    <div class="form-group">
                        <label>Status</label>
                        <select name="status">
                            <option value="DRAFT"
                                <%= "DRAFT".equals(status) ? "selected" : "" %>>
                                Draft
                            </option>
                            <option value="DITERBITKAN"
                                <%= "DITERBITKAN".equals(status) ? "selected" : "" %>>
                                Diterbitkan
                            </option>
                        </select>
                    </div>

                    <!-- Deskripsi -->
                    <div class="form-group">
                        <label>Deskripsi</label>
                        <textarea name="deskripsi"
                                  placeholder="Deskripsi pengumuman"
                                  required><%= deskripsi %></textarea>
                    </div>

                    <!-- Action -->
                    <div class="form-actions">
                        <a href="<%= request.getContextPath() %>/pengumuman"
                           class="btn-cancel">
                            Batal
                        </a>

                        <button type="submit" class="btn-submit">
                            <%= isEdit ? "Simpan Perubahan" : "Buat Pengumuman" %>
                        </button>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>
