package model;

public class Anggota extends User {

    public Anggota() {
        this.role = "anggota";
    }

    @Override
    public boolean canManageKegiatan() {
        return true; 
    }

    @Override
    public boolean canManagePengumuman() {
        return false; 
    }

    @Override
    public String getScope() {
        return "BIDANG";
    }
}
