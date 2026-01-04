<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Pengumuman" %>

<%
    Pengumuman p = (Pengumuman) request.getAttribute("pengumuman");
%>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/detail_kegiatan.css">

<div class="detail-wrapper">

    <h3 class="detail-title">Detail Pengumuman</h3>

    <div class="detail-grid">

        <div class="detail-label">Judul</div>
        <div class="detail-value"><%= p.getJudul() %></div>

        <div class="detail-label">Penulis</div>
        <div class="detail-value"><%= p.getPenulisLabel() %></div>

        <div class="detail-label">Tanggal</div>
        <div class="detail-value"><%= p.getTanggal() %></div>

        <div class="detail-label">Waktu</div>
        <%
            String waktu = p.getWaktu() != null
                    ? p.getWaktu().toString().substring(0,5).replace(":", ".")
                    : "-";
        %>
        <div class="detail-value"><%= waktu %> WIB</div>

        <div class="detail-label">Tempat</div>
        <div class="detail-value">
            <%= p.getTempat() != null ? p.getTempat() : "-" %>
        </div>

        <% if (p.getStatus() != null) { %>
            <div class="detail-label">Status</div>
            <div class="detail-value"><%= p.getStatus() %></div>
        <% } %>

    </div>

    <div class="detail-divider"></div>

    <div class="detail-desc">
        <div class="detail-label">Deskripsi</div>
        <div class="detail-desc-box">
            <%= p.getDeskripsi() != null ? p.getDeskripsi() : "-" %>
        </div>
    </div>

    <div class="detail-actions">
        <button class="detail-close-btn" onclick="closeDetail()">
            Tutup
        </button>
    </div>

</div>
