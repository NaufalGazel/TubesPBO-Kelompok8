package model;

import java.sql.Date;
import java.sql.Time;

public class Pengumuman {

    private int id;
    private String judul;
    private String deskripsi;
    private Date tanggal;
    private Time waktu;
    private String tempat;
    private String status;

    private int penulisId;
    private String penulisRole;
    private String penulisLabel;

    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }

    public String getJudul() { 
        return judul; 
    }
    
    public void setJudul(String judul) { 
        this.judul = judul; 
    }

    public String getDeskripsi() { 
        return deskripsi; 
    }
    
    public void setDeskripsi(String deskripsi) { 
        this.deskripsi = deskripsi; 
    }

    public Date getTanggal() { 
        return tanggal; 
    }
    
    public void setTanggal(Date tanggal) { 
        this.tanggal = tanggal; 
    }

    public Time getWaktu() { 
        return waktu; 
    }
    
    public void setWaktu(Time waktu) { 
        this.waktu = waktu; 
    }

    public String getTempat() { 
        return tempat; 
    }
    
    public void setTempat(String tempat) { 
        this.tempat = tempat; 
    }

    public String getStatus() { 
        return status; 
    }
    
    public void setStatus(String status) { 
        this.status = status; 
    }

    public int getPenulisId() { 
        return penulisId; 
    }
    
    public void setPenulisId(int penulisId) { 
        this.penulisId = penulisId; 
    }

    public String getPenulisRole() { 
        return penulisRole; 
    }
    
    public void setPenulisRole(String penulisRole) { 
        this.penulisRole = penulisRole; 
    }
    
    public String getPenulisLabel() {
        return penulisLabel;
    }

    public void setPenulisLabel(String penulisLabel) {
        this.penulisLabel = penulisLabel;
    }
}
