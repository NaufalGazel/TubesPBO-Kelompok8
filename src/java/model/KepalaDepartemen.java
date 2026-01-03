package model;

public class KepalaDepartemen extends User {

    public KepalaDepartemen() {
        this.role = "kepala_departemen";
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
        return "DEPARTEMEN";
    }
}
