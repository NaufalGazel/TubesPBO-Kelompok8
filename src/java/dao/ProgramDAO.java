package dao;

import model.ProgramKerja;
import dto.ProgramStatDTO;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProgramDAO {

    // ================= EXISTING (AMAN) =================

    // Anggota / Kabid
    public List<ProgramKerja> findByBidang(int bidangId) {
        List<ProgramKerja> list = new ArrayList<>();

        String sql = "SELECT id, nama FROM program_kerja WHERE bidang_id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, bidangId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProgramKerja p = new ProgramKerja();
                p.setId(rs.getInt("id"));
                p.setNama(rs.getString("nama"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Kepala Departemen
    public List<ProgramKerja> findByDepartemen(int departemenId) {
        List<ProgramKerja> list = new ArrayList<>();

        String sql =
            "SELECT pk.id, pk.nama " +
            "FROM program_kerja pk " +
            "JOIN bidang b ON pk.bidang_id = b.id " +
            "WHERE b.departemen_id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, departemenId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProgramKerja p = new ProgramKerja();
                p.setId(rs.getInt("id"));
                p.setNama(rs.getString("nama"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Inti
    public List<ProgramKerja> findAll() {
        List<ProgramKerja> list = new ArrayList<>();

        String sql = "SELECT id, nama FROM program_kerja ORDER BY nama";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                ProgramKerja p = new ProgramKerja();
                p.setId(rs.getInt("id"));
                p.setNama(rs.getString("nama"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= BARU (STATISTIK) =================

    // 🔹 Statistik INTI (per Departemen)
    public List<ProgramStatDTO> getStatPerDepartemen() {
        List<ProgramStatDTO> list = new ArrayList<>();

        String sql =
            "SELECT d.nama AS label, " +
            "COUNT(DISTINCT pk.id) AS total_program, " +
            "COUNT(DISTINCT CASE WHEN k.id IS NOT NULL THEN pk.id END) AS terlaksana " +
            "FROM departemen d " +
            "LEFT JOIN bidang b ON b.departemen_id = d.id " +
            "LEFT JOIN program_kerja pk ON pk.bidang_id = b.id " +
            "LEFT JOIN kegiatan k ON k.program_kerja_id = pk.id " +
            "GROUP BY d.id, d.nama";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                ProgramStatDTO dto = new ProgramStatDTO();
                dto.setLabel(rs.getString("label"));
                dto.setTotalProgram(rs.getInt("total_program"));
                dto.setTerlaksana(rs.getInt("terlaksana"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔹 Statistik Kepala Departemen (per Bidang)
    public List<ProgramStatDTO> getStatPerBidang(int departemenId) {
        List<ProgramStatDTO> list = new ArrayList<>();

        String sql =
            "SELECT b.nama AS label, " +
            "COUNT(DISTINCT pk.id) AS total_program, " +
            "COUNT(DISTINCT CASE WHEN k.id IS NOT NULL THEN pk.id END) AS terlaksana " +
            "FROM bidang b " +
            "LEFT JOIN program_kerja pk ON pk.bidang_id = b.id " +
            "LEFT JOIN kegiatan k ON k.program_kerja_id = pk.id " +
            "WHERE b.departemen_id = ? " +
            "GROUP BY b.id, b.nama";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, departemenId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProgramStatDTO dto = new ProgramStatDTO();
                dto.setLabel(rs.getString("label"));
                dto.setTotalProgram(rs.getInt("total_program"));
                dto.setTerlaksana(rs.getInt("terlaksana"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔹 Statistik Kabid / Anggota (1 bidang)
    public ProgramStatDTO getStatBidang(int bidangId) {
        ProgramStatDTO dto = new ProgramStatDTO();

        String sql =
            "SELECT COUNT(DISTINCT pk.id) AS total_program, " +
            "COUNT(DISTINCT CASE WHEN k.id IS NOT NULL THEN pk.id END) AS terlaksana " +
            "FROM program_kerja pk " +
            "LEFT JOIN kegiatan k ON k.program_kerja_id = pk.id " +
            "WHERE pk.bidang_id = ?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, bidangId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto.setTotalProgram(rs.getInt("total_program"));
                dto.setTerlaksana(rs.getInt("terlaksana"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
}
