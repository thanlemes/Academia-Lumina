package model;

/**
 *
 * @author kaike
 */
public class Usuarios {
    private int id;
    private String usuario;
    private String email;
    private String senha;
    private String tipo;
    private String cpf;
    private String telefone;
    private String createUser;

    public Usuarios() {
    }

    public Usuarios(int id, String usuario, String email, String senha, String cpf, String telefone, String tipo, String createUser) {
        this.id = id;
        this.usuario = usuario;
        this.email = email;
        this.senha = senha;
        this.cpf = cpf;
        this.telefone = telefone;
        this.tipo = tipo;
        this.createUser = createUser;
    }

    public int getId() {
        return id;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getEmail() {
        return email;
    }

    public String getSenha() {
        return senha;
    }

    public String getCpf() {
        return cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public String getTipo() {
        return tipo;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }
}
