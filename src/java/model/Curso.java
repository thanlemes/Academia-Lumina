package model;

public class Curso {
    private int id;
    private String nome;
    private int cargaHoraria;
    private int professorId;
    private String descricao;
    private String createUser;
    
    
    public Curso() {
    }
    
    public Curso(int id, String nome, int cargaHoraria, int professorId, String descricao, String createUser) {
        this.id = id;
        this.nome = nome;
        this.cargaHoraria = cargaHoraria;
        this.professorId = professorId;
        this.descricao = descricao;
        this.createUser = createUser;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public int getCargaHoraria() {
        return cargaHoraria;
    }

    public int getProfessorId() {
        return professorId;
    }

    public String getDescricao() {
        return descricao;
    }
    
    public String getCreateUser() {
        return createUser;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCargaHoraria(int cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    public void setProfessorId(int professorId) {
        this.professorId = professorId;
    }  

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }
}