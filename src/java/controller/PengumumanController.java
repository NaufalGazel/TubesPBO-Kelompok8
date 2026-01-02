package controller;

import dao.PengumumanDAO;
import model.Pengumuman;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@WebServlet("/pengumuman")
public class PengumumanController extends HttpServlet {

    private final PengumumanDAO dao = new PengumumanDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");

        /* =========================
           DETAIL (AJAX / MODAL)
           ========================= */
        if ("detail".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Pengumuman p = dao.findById(id);

            if (p == null) {
                res.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            // ANGGOTA: hanya boleh lihat yang DITERBITKAN
            if (user.isAnggota() && !"DITERBITKAN".equalsIgnoreCase(p.getStatus())) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            req.setAttribute("pengumuman", p);
            req.getRequestDispatcher("/views/pengumuman/detail_pengumuman.jsp")
               .forward(req, res);
            return;
        }

        /* =========================
           FORM CREATE
           ========================= */
        if ("create".equals(action)) {
            if (user.isAnggota()) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }
            req.setAttribute("activeMenu", "pengumuman");
            req.getRequestDispatcher("/views/pengumuman/form_pengumuman.jsp")
               .forward(req, res);
            return;
        }

        /* =========================
           FORM EDIT (OWNERSHIP CHECK)
           ========================= */
        if ("edit".equals(action)) {
            if (user.isAnggota()) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            int id = Integer.parseInt(req.getParameter("id"));
            Pengumuman p = dao.findById(id);

            if (p == null) {
                res.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            // hanya pemilik yang boleh edit
            if (p.getPenulisId() != user.getId()) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            req.setAttribute("pengumuman", p);
            req.setAttribute("activeMenu", "pengumuman");
            req.getRequestDispatcher("/views/pengumuman/form_pengumuman.jsp")
               .forward(req, res);
            return;
        }

        /* =========================
           LIST (ROLE AWARE)
           ========================= */
        List<Pengumuman> list;
        boolean showStatus;

        if (user.isAnggota()) {
            // ANGGOTA: hanya lihat pengumuman DITERBITKAN
            list = dao.findPublished();
            showStatus = false;
        } else {
            // PENGURUS: lihat SEMUA pengumuman (termasuk draft & milik pengurus lain)
            list = dao.findAll();
            showStatus = true;
        }

        req.setAttribute("pengumumanList", list);
        req.setAttribute("showStatus", showStatus);

        req.setAttribute("activeMenu", "pengumuman");
        req.getRequestDispatcher("/views/pengumuman/pengumuman.jsp")
           .forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            res.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String action = req.getParameter("action");

        /* =========================
           DELETE (OWNERSHIP CHECK)
           ========================= */
        if ("delete".equals(action)) {
            if (user.isAnggota()) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            int id = Integer.parseInt(req.getParameter("id"));
            Pengumuman existing = dao.findById(id);

            if (existing == null) {
                res.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            // hanya pemilik yang boleh hapus
            if (existing.getPenulisId() != user.getId()) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            dao.delete(id);
            res.setStatus(HttpServletResponse.SC_OK);
            return;
        }

        /* =========================
           INSERT / UPDATE
           ========================= */
        if (user.isAnggota()) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        Pengumuman p = new Pengumuman();
        p.setJudul(req.getParameter("judul"));
        p.setDeskripsi(req.getParameter("deskripsi"));
        p.setTanggal(Date.valueOf(req.getParameter("tanggal")));
        p.setWaktu(Time.valueOf(req.getParameter("waktu") + ":00"));
        p.setTempat(req.getParameter("tempat"));
        p.setStatus(req.getParameter("status"));
        p.setPenulisId(user.getId());

        String idParam = req.getParameter("id");

        // INSERT
        if (idParam == null || idParam.isEmpty()) {
            dao.insert(p);
            res.sendRedirect(req.getContextPath() + "/pengumuman");
            return;
        }

        // UPDATE (OWNERSHIP CHECK)
        int id = Integer.parseInt(idParam);
        Pengumuman existing = dao.findById(id);

        if (existing == null) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // hanya pemilik yang boleh update
        if (existing.getPenulisId() != user.getId()) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        p.setId(id);
        dao.update(p);

        res.sendRedirect(req.getContextPath() + "/pengumuman");
    }
}
