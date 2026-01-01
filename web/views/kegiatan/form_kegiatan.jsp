<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.ProgramKerja, model.Kegiatan" %>

<%
    List<ProgramKerja> programList =
        (List<ProgramKerja>) request.getAttribute("programList");
    Kegiatan kegiatan =
        (Kegiatan) request.getAttribute("kegiatan");

    boolean isEdit = kegiatan != null;
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title><%= isEdit ? "Edit Laporan Kegiatan" : "Buat Laporan Kegiatan" %></title>

    <!-- GLOBAL LAYOUT -->
    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/layout.css">

    <!-- FORM KEGIATAN -->
    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/form_kegiatan.css">
</head>
<body>

<div class="app-container">

    <%@ include file="/views/layout/sidebar.jsp" %>

    <div class="main-area">

        <%@ include file="/views/layout/navbar.jsp" %>

        <div class="content">

            <!-- ================= HEADER ================= -->
            <div class="form-header">
                <h2><%= isEdit ? "Edit Laporan Kegiatan" : "Buat Laporan Kegiatan" %></h2>
                <p>Kelola laporan kegiatan organisasi</p>
            </div>

            <!-- ================= FORM CARD ================= -->
            <div class="form-card">

                <form method="post"
                      action="<%= request.getContextPath() %>/program-kegiatan">

                    <% if (isEdit) { %>
                        <input type="hidden" name="id"
                               value="<%= kegiatan.getId() %>">
                    <% } %>

                    <!-- NAMA KEGIATAN -->
                    <div class="form-group">
                        <label>Nama Kegiatan</label>
                        <input type="text"
                               name="nama"
                               placeholder="Masukkan nama kegiatan"
                               value="<%= isEdit ? kegiatan.getNama() : "" %>"
                               required>
                    </div>

                    <!-- PROGRAM KERJA -->
                    <div class="form-group">
                        <label>Program Kerja</label>
                        <select name="program_kerja_id" required>
                            <option value="">Pilih program kerja terkait</option>
                            <%
                                if (programList != null) {
                                    for (ProgramKerja p : programList) {
                                        boolean selected =
                                            isEdit && p.getId() == kegiatan.getProgramId();
                            %>
                                <option value="<%= p.getId() %>"
                                    <%= selected ? "selected" : "" %>>
                                    <%= p.getNama() %>
                                </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>

                    <!-- TANGGAL & WAKTU -->
                    <div class="form-row">
                        <div class="form-group">
                            <label>Tanggal</label>
                            <input type="date"
                                   name="tanggal"
                                   value="<%= isEdit ? kegiatan.getTanggal() : "" %>"
                                   required>
                        </div>

                        <div class="form-group">
                            <label>Waktu</label>
                            <input type="time"
                                   name="waktu"
                                   value="<%= isEdit ? kegiatan.getWaktu() : "" %>"
                                   required>
                        </div>
                    </div>

                    <!-- TEMPAT -->
                    <div class="form-group">
                        <label>Tempat</label>
                        <input type="text"
                               name="tempat"
                               placeholder="Masukkan tempat kegiatan"
                               value="<%= isEdit ? kegiatan.getTempat() : "" %>"
                               required>
                    </div>

                    <!-- DESKRIPSI -->
                    <div class="form-group">
                        <label>Deskripsi</label>
                        <textarea name="deskripsi"
                                  rows="4"
                                  placeholder="Deskripsikan kegiatan ini"
                                  required><%= isEdit ? kegiatan.getDeskripsi() : "" %></textarea>
                    </div>

                    <!-- ACTION -->
                    <div class="form-actions">
                        <a href="<%= request.getContextPath() %>/program-kegiatan"
                           class="btn-outline">
                            Batal
                        </a>

                        <button type="submit" class="btn-primary">
                            <%= isEdit ? "Simpan Perubahan" : "Buat Laporan" %>
                        </button>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
