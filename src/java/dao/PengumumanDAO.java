package dao;

import model.Pengumuman;
import util.DBConnection;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PengumumanDAO {

    /* =========================
       GET ALL (PENGURUS / ADMIN)
       ========================= */
    public List<Pengumuman> findAll() {
        List<Pengumuman> list = new ArrayList<>();

        String sql =
            "SELECT p.*, " +
            "u.role AS penulis_role, " +
            "d.nama AS departemen_nama, " +
            "b.nama AS bidang_nama " +
            "FROM pengumuman p " +
            "JOIN users u ON p.penulis_id = u.id " +
            "LEFT JOIN departemen d ON u.departemen_id = d.id " +
            "LEFT JOIN bidang b ON u.bidang_id = b.id " +
            "ORDER BY p.tanggal DESC, p.waktu DESC";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return list;
    }

    /* =========================
       GET BY USER (OWNERSHIP)
       ========================= */
    public List<Pengumuman> findByPenulis(int penulisId) {

        List<Pengumuman> list = new ArrayList<>();

        String sql =
            "SELECT p.*, " +
            "u.role AS penulis_role, " +
            "d.nama AS departemen_nama, " +
            "b.nama AS bidang_nama " +
            "FROM pengumuman p " +
            "JOIN users u ON p.penulis_id = u.id " +
            "LEFT JOIN departemen d ON u.departemen_id = d.id " +
            "LEFT JOIN bidang b ON u.bidang_id = b.id " +
            "WHERE p.penulis_id = ? " +
            "ORDER BY p.tanggal DESC, p.waktu DESC";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, penulisId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return list;
    }

    /* =========================
       GET PUBLISHED (ANGGOTA)
       ========================= */
    public List<Pengumuman> findPublished() {

        List<Pengumuman> list = new ArrayList<>();

        String sql =
            "SELECT p.*, " +
            "u.role AS penulis_role, " +
            "d.nama AS departemen_nama, " +
            "b.nama AS bidang_nama " +
            "FROM pengumuman p " +
            "JOIN users u ON p.penulis_id = u.id " +
            "LEFT JOIN departemen d ON u.departemen_id = d.id " +
            "LEFT JOIN bidang b ON u.bidang_id = b.id " +
            "WHERE p.status = 'DITERBITKAN' " +
            "ORDER BY p.tanggal DESC, p.waktu DESC";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return list;
    }

    /* =========================
       GET BY ID
       ========================= */
    public Pengumuman findById(int id) {

        String sql =
            "SELECT p.*, " +
            "u.role AS penulis_role, " +
            "d.nama AS departemen_nama, " +
            "b.nama AS bidang_nama " +
            "FROM pengumuman p " +
            "JOIN users u ON p.penulis_id = u.id " +
            "LEFT JOIN departemen d ON u.departemen_id = d.id " +
            "LEFT JOIN bidang b ON u.bidang_id = b.id " +
            "WHERE p.id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return null;
    }

    /* =========================
       OWNERSHIP CHECK
       ========================= */
    public boolean isOwnedBy(int pengumumanId, int userId) {

        String sql =
            "SELECT 1 FROM pengumuman " +
            "WHERE id = ? AND penulis_id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, pengumumanId);
            ps.setInt(2, userId);

            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

    }

    /* =========================
       INSERT
       ========================= */
    public void insert(Pengumuman p) {

        String sql =
            "INSERT INTO pengumuman " +
            "(judul, deskripsi, tanggal, waktu, tempat, status, penulis_id) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, p.getJudul());
            ps.setString(2, p.getDeskripsi());
            ps.setDate(3, p.getTanggal());
            ps.setTime(4, p.getWaktu());
            ps.setString(5, p.getTempat());
            ps.setString(6, p.getStatus());
            ps.setInt(7, p.getPenulisId());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }
    }

    /* =========================
       UPDATE
       ========================= */
    public void update(Pengumuman p) {

        String sql =
            "UPDATE pengumuman SET " +
            "judul = ?, deskripsi = ?, tanggal = ?, waktu = ?, tempat = ?, status = ? " +
            "WHERE id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, p.getJudul());
            ps.setString(2, p.getDeskripsi());
            ps.setDate(3, p.getTanggal());
            ps.setTime(4, p.getWaktu());
            ps.setString(5, p.getTempat());
            ps.setString(6, p.getStatus());
            ps.setInt(7, p.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }
    }

    /* =========================
       DELETE
       ========================= */
    public void delete(int id) {

        String sql = "DELETE FROM pengumuman WHERE id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }
    }

    /* =========================
       MAPPER
       ========================= */
    private Pengumuman mapRow(ResultSet rs) throws SQLException {

        Pengumuman p = new Pengumuman();

        p.setId(rs.getInt("id"));
        p.setJudul(rs.getString("judul"));
        p.setDeskripsi(rs.getString("deskripsi"));
        p.setTanggal(rs.getDate("tanggal"));
        p.setWaktu(rs.getTime("waktu"));
        p.setTempat(rs.getString("tempat"));
        p.setStatus(rs.getString("status"));
        p.setPenulisId(rs.getInt("penulis_id"));

        String role = rs.getString("penulis_role");
        String departemen = rs.getString("departemen_nama");
        String bidang = rs.getString("bidang_nama");

        p.setPenulisRole(role);

        String label;
        switch (role) {
            case "ketua":
                label = "Ketua HMIT";
                break;
            case "wakil":
                label = "Wakil Ketua HMIT";
                break;
            case "sekretaris":
                label = "Sekretaris HMIT";
                break;
            case "bendahara":
                label = "Bendahara HMIT";
                break;
            case "kepala_departemen":
                label = "Kepala Departemen " + departemen;
                break;
            case "kepala_bidang":
                label = "Kepala Bidang " + bidang;
                break;
            default:
                label = "Anggota " + bidang;
        }

        p.setPenulisLabel(label);

        return p;
    }
}
