// ProfessorDAO.java
package dao;

import model.Professor;
import util.ConectaDB;
import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class ProfessorDAO {

    public boolean inserirProfessor(Professor professor) throws ClassNotFoundException {
    try (Connection conexao = ConectaDB.conectar(); 
         Statement stmt = conexao.createStatement()) {
        String sql = "INSERT INTO professores (id, nome, email, cpf, telefone, createUser, senha) VALUES (" 
                   + professor.getId() + ", '" 
                   + professor.getNome() + "', '" 
                   + professor.getEmail() + "', '" 
                   + professor.getCpf() + "', '" 
                   + professor.getTelefone() + "', '" 
                   + professor.getCreateUser() + "', '" 
                   + professor.getSenha() + "')";
        stmt.executeUpdate(sql);
        return true;
    } catch (SQLException ex) {
        System.out.println("Erro ao inserir professor: " + ex.getMessage());
        return false;
    }
}


    public List consultar_lista_simples() throws ClassNotFoundException {
        List lista = new ArrayList();

        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM professores";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                Professor prof = new Professor();
                prof.setId(Integer.parseInt(rs.getString("id")));
                prof.setNome(rs.getString("nome"));
                prof.setEmail(rs.getString("email"));
                prof.setTelefone(rs.getString("telefone"));
                prof.setSenha(rs.getString("senha"));
                prof.setCpf(rs.getString("cpf"));
                lista.add(prof);
                n_reg++;
            }

            if (n_reg == 0) {
                return null;
            } else {
                return lista;
            }
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return null;
        }
    }

    public Professor consultar_por_id(Professor id) throws ClassNotFoundException, ParseException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM professores WHERE id = " + id.getId();
            ResultSet rs = stmt.executeQuery(sql); // Select

            int n_reg = 0;
            while (rs.next()) {
                id.setId(rs.getInt("id"));
                id.setNome(rs.getString("nome"));
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
    public boolean existe_professor_id(int id) throws ClassNotFoundException {
    Connection conexao = null;
    try {
        conexao = ConectaDB.conectar();
        Statement stmt = conexao.createStatement();
        String sql = "SELECT id FROM professores WHERE id = " + id;
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            return true; // Professor encontrado
        } else {
            return false; // Professor não encontrado
        }

    } catch (SQLException ex) {
        System.out.println("Erro ao verificar professor por ID: " + ex);
        return false;
    }
}

    public boolean atualizar(Professor prof) throws ClassNotFoundException {
        String sql = "UPDATE professores SET nome=?, email=?, senha=?, cpf=?, telefone=? WHERE id=?";

        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setString(1, prof.getNome());
            stmt.setString(2, prof.getEmail());
            stmt.setString(3, prof.getSenha());
            stmt.setString(4, prof.getCpf());
            stmt.setString(5, prof.getTelefone());
            stmt.setInt(6, prof.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar prof: " + ex);
            return false;
        }
    }
public boolean deletar(Professor professor) throws ClassNotFoundException {
    String sqlAvaliacoesPorAluno = "DELETE FROM avaliacoes WHERE aluno_id IN (SELECT id FROM alunos WHERE curso_id IN (SELECT id FROM cursos WHERE professorId = ?))";
    String sqlAvaliacoesPorCurso = "DELETE FROM avaliacoes WHERE curso_id IN (SELECT id FROM cursos WHERE professorId = ?)";
    String sqlAlunos = "DELETE FROM alunos WHERE curso_id IN (SELECT id FROM cursos WHERE professorId = ?)";
    String sqlCursos = "DELETE FROM cursos WHERE professorId = ?";
    String sqlProfessor = "DELETE FROM professores WHERE id = ?";

    try (Connection conexao = ConectaDB.conectar()) {
        conexao.setAutoCommit(false); // Iniciar transação

        try (
            PreparedStatement stmtAvaliacoesAluno = conexao.prepareStatement(sqlAvaliacoesPorAluno);
            PreparedStatement stmtAvaliacoesCurso = conexao.prepareStatement(sqlAvaliacoesPorCurso);
            PreparedStatement stmtAlunos = conexao.prepareStatement(sqlAlunos);
            PreparedStatement stmtCursos = conexao.prepareStatement(sqlCursos);
            PreparedStatement stmtProfessor = conexao.prepareStatement(sqlProfessor)
        ) {
            // 1. Deletar avaliações ligadas aos alunos
            stmtAvaliacoesAluno.setInt(1, professor.getId());
            stmtAvaliacoesAluno.executeUpdate();

            // 2. Deletar avaliações ligadas aos cursos (caso sobrou alguma)
            stmtAvaliacoesCurso.setInt(1, professor.getId());
            stmtAvaliacoesCurso.executeUpdate();

            // 3. Deletar alunos
            stmtAlunos.setInt(1, professor.getId());
            stmtAlunos.executeUpdate();

            // 4. Deletar cursos
            stmtCursos.setInt(1, professor.getId());
            stmtCursos.executeUpdate();

            // 5. Deletar professor
            stmtProfessor.setInt(1, professor.getId());
            stmtProfessor.executeUpdate();

            conexao.commit();
            return true;
        } catch (SQLException ex) {
            conexao.rollback();
            System.out.println("Erro ao deletar Professor (rollback): " + ex);
            return false;
        }
    } catch (SQLException ex) {
        System.out.println("Erro de conexão ao deletar Professor: " + ex);
        return false;
    }
}


    public boolean validar_acesso(Professor professor) {
        String sql = "SELECT * FROM professores WHERE email = '"+professor.getEmail()+"' AND senha = '"+professor.getSenha()+"'";

        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {

            /* Define os parâmetros do PreparedStatement
            stmt.setString(1, professor.getEmail());
            stmt.setString(2, professor.getSenha());
            */
            // Executa a consulta
            System.out.println("instrucao sql: "+sql);
            ResultSet rs = stmt.executeQuery();

            // Se encontrou algum resultado, o usuário existe
            return rs.next();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro ao validar acesso: " + ex);
            return false;
        }
    }

}
