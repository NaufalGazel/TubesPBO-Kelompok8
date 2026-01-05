<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | HMIT Connect</title>

    <!-- LAYOUT (WAJIB) -->
    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/layout.css">

    <!-- DASHBOARD STYLE -->
    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/dashboard.css">
</head>
<body>

<div class="app-container">

    <!-- ================= SIDEBAR ================= -->
    <%@ include file="/views/layout/sidebar.jsp" %>

    <!-- ================= MAIN AREA ================= -->
    <div class="main-area">

        <!-- ================= NAVBAR ================= -->
        <%@ include file="/views/layout/navbar.jsp" %>

        <!-- ================= PAGE CONTENT ================= -->
        <div class="content">

            <!-- HEADER -->
            <header class="dashboard-header">
                <h1>
                    Selamat Datang,
                    <span class="user-name">
                        ${sessionScope.user.nama}
                    </span>
                </h1>
                <p class="user-role">
                    ${userLabel}
                </p>
            </header>

            <!-- HERO -->
            <section class="hero">
                <div class="hero-text">
                    <h2>
                        Wadah Aspirasi, Inovasi, dan Solidaritas
                        Mahasiswa Teknologi Informasi
                    </h2>
                    <p>
                        Himpunan Mahasiswa Teknologi Informasi (HMIT) 
                        merupakan organisasi kemahasiswaan Program Studi 
                        Teknologi Informasi Telkom University yang berperan 
                        sebagai wadah aspirasi, pengembangan diri, serta 
                        pusat kolaborasi mahasiswa. Melalui berbagai program 
                        kerja, kegiatan akademik, dan non-akademik, HMIT 
                        berkomitmen untuk membentuk mahasiswa yang berprestasi, 
                        berintegritas, dan siap berkontribusi dalam perkembangan 
                        teknologi informasi.
                    </p>
                </div>

                <div class="hero-image">
                    <img src="<%= request.getContextPath() %>/assets/img/firstmeet.png"
                         alt="Dashboard Preview" class="dashboard-image">
                </div>
            </section>

            <!-- STRUCTURE -->
            <section class="structure">
                <h2>HMIT Structure</h2>

                <div class="stat-grid">
                    <div class="stat-card">
                        <span class="stat-number">${totalDepartemen}</span>
                        <span class="stat-label">Departemen</span>
                    </div>

                    <div class="stat-card">
                        <span class="stat-number">${totalBidang}</span>
                        <span class="stat-label">Bidang</span>
                    </div>

                    <div class="stat-card">
                        <span class="stat-number">${totalAnggota}</span>
                        <span class="stat-label">Anggota</span>
                    </div>
                </div>
            </section>

            <!-- FEATURES -->
            <section class="features">
                <h2>HMIT Connect Feature</h2>

                <div class="feature-grid">
                    <div class="feature-card">
                        <h3>Monitoring Dashboard</h3>
                        <p>Monitoring struktur dan aktivitas organisasi.</p>
                    </div>

                    <div class="feature-card">
                        <h3>Manajemen Program & Kegiatan</h3>
                        <p>Kelola program kerja dan kegiatan dengan mudah.</p>
                    </div>

                    <div class="feature-card">
                        <h3>Manajemen Pengumuman</h3>
                        <p>Sampaikan informasi resmi secara terpusat.</p>
                    </div>
                </div>
            </section>

        </div>
    </div>
</div>

</body>
</html>
