package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/tentang")
public class TentangController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("activeMenu", "tentang");
        /* ===============================
           INTI - KETUA & WAKIL (2 CARD)
        =============================== */
        List<Map<String, String>> intiUtama = new ArrayList<>();

        intiUtama.add(createPerson(
                "Arif Winanda Lubis",
                "Ketua HMIT",
                "arif.PNG"
        ));

        intiUtama.add(createPerson(
                "Zhafif Naufal Setyawan",
                "Wakil HMIT",
                "zhafif.PNG"
        ));

        /* ===============================
           INTI - SEKRETARIS & BENDAHARA (4 CARD)
        =============================== */
        List<Map<String, String>> intiLainnya = new ArrayList<>();

        intiLainnya.add(createPerson(
                "Najwa Zahidah Syauqi",
                "Sekretaris 1 HMIT",
                "najwa.PNG"
        ));

        intiLainnya.add(createPerson(
                "Mariska Diksy Yuniar",
                "Sekretaris 2 HMIT",
                "mariska.PNG"
        ));

        intiLainnya.add(createPerson(
                "Theodora Marshanda Siregar",
                "Bendahara 1 HMIT",
                "theodora.PNG"
        ));

        intiLainnya.add(createPerson(
                "Risydha Lyna Dewi Azizah",
                "Bendahara 2 HMIT",
                "lyna.PNG"
        ));

        /* ===============================
           KEPALA DEPARTEMEN (3 CARD)
        =============================== */
        List<Map<String, String>> kepalaDepartemen = new ArrayList<>();

        kepalaDepartemen.add(createPerson(
                "Jeiver Junior Lahilote",
                "Kepala Departemen Internal",
                "jeiver.PNG"
        ));
        
        kepalaDepartemen.add(createPerson(
                "Pande Made Agung",
                "Kepala Departemen Eksternal",
                "pande.PNG"
        ));
        
        kepalaDepartemen.add(createPerson(
                "Yosua Karyadi Putra",
                "Kepala Departemen PSDM",
                "yosua.PNG"
        ));

        /* ===============================
           KEPALA BIDANG (7 CARD → 4 + 3)
        =============================== */
        List<Map<String, String>> kepalaBidang = new ArrayList<>();

        kepalaBidang.add(createPerson("Grace Sihotang", "Kepala Bidang Kemahasiswaan", "grace.PNG"));
        kepalaBidang.add(createPerson("Rama Aulia Ramadan", "Kepala Bidang Business and Development", "rama.PNG"));
        kepalaBidang.add(createPerson("Esterlin Imanuela Siahaya", "Kepala Bidang Public Relation", "esterlin.PNG"));
        kepalaBidang.add(createPerson("Rafael Sebastian", "Kepala Bidang Kominfo", "rafael.PNG"));
        kepalaBidang.add(createPerson("Reuben Abdiel Pradipa", "Kepala Bidang Kaderisasi", "reuben.PNG"));
        kepalaBidang.add(createPerson("Muhamad Rafdi Rostiadhipramana", "Kepala Bidang Minat Bakat", "rafdi.PNG"));
        kepalaBidang.add(createPerson("Rayyn Derya Anthares", "Kepala Bidang Akademik", "derya.PNG"));

        /* ===============================
           SEND TO VIEW
        =============================== */
        req.setAttribute("intiUtama", intiUtama);
        req.setAttribute("intiLainnya", intiLainnya);
        req.setAttribute("kepalaDepartemen", kepalaDepartemen);
        req.setAttribute("kepalaBidang", kepalaBidang);

        req.getRequestDispatcher("/views/tentang.jsp")
           .forward(req, resp);
    }

    /* ===============================
       HELPER METHOD
    =============================== */
    private Map<String, String> createPerson(
            String nama,
            String jabatan,
            String foto
    ) {
        Map<String, String> person = new HashMap<>();
        person.put("nama", nama);
        person.put("jabatan", jabatan);
        person.put("foto", foto);
        return person;
    }
}
