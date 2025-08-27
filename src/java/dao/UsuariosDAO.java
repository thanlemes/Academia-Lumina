package dao;

import model.Usuarios;
import util.ConectaDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDAO {

    // CREATE
        public boolean inserir_usuario(Usuarios usuario) {
        String sql = "INSERT INTO usuarios (usuario, email, senha, cpf, telefone, tipo, createUser) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConectaDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getEmail());
            ps.setString(3, usuario.getSenha());
            ps.setString(4, usuario.getCpf());
            ps.setString(5, usuario.getTelefone());
            ps.setString(6, usuario.getTipo());
            ps.setString(7, usuario.getCreateUser());

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ (listar todos)
    public List<Usuarios> consultar_lista_simples() throws ClassNotFoundException {
        List<Usuarios> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Usuarios usuario = new Usuarios();
                usuario.setId(rs.getInt("id"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTipo(rs.getString("tipo"));
                usuario.setEmail(rs.getString("email"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setTelefone(rs.getString("telefone"));
                lista.add(usuario);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao listar usuários: " + ex);
        }
        return lista;
    }

    // READ (buscar por ID)
    public Usuarios consultar_por_id(Usuarios id) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM usuarios WHERE id = " + id.getId();
            ResultSet rs = stmt.executeQuery(sql); // Select

            int n_reg = 0;
            while (rs.next()) {
                id.setId(rs.getInt("id"));
                id.setUsuario(rs.getString("usuario"));
                id.setTipo(rs.getString("tipo"));
                id.setEmail(rs.getString("email"));
                id.setSenha(rs.getString("senha"));
                id.setCpf(rs.getString("cpf"));
                id.setTelefone(rs.getString("telefone"));
                n_reg++;
                return id;
            }

            if (n_reg == 0) {
                return null;
            } else {
                return id;
            }
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return null;
        }
    }

    // UPDATE
    public boolean atualizar(Usuarios usuario) throws ClassNotFoundException {
        String sql = "UPDATE usuarios SET usuario=?, senha=?, tipo=?, email=?, cpf=?, telefone=? WHERE id=?";
        try (Connection conexao = ConectaDB.conectar(); PreparedStatement pstmt = conexao.prepareStatement(sql)) {
            pstmt.setString(1, usuario.getUsuario());
            pstmt.setString(2, usuario.getSenha());
            pstmt.setString(3, usuario.getTipo());
            pstmt.setString(4, usuario.getEmail());
            pstmt.setString(5, usuario.getCpf());
            pstmt.setString(6, usuario.getTelefone());
            pstmt.setInt(7, usuario.getId());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar usuario: " + ex);
            return false;
        }
    }

    // DELETE
    public boolean deletar(Usuarios user) throws ClassNotFoundException {
        String sql = "DELETE FROM usuarios WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar(); PreparedStatement pstmt = conexao.prepareStatement(sql)) {
            pstmt.setInt(1, user.getId());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao deletar usuário: " + ex);
            return false;
        }
    }

    public boolean validar_acesso(Usuarios usuario) {
    String sql = "SELECT * FROM usuarios WHERE email = '" + usuario.getEmail() + "' AND senha = '" + usuario.getSenha() + "';";

    try (Connection conexao = ConectaDB.conectar();
         PreparedStatement stmt = conexao.prepareStatement(sql)) {

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            // Preenchendo os dados do usuário logado
            usuario.setId(rs.getInt("id"));
            usuario.setUsuario(rs.getString("usuario"));
            usuario.setEmail(rs.getString("email"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setCpf(rs.getString("cpf"));
            usuario.setTelefone(rs.getString("telefone"));
            usuario.setTipo(rs.getString("tipo")); // <- ESSA LINHA FOI ADICIONADA
            usuario.setCreateUser(rs.getString("createUser"));

            return true;
        }

        return false;

    } catch (SQLException | ClassNotFoundException ex) {
        System.out.println("Erro ao validar acesso: " + ex);
        return false;
    }
}


} 