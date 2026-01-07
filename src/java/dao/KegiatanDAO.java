package dao;

import model.Kegiatan;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KegiatanDAO {

    /* =====================================================
       BASE QUERY (DIPAKAI BERSAMA)
    ===================================================== */
    private static final String BASE_SELECT =
        "SELECT k.id, k.nama, k.tanggal, k.waktu, k.tempat, k.deskripsi, " +
        "k.program_kerja_id, pk.nama AS program_nama, " +
        "b.nama AS bidang_nama, " +
        "d.nama AS departemen_nama, " +
        "k.pic_id, u.nama AS pic_nama " +
        "FROM kegiatan k " +
        "JOIN program_kerja pk ON k.program_kerja_id = pk.id " +
        "JOIN bidang b ON pk.bidang_id = b.id " +
        "JOIN departemen d ON b.departemen_id = d.id " +
        "JOIN users u ON k.pic_id = u.id ";

    /* =====================================================
       GET LIST DATA
    ===================================================== */

    // 🔹 Inti (Semua kegiatan)
    public List<Kegiatan> findAll() {
        List<Kegiatan> list = new ArrayList<>();

        String sql = BASE_SELECT +
            "ORDER BY k.tanggal DESC, k.waktu DESC";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return list;
    }

    // 🔹 Kepala Bidang / Anggota
    public List<Kegiatan> findByBidang(int bidangId) {
        List<Kegiatan> list = new ArrayList<>();

        String sql = BASE_SELECT +
            "WHERE b.id = ? " +
            "ORDER BY k.tanggal DESC, k.waktu DESC";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, bidangId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(map(rs));
                }
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return list;
    }

    // 🔹 Kepala Departemen
    public List<Kegiatan> findByDepartemen(int departemenId) {
        List<Kegiatan> list = new ArrayList<>();

        String sql = BASE_SELECT +
            "WHERE d.id = ? " +
            "ORDER BY k.tanggal DESC, k.waktu DESC";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, departemenId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(map(rs));
                }
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return list;
    }

    // 🔹 Detail kegiatan (Modal)
    public Kegiatan findById(int id) {
        String sql = BASE_SELECT + "WHERE k.id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return map(rs);
                }
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return null;
    }

    /* =====================================================
       CRUD
    ===================================================== */

    public void insert(Kegiatan k) {
        String sql =
            "INSERT INTO kegiatan " +
            "(nama, deskripsi, tanggal, waktu, tempat, program_kerja_id, pic_id) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, k.getNama());
            ps.setString(2, k.getDeskripsi());
            ps.setDate(3, k.getTanggal());
            ps.setTime(4, k.getWaktu());
            ps.setString(5, k.getTempat());
            ps.setInt(6, k.getProgramId());
            ps.setInt(7, k.getPicId());

            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException("Gagal insert kegiatan", e);
        }
    }

    public void update(Kegiatan k) {
        String sql =
            "UPDATE kegiatan SET " +
            "nama=?, deskripsi=?, tanggal=?, waktu=?, tempat=?, program_kerja_id=? " +
            "WHERE id=?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, k.getNama());
            ps.setString(2, k.getDeskripsi());
            ps.setDate(3, k.getTanggal());
            ps.setTime(4, k.getWaktu());
            ps.setString(5, k.getTempat());
            ps.setInt(6, k.getProgramId());
            ps.setInt(7, k.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }
    }

    public void delete(int id) {
        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps =
                conn.prepareStatement("DELETE FROM kegiatan WHERE id=?")
        ) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }
    }

    /* =====================================================
       STATISTIK (UNTUK DASHBOARD PROGRAM & KEGIATAN)
    ===================================================== */

    // 🔹 Total kegiatan (inti)
    public int countKegiatanAll() {
        String sql = "SELECT COUNT(*) FROM kegiatan";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return 0;
    }

    // 🔹 Program terlaksana (inti)
    public int countProgramTerlaksanaAll() {
        String sql =
            "SELECT COUNT(DISTINCT program_kerja_id) FROM kegiatan";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return 0;
    }

    // 🔹 Program terlaksana per departemen
    public int countProgramTerlaksanaByDepartemen(int departemenId) {
        String sql =
            "SELECT COUNT(DISTINCT k.program_kerja_id) " +
            "FROM kegiatan k " +
            "JOIN program_kerja pk ON k.program_kerja_id = pk.id " +
            "JOIN bidang b ON pk.bidang_id = b.id " +
            "WHERE b.departemen_id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, departemenId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return 0;
    }

    // 🔹 Program terlaksana per bidang
    public int countProgramTerlaksanaByBidang(int bidangId) {
        String sql =
            "SELECT COUNT(DISTINCT k.program_kerja_id) " +
            "FROM kegiatan k " +
            "JOIN program_kerja pk ON k.program_kerja_id = pk.id " +
            "WHERE pk.bidang_id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, bidangId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return 0;
    }

    /* =====================================================
       RESULTSET MAPPER (HARUS PALING BAWAH)
    ===================================================== */
    private Kegiatan map(ResultSet rs) throws SQLException {
        Kegiatan k = new Kegiatan();

        k.setId(rs.getInt("id"));
        k.setNama(rs.getString("nama"));
        k.setTanggal(rs.getDate("tanggal"));
        k.setWaktu(rs.getTime("waktu"));
        k.setTempat(rs.getString("tempat"));
        k.setDeskripsi(rs.getString("deskripsi"));

        k.setProgramId(rs.getInt("program_kerja_id"));
        k.setProgramNama(rs.getString("program_nama"));

        k.setPicId(rs.getInt("pic_id"));
        k.setPicNama(rs.getString("pic_nama"));

        k.setBidangNama(rs.getString("bidang_nama"));
        k.setDepartemenNama(rs.getString("departemen_nama"));

        return k;
    }
}
