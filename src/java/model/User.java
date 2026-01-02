package model;

public abstract class User {

    protected int id;
    protected String nama;
    protected String username;
    protected String password;
    protected String role;
    protected Departemen departemen;
    protected Bidang bidang;

    public User() {}

    // ===== ABSTRACT METHODS (POLYMORPHISM) =====
    public abstract boolean canManageKegiatan();
    public abstract boolean canManagePengumuman();
    public abstract String getScope(); 
    // ALL | DEPARTEMEN | BIDANG

    // ===== GETTER & SETTER =====
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    protected void setRole(String role) {
        this.role = role;
    }

    public Departemen getDepartemen() {
        return departemen;
    }

    public void setDepartemen(Departemen departemen) {
        this.departemen = departemen;
    }

    public Bidang getBidang() {
        return bidang;
    }

    public void setBidang(Bidang bidang) {
        this.bidang = bidang;
    }
    
    public boolean isInti() {
    return role.equals("ketua") ||
           role.equals("wakil") ||
           role.equals("sekretaris") ||
           role.equals("bendahara");
}

    public boolean isKepalaDepartemen() {
        return role.equals("kepala_departemen");
    }

    public boolean isKepalaBidang() {
        return role.equals("kepala_bidang");
    }

    public boolean isAnggota() {
        return role.equals("anggota");
    }
    
    public int getBidangId() {
    return (bidang != null) ? bidang.getId() : 0;
}

    public int getDepartemenId() {
        return (departemen != null) ? departemen.getId() : 0;
    }
    
    public String getRoleLabel() {
    if (role == null) return "";

    switch (role) {
        case "ketua":
            return "Ketua HMIT";
        case "wakil":
            return "Wakil Ketua HMIT";
        case "bendahara":
            return "Bendahara HMIT";
        case "sekretaris":
            return "Sekretaris HMIT";
        case "kepala_departemen":
            return "Kepala Departemen";
        case "kepala_bidang":
            return "Kepala Bidang";
        case "anggota":
            return "Anggota";
        default:
            return role.replace("_", " ");
    }
}

public String getFullRoleLabel() {
    String base = getRoleLabel();

    if ("ketua".equals(role) || "wakil".equals(role) || "bendahara".equals(role) || "sekretaris".equals(role)) {
        return base;
    }

    if ("kepala_departemen".equals(role)) {
        if (departemen != null && departemen.getNama() != null) {
            return base + " " + departemen.getNama();
        }
        return base;
    }

    if ("kepala_bidang".equals(role) || "anggota".equals(role)) {
        if (bidang != null && bidang.getNama() != null) {
            return base + " Bidang " + bidang.getNama();
        }
        return base;
    }

    return base;
}
}