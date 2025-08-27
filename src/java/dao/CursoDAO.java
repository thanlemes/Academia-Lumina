// CursoDAO.java
package dao;

import model.Curso;
import util.ConectaDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CursoDAO {

public boolean inserir(Curso curso) throws ClassNotFoundException {
    try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
        String sql = "INSERT INTO cursos(nome, cargaHoraria, professorId, descricao, createUser) VALUES('"
                + curso.getNome() + "'," + curso.getCargaHoraria() + ","
                + curso.getProfessorId()+ ",'" + curso.getDescricao() + "', '" + curso.getCreateUser() + "')";
        stmt.executeUpdate(sql);
        return true;
    } catch (SQLException ex) {
        System.out.println("Erro ao inserir curso:");
        System.out.println("Mensagem: " + ex.getMessage());
        System.out.println("SQL State: " + ex.getSQLState());
        System.out.println("Código do erro: " + ex.getErrorCode());
        ex.printStackTrace(); // mostra o stack trace completo
        return false;
    }
}


public boolean atualizar(Curso curso) throws ClassNotFoundException {
    try (Connection conexao = ConectaDB.conectar()) {
        // Usando PreparedStatement para evitar SQL injection
        String sql = "UPDATE cursos SET nome=?, cargaHoraria=?, professorId=?, descricao=?, createUser=? WHERE id=?";
        
        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            // Definindo os parâmetros
            stmt.setString(1, curso.getNome());
            stmt.setInt(2, curso.getCargaHoraria());
            stmt.setInt(3, curso.getProfessorId());
            stmt.setString(4, curso.getDescricao());
            stmt.setString(5, curso.getCreateUser());
            stmt.setInt(6, curso.getId());
            
            // Executando a atualização
            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
        }
    } catch (SQLException ex) {
        System.out.println("Erro ao atualizar curso: " + ex);
        System.out.println("ID: " + curso.getId());
        System.out.println("Nome: " + curso.getNome());
        System.out.println("Carga Horaria: " + curso.getCargaHoraria());
        System.out.println("Descrisao: " + curso.getDescricao());
        System.out.println("Professor: " + curso.getProfessorId());
        return false;
    }
}

    public boolean deletar(int id) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "DELETE FROM cursos WHERE id=" + id;
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao deletar curso: " + ex);
            return false;
        }
    }

    public List consultar_curso() throws ClassNotFoundException {
        List lista = new ArrayList<>();

        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM cursos";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setId(rs.getInt("id"));
                curso.setNome(rs.getString("nome"));
                curso.setDescricao(rs.getString("descricao"));
                curso.setCargaHoraria(rs.getInt("cargaHoraria"));
                curso.setProfessorId(rs.getInt("professorId"));
                curso.setCreateUser(rs.getString("createUser"));
                lista.add(curso);
            }
            return lista;
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar cursos: " + ex);
            return null;
        }
    }

    public Curso consultar_por_id(int id) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "SELECT * FROM cursos WHERE id=" + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                Curso curso = new Curso();
                curso.setId(rs.getInt("id"));
                curso.setNome(rs.getString("nome"));
                curso.setDescricao(rs.getString("descricao"));
                curso.setCargaHoraria(rs.getInt("cargaHoraria"));
                curso.setProfessorId(rs.getInt("professorId"));
                curso.setCreateUser(rs.getString("createUser"));
                return curso;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar curso por ID: " + ex);
            return null;
        }
    }

    public List<Curso> listarTodos() throws ClassNotFoundException {
        List<Curso> lista = new ArrayList<>();
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM cursos");
            while (rs.next()) {
                Curso c = new Curso();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setCargaHoraria(rs.getInt("carga_horaria"));
                c.setProfessorId(rs.getInt("professor_id"));
                lista.add(c);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
        }
        return lista;
    }
    public List consultar_curso_id(int id) throws ClassNotFoundException {
        List lista = new ArrayList<>();

        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM cursos WHERE id ="+id;
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setId(rs.getInt("id"));
                curso.setNome(rs.getString("nome"));
                curso.setDescricao(rs.getString("descricao"));
                curso.setCargaHoraria(rs.getInt("cargaHoraria"));
                curso.setProfessorId(rs.getInt("professorId"));
                curso.setCreateUser(rs.getString("createUser"));
                lista.add(curso);
            }
            return lista;
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar cursos: " + ex);
            return null;
        }
    }

    public String consultar_nome_curso_pelo_id(int idCurso) {
        String nomeCurso = "";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConectaDB.conectar(); // Usa sua classe util
            String sql = "SELECT nome FROM cursos WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCurso);
            rs = stmt.executeQuery();

            if (rs.next()) {
                nomeCurso = rs.getString("nome");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro ao consultar nome do curso: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                System.out.println("Erro ao fechar recursos: " + ex.getMessage());
            }
        }

        return nomeCurso;
    }
    public String getNomeCursoPorId(int idCurso) {
    String nomeCurso = "";
    try (Connection conexao = ConectaDB.conectar()) {
        String sql = "SELECT nome FROM cursos WHERE id = ?";
        PreparedStatement stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, idCurso);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            nomeCurso = rs.getString("nome");
        }
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("Erro ao buscar nome do curso: " + e.getMessage());
    }
    return nomeCurso;
}
    public List consultar_curso_prof_id(int id) throws ClassNotFoundException {
        List lista = new ArrayList<>();

        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM cursos WHERE professorId = "+id;
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setId(rs.getInt("id"));
                curso.setNome(rs.getString("nome"));
                curso.setDescricao(rs.getString("descricao"));
                curso.setCargaHoraria(rs.getInt("cargaHoraria"));
                curso.setProfessorId(rs.getInt("professorId"));
                curso.setCreateUser(rs.getString("createUser"));
                lista.add(curso);
            }
            return lista;
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar cursos: " + ex);
            return null;
        }
    }

}


