package model;

import java.sql.Date;
import java.sql.Time;

public class Kegiatan {
    private int id;
    private String nama;
    private String deskripsi;
    private Date tanggal;
    private Time waktu;
    private String tempat;

    private int programId;
    private int picId;
    private String picNama;
    private int bidangId;
    private int departemenId;
    private String programNama;
    private String bidangNama;
    private String departemenNama;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }

    public String getDeskripsi() { return deskripsi; }
    public void setDeskripsi(String deskripsi) { this.deskripsi = deskripsi; }

    public Date getTanggal() { return tanggal; }
    public void setTanggal(Date tanggal) { this.tanggal = tanggal; }

    public Time getWaktu() { return waktu; }
    public void setWaktu(Time waktu) { this.waktu = waktu; }

    public String getTempat() { return tempat; }
    public void setTempat(String tempat) { this.tempat = tempat; }

    public int getProgramId() { return programId; }
    public void setProgramId(int programId) { this.programId = programId; }

    public int getPicId() { return picId; }
    public void setPicId(int picId) { this.picId = picId; }

    public int getBidangId() { return bidangId; }
    public void setBidangId(int bidangId) { this.bidangId = bidangId; }

    public int getDepartemenId() { return departemenId; }
    public void setDepartemenId(int departemenId) { this.departemenId = departemenId; }
    
    public String getPicNama() { return picNama; }
    public void setPicNama(String picNama) { this.picNama = picNama; }
    
    public String getProgramNama() {
    return programNama;
    }

    public void setProgramNama(String programNama) {
        this.programNama = programNama;
    }

    public String getBidangNama() { return bidangNama; }
    public void setBidangNama(String bidangNama) { this.bidangNama = bidangNama; }

    public String getDepartemenNama() { return departemenNama; }
    public void setDepartemenNama(String departemenNama) { this.departemenNama = departemenNama; }
}
