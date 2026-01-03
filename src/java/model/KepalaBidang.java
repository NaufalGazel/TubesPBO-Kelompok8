package model;

public class KepalaBidang extends User {

    public KepalaBidang() {
        this.role = "kepala_bidang";
    }

    @Override
    public boolean canManageKegiatan() {
        return true; 
    }

    @Override
    public boolean canManagePengumuman() {
        return true; 
    }

    @Override
    public String getScope() {
        return "BIDANG";
    }
}
