<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Kegiatan, model.User" %>

<%
    Kegiatan k = (Kegiatan) request.getAttribute("kegiatan");
    User user = (User) session.getAttribute("user");

    boolean isInti = user != null && user.isInti();
    boolean isKadep = user != null && user.isKepalaDepartemen();

    // ===== FORMAT WAKTU =====
    String waktu = "";
    if (k.getWaktu() != null) {
        waktu = k.getWaktu().toString().substring(0,5).replace(":", ".");
    }
%>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/detail_kegiatan.css">

<div class="detail-wrapper">

    <h3 class="detail-title">Detail Kegiatan</h3>

    <div class="detail-grid">

        <!-- ================= BASIC INFO ================= -->

        <div class="detail-label">Nama Kegiatan</div>
        <div class="detail-value"><%= k.getNama() %></div>

        <div class="detail-label">Program Kerja</div>
        <div class="detail-value"><%= k.getProgramNama() %></div>

        <!-- ================= ROLE BASED INFO ================= -->

        <% if (isInti) { %>
            <div class="detail-label">Departemen</div>
            <div class="detail-value"><%= k.getDepartemenNama() %></div>

            <div class="detail-label">Bidang</div>
            <div class="detail-value"><%= k.getBidangNama() %></div>
        <% } else if (isKadep) { %>
            <div class="detail-label">Bidang</div>
            <div class="detail-value"><%= k.getBidangNama() %></div>
        <% } %>

        <!-- ================= TIME & PLACE ================= -->

        <div class="detail-label">Tanggal</div>
        <div class="detail-value"><%= k.getTanggal() %></div>

        <div class="detail-label">Waktu</div>
        <div class="detail-value"><%= waktu %> WIB</div>

        <div class="detail-label">Tempat</div>
        <div class="detail-value"><%= k.getTempat() %></div>

        <div class="detail-label">PIC</div>
        <div class="detail-value"><%= k.getPicNama() %></div>

    </div>

    <!-- ================= DIVIDER ================= -->

    <div class="detail-divider"></div>

    <!-- ================= DESCRIPTION ================= -->

    <div class="detail-desc">
        <div class="detail-label">Deskripsi</div>
        <div class="detail-desc-box">
            <%= k.getDeskripsi() %>
        </div>
    </div>

    <!-- ================= ACTION ================= -->

    <div class="detail-actions">
        <button class="detail-close-btn" onclick="closeDetail()">Tutup</button>
    </div>

</div>
