package model;

/**
 *
 * @author kaike
 */
public class Aluno {
    private int id;
    private String nome;
    private String email;
    private String senha;
    private String cpf;
    private String telefone;
    private String createUser;
    private String matricula;
    private int cursoId;  

    public Aluno() {  
    }
    
    public Aluno(int id, String nome, String matricula, String email, String senha, int cursoId, String createUser, String cpf, String telefone) {
        this.id = id;
        this.nome = nome;
        this.matricula = matricula;
        this.email = email;
        this.senha = senha;
        this.cursoId = cursoId;
        this.createUser = createUser;
        this.cpf = cpf;
        this.telefone = telefone;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public String getEmail() {
        return email;
    }

    public String getSenha() {
        return senha;
    }

    public int getCursoId() {
        return cursoId;
    }

    public String getCreateUser() {
        return createUser;
    }

    public String getCpf() {
        return cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setCursoId(int cursoId) {
        this.cursoId = cursoId;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}
