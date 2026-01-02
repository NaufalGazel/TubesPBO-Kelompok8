package controller;

import dao.KegiatanDAO;
import dao.ProgramDAO;
import dto.ProgramStatDTO;
import model.Kegiatan;
import model.ProgramKerja;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalTime;
import java.sql.Time;

@WebServlet(name = "ProgramKegiatanController", urlPatterns = {"/program-kegiatan"})
public class ProgramKegiatanController extends HttpServlet {

    private final KegiatanDAO kegiatanDAO = new KegiatanDAO();
    private final ProgramDAO programDAO = new ProgramDAO();

    /* ================= GET ================= */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");

        /* =====================================================
           FORM (CREATE / EDIT)
        ===================================================== */
        if ("form".equals(action)) {

            List<ProgramKerja> programList;

            if ((user.isAnggota() || user.isKepalaBidang()) && user.getBidang() != null) {
                programList = programDAO.findByBidang(user.getBidang().getId());

            } else if (user.isKepalaDepartemen() && user.getDepartemen() != null) {
                programList = programDAO.findByDepartemen(user.getDepartemen().getId());

            } else {
                programList = programDAO.findAll(); // INTI
            }

            req.setAttribute("programList", programList);

            if (req.getParameter("id") != null) {
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("kegiatan", kegiatanDAO.findById(id));
            }
            req.setAttribute("activeMenu", "kegiatan");
            req.getRequestDispatcher("/views/kegiatan/form_kegiatan.jsp")
               .forward(req, res);
            return;
        }

        /* =====================================================
           DETAIL (MODAL)
        ===================================================== */
        if ("detail".equals(action)) {

            int id = Integer.parseInt(req.getParameter("id"));
            Kegiatan k = kegiatanDAO.findById(id);

            req.setAttribute("kegiatan", k);
            req.getRequestDispatcher("/views/kegiatan/detail_kegiatan.jsp")
               .forward(req, res);
            return;
        }

        /* =====================================================
           LIST KEGIATAN
        ===================================================== */
        List<Kegiatan> kegiatanList;

        if (user.isInti()) {
            kegiatanList = kegiatanDAO.findAll();

        } else if (user.isKepalaDepartemen() && user.getDepartemen() != null) {
            kegiatanList = kegiatanDAO.findByDepartemen(user.getDepartemen().getId());

        } else if (user.getBidang() != null) {
            kegiatanList = kegiatanDAO.findByBidang(user.getBidang().getId());

        } else {
            kegiatanList = new ArrayList<>();
        }

        req.setAttribute("kegiatanList", kegiatanList);

        /* =====================================================
           STATISTIK (CARD ATAS)
        ===================================================== */
        if (user.isInti()) {

            // INTI → statistik per departemen
            List<ProgramStatDTO> statList =
                    programDAO.getStatPerDepartemen();

            req.setAttribute("statList", statList);
            req.setAttribute("statTitle", "Program Kerja Keseluruhan HMIT");

        } else if (user.isKepalaDepartemen() && user.getDepartemen() != null) {

            // KADEP → statistik per bidang
            List<ProgramStatDTO> statList =
                    programDAO.getStatPerBidang(user.getDepartemen().getId());

            req.setAttribute("statList", statList);
            req.setAttribute(
                    "statTitle",
                    "Program Kerja Departemen " + user.getDepartemen().getNama()
            );

        } else if ((user.isKepalaBidang() || user.isAnggota())
                && user.getBidang() != null) {

            // KABID / ANGGOTA → satu bidang
            ProgramStatDTO stat =
                    programDAO.getStatBidang(user.getBidang().getId());

            req.setAttribute("singleStat", stat);
            req.setAttribute(
                    "statTitle",
                    "Program Kerja Bidang " + user.getBidang().getNama()
            );
        }

        boolean showDepartemen = false;
        boolean showBidang = false;

        if (user.isInti()) {
            showDepartemen = true;
            showBidang = true;
        } else if (user.isKepalaDepartemen()) {
            showBidang = true;
        }

        req.setAttribute("showDepartemen", showDepartemen);
        req.setAttribute("showBidang", showBidang);

        boolean canCrud = user.isAnggota() || user.isKepalaBidang();
        req.setAttribute("canCrud", canCrud);

        req.setAttribute("activeMenu", "kegiatan");
        req.getRequestDispatcher("/views/kegiatan/kegiatan.jsp")
           .forward(req, res);
    }

    /* ================= POST ================= */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String action = req.getParameter("action");

        /* ================= DELETE ================= */
        if ("delete".equals(action)) {

            if (!(user.isAnggota() || user.isKepalaBidang())) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            int id = Integer.parseInt(req.getParameter("id"));
            kegiatanDAO.delete(id);

            res.sendRedirect(req.getContextPath() + "/program-kegiatan");
            return;
        }

        /* ================= INSERT / UPDATE ================= */
        if (!(user.isAnggota() || user.isKepalaBidang())) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        Kegiatan k = new Kegiatan();
        k.setNama(req.getParameter("nama"));
        k.setDeskripsi(req.getParameter("deskripsi"));
        k.setTanggal(java.sql.Date.valueOf(req.getParameter("tanggal")));
        if (waktuStr != null && !waktuStr.isEmpty()) {
            LocalTime lt = LocalTime.parse(waktuStr); 
            k.setWaktu(Time.valueOf(lt));
        }
        k.setTempat(req.getParameter("tempat"));
        k.setProgramId(Integer.parseInt(req.getParameter("program_kerja_id")));
        k.setPicId(user.getId());

        if (req.getParameter("id") == null) {
            kegiatanDAO.insert(k);
        } else {
            k.setId(Integer.parseInt(req.getParameter("id")));
            kegiatanDAO.update(k);
        }

        res.sendRedirect(req.getContextPath() + "/program-kegiatan");
    }
}
