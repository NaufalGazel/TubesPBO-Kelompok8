package dao;

import model.*;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User login(String username, String password) {

        User user = null;

        String sql =
            "SELECT u.*, " +
            "d.id AS departemen_id, d.nama AS departemen_nama, " +
            "b.id AS bidang_id, b.nama AS bidang_nama " +
            "FROM users u " +
            "LEFT JOIN departemen d ON u.departemen_id = d.id " +
            "LEFT JOIN bidang b ON u.bidang_id = b.id " +
            "WHERE u.username = ? AND u.password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String role = rs.getString("role");

                // ===== FACTORY ROLE =====
                switch (role) {
                    case "anggota":
                        user = new Anggota();
                        break;

                    case "kepala_bidang":
                        user = new KepalaBidang();
                        break;

                    case "kepala_departemen":
                        user = new KepalaDepartemen();
                        break;

                    case "ketua":
                    case "wakil":
                    case "sekretaris":
                    case "bendahara":
                        user = new PengurusInti(role);
                        break;
                }

                if (user != null) {
                    // ===== BASIC USER =====
                    user.setId(rs.getInt("id"));
                    user.setNama(rs.getString("nama"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));

                    // ===== DEPARTEMEN =====
                    Integer departemenId = (Integer) rs.getObject("departemen_id");
                    if (departemenId != null) {
                        Departemen d = new Departemen();
                        d.setId(departemenId);
                        d.setNama(rs.getString("departemen_nama"));
                        user.setDepartemen(d);
                    }

                    // ===== BIDANG =====
                    Integer bidangId = (Integer) rs.getObject("bidang_id");
                    if (bidangId != null) {
                        Bidang b = new Bidang();
                        b.setId(bidangId);
                        b.setNama(rs.getString("bidang_nama"));
                        user.setBidang(b);
                    }
                }
            }

        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return user;
    }
}
