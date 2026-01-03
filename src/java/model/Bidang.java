package model;

public class Bidang {
    private int id;
    private String nama;
    private Departemen departemen;

    public Bidang() {}

    public Bidang(int id, String nama, Departemen departemen) {
        this.id = id;
        this.nama = nama;
        this.departemen = departemen;
    }

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

    public Departemen getDepartemen() {
        return departemen;
    }

    public void setDepartemen(Departemen departemen) {
        this.departemen = departemen;
    }
}
