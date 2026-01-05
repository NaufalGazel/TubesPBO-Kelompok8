package model;

public class ProgramKerja {

    private int id;
    private String nama;
    private int bidangId;
    private int departemenId;

    /* ===== GETTER & SETTER ===== */

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public int getBidangId() {
        return bidangId;
    }

    public void setBidangId(int bidangId) {
        this.bidangId = bidangId;
    }

    public int getDepartemenId() {
        return departemenId;
    }

    public void setDepartemenId(int departemenId) {
        this.departemenId = departemenId;
    }
}
