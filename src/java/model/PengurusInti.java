package model;

public class PengurusInti extends User {

    public PengurusInti(String jabatan) {
        this.role = jabatan;
    }

    @Override
    public boolean canManageKegiatan() {
        return false; 
    }

    @Override
    public boolean canManagePengumuman() {
        return true; 
    }

    @Override
    public String getScope() {
        return "ALL";
    }
}
