
// AvaliacaoDAO.java
package dao;


import model.Avaliacao;
import util.ConectaDB;
import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class AvaliacaoDAO {

    public boolean inserir(Avaliacao a) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "INSERT INTO avaliacoes(id, aluno_id, curso_id, nota1, nota2, nota_final, faltas, status) VALUES("
                         + a.getId() + "," + a.getAlunoId() + "," + a.getCursoId() + "," + a.getNota1() + ","
                         + a.getNota2() + "," + a.getNotaFinal() + "," + a.getFaltas() + ", '" + a.getStatus() + "')";
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir avaliação: " + ex);
            return false;
        }
    }

    public boolean atualizar(Avaliacao a) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "UPDATE avaliacoes SET aluno_id=" + a.getAlunoId() + ", curso_id=" + a.getCursoId()
                         + ", nota1=" + a.getNota1() + ", nota2=" + a.getNota2() + ", nota_final=" + a.getNotaFinal()
                         + ", faltas=" + a.getFaltas() + ", status='" + a.getStatus() + "' WHERE id=" + a.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar avaliação: " + ex);
            return false;
        }
    }
    
public List avaliacao_por_aluno_id(int id) throws ClassNotFoundException, ParseException {
        List lista = new ArrayList();
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM avaliacoes WHERE aluno_id = "+id;
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                Avaliacao ava = new Avaliacao();
                ava.setId(Integer.parseInt(rs.getString("id")));
                ava.setAlunoId(Integer.parseInt(rs.getString("aluno_id")));
                ava.setCursoId(Integer.parseInt(rs.getString("curso_id")));
                ava.setNota1(Double.parseDouble(rs.getString("nota1")));
                ava.setNota2(Double.parseDouble(rs.getString("nota2")));
                ava.setNotaFinal(Double.parseDouble(rs.getString("nota_final")));
                ava.setFaltas(Integer.parseInt(rs.getString("faltas")));
                ava.setStatus(rs.getString("status"));
                lista.add(ava);
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
    public Avaliacao buscarPorAlunoId(int alunoId) throws ClassNotFoundException {
        Connection conexao = null;
        Avaliacao avaliacao = null;

        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM avaliacoes WHERE aluno_id = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, alunoId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                avaliacao = new Avaliacao();
                avaliacao.setId(rs.getInt("id"));
                avaliacao.setAlunoId(rs.getInt("aluno_id"));
                avaliacao.setCursoId(rs.getInt("curso_id"));
                avaliacao.setNota1(rs.getDouble("nota1"));
                avaliacao.setNota2(rs.getDouble("nota2"));
                avaliacao.setNotaFinal(rs.getDouble("nota_final"));
                avaliacao.setFaltas(rs.getInt("faltas"));
                avaliacao.setStatus(rs.getString("status"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar avaliação: " + ex.getMessage());
        }

        return avaliacao;
    }
    public boolean update_avalicao(Avaliacao avaliacao) throws ClassNotFoundException {
    Connection conexao = null;
    PreparedStatement stmt = null;

    try {
        conexao = ConectaDB.conectar();

        if (avaliacao.getId() != 0) {
            // UPDATE
            String sql = "UPDATE avaliacoes SET curso_id = ?, nota1 = ?, nota2 = ?, nota_final = ?, faltas = ?, status = ? WHERE id = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, avaliacao.getCursoId());
            stmt.setDouble(2, avaliacao.getNota1());
            stmt.setDouble(3, avaliacao.getNota2());
            stmt.setDouble(4, avaliacao.getNotaFinal());
            stmt.setInt(5, avaliacao.getFaltas());
            stmt.setString(6, avaliacao.getStatus());
            stmt.setInt(7, avaliacao.getId());
        } else {
            // INSERT
            String sql = "INSERT INTO avaliacoes (aluno_id, curso_id, nota1, nota2, nota_final, faltas, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, avaliacao.getAlunoId());
            stmt.setInt(2, avaliacao.getCursoId());
            stmt.setDouble(3, avaliacao.getNota1());
            stmt.setDouble(4, avaliacao.getNota2());
            stmt.setDouble(5, avaliacao.getNotaFinal());
            stmt.setInt(6, avaliacao.getFaltas());
            stmt.setString(7, avaliacao.getStatus());
        }

        int linhasAfetadas = stmt.executeUpdate();
        return linhasAfetadas > 0;

    } catch (SQLException ex) {
        System.out.println("Erro ao salvar ou atualizar avaliação: " + ex.getMessage());
        return false;
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conexao != null) conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
    public int contarRegistros(String tabela) {
        int total = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = ConectaDB.conectar();
            String sql = "SELECT COUNT(*) AS total FROM " + tabela;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                total = rs.getInt("total");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro ao contar registros: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                System.out.println("Erro ao fechar recursos: " + ex.getMessage());
            }
        }
        
        return total;
    }
   public Avaliacao buscar_ava_aluno(int alunoId, int cursoId) throws ClassNotFoundException {
    Connection conexao = null;
    Avaliacao avaliacao = null;

    try {
        conexao = ConectaDB.conectar();

        String sql = "SELECT a.id, a.aluno_id, a.curso_id, a.nota1, a.nota2, a.nota_final, a.faltas, a.status " +
                     "FROM avaliacoes a " +
                     "INNER JOIN alunos al ON a.aluno_id = al.id " +
                     "INNER JOIN cursos c ON a.curso_id = c.id " +
                     "WHERE a.aluno_id = ? AND a.curso_id = ? " +
                     "LIMIT 1";

        PreparedStatement stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, alunoId);
        stmt.setInt(2, cursoId);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            avaliacao = new Avaliacao();
            avaliacao.setId(rs.getInt("id"));
            avaliacao.setAlunoId(rs.getInt("aluno_id"));
            avaliacao.setCursoId(rs.getInt("curso_id"));
            avaliacao.setNota1(rs.getDouble("nota1"));
            avaliacao.setNota2(rs.getDouble("nota2"));
            avaliacao.setNotaFinal(rs.getDouble("nota_final"));
            avaliacao.setFaltas(rs.getInt("faltas"));
            avaliacao.setStatus(rs.getString("status"));
        }

    } catch (SQLException ex) {
        System.out.println("Erro ao buscar avaliação: " + ex.getMessage());
    }

    return avaliacao;
}

}

 
