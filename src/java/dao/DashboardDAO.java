package dao;

import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DashboardDAO {

    /* =====================
       TOTAL DEPARTEMEN
       ===================== */
    public int countDepartemen() {
        String sql = "SELECT COUNT(*) FROM departemen";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return 0;
    }

    /* =====================
       TOTAL BIDANG
       ===================== */
    public int countBidang() {
        String sql = "SELECT COUNT(*) FROM bidang";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return 0;
    }

    /* =====================
       TOTAL USER (SEMUA ROLE)
       ===================== */
    public int countUser() {
        String sql = "SELECT COUNT(*) FROM users";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Database operation failed", e);
        }

        return 0;
    }
}
