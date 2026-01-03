<!-- views/layout/sidebar.jsp -->
<%
    String activeMenu = (String) request.getAttribute("activeMenu");
    if (activeMenu == null) activeMenu = "";
%>

<aside class="sidebar">

    <div class="sidebar-header">
        <img src="<%= request.getContextPath() %>/assets/img/logo-hmit.png"
             alt="HMIT Logo"
             class="sidebar-logo">
        <span>HMIT Connect</span>
    </div>

    <!-- GARIS PEMISAH -->
    <div class="sidebar-divider"></div>

    <nav class="sidebar-menu">
        
        <a href="<%= request.getContextPath() %>/dashboard"
           class="menu-item <%= "dashboard".equals(activeMenu) ? "active" : "" %>">
            <img src="${pageContext.request.contextPath}/assets/img/home.png"
                 alt="Menu" class="sidebar-icon">
            <span>Dashboard</span>
        </a>
            
        <a href="<%= request.getContextPath() %>/program-kegiatan"
           class="menu-item <%= "kegiatan".equals(activeMenu) ? "active" : "" %>">
            <img src="${pageContext.request.contextPath}/assets/img/calendar.png"
                 alt="Menu" class="sidebar-icon">
            <span>Program & Kegiatan</span>
        </a>

        <a href="<%= request.getContextPath() %>/pengumuman"
           class="menu-item <%= "pengumuman".equals(activeMenu) ? "active" : "" %>">
            <img src="${pageContext.request.contextPath}/assets/img/announce.png"
                 alt="Menu" class="sidebar-icon">
            <span>Pengumuman</span>
        </a>

        <a href="<%= request.getContextPath() %>/tentang"
           class="menu-item <%= "tentang".equals(activeMenu) ? "active" : "" %>">
            <img src="${pageContext.request.contextPath}/assets/img/about.png"
                 alt="Menu" class="sidebar-icon">
            <span>Tentang</span>
        </a>
    </nav>
</aside>
