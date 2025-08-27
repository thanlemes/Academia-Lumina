package dao;

import model.Aluno;
import model.Usuarios;
import model.Professor;
import util.ConectaDB;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class AlunoDAO {

    public boolean inserir_aluno(Aluno aluno) {
        String sql = "INSERT INTO alunos (nome, matricula, email, senha, curso_id, createUser, cpf, telefone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConectaDB.conectar(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, aluno.getNome());
            ps.setString(2, aluno.getMatricula());
            ps.setString(3, aluno.getEmail());
            ps.setString(4, aluno.getSenha());
            ps.setInt(5, aluno.getCursoId());
            ps.setString(6, aluno.getCreateUser());
            ps.setString(7, aluno.getCpf());
            ps.setString(8, aluno.getTelefone());

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean atualizar(Aluno aluno) throws ClassNotFoundException {
        String sql = "UPDATE alunos SET nome=?, email=?, senha=?, cpf=?, telefone=?, matricula=?, curso_id=? WHERE id=?";

        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getEmail());
            stmt.setString(3, aluno.getSenha());
            stmt.setString(4, aluno.getCpf());
            stmt.setString(5, aluno.getTelefone());
            stmt.setString(6, aluno.getMatricula());
            stmt.setInt(7, aluno.getCursoId());
            stmt.setInt(8, aluno.getId());

            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar aluno: " + ex);
            return false;
        }
    }


    public boolean deletar(Aluno aluno) throws ClassNotFoundException {
    String sqlCursos = "DELETE FROM avaliacoes WHERE aluno_id = ?";
    String sqlProfessor = "DELETE FROM alunos WHERE id = ?";

    try (Connection conexao = ConectaDB.conectar()) {
        // Primeiro deletar os cursos
        try (PreparedStatement stmtCursos = conexao.prepareStatement(sqlCursos)) {
            stmtCursos.setInt(1, aluno.getId());
            stmtCursos.executeUpdate();
        }

        // Depois deletar o professor
        try (PreparedStatement stmtProfessor = conexao.prepareStatement(sqlProfessor)) {
            stmtProfessor.setInt(1, aluno.getId());
            stmtProfessor.executeUpdate();
        }

        return true;
    } catch (SQLException ex) {
        System.out.println("Erro ao deletar Aluno: " + ex);
        return false;
    }
}

    public Aluno consultar_por_id(Aluno id) throws ClassNotFoundException, ParseException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM alunos WHERE id = " + id.getId();
            ResultSet rs = stmt.executeQuery(sql); // Select

            int n_reg = 0;
            while (rs.next()) {
                id.setId(rs.getInt("id"));
                id.setNome(rs.getString("nome"));
                id.setEmail(rs.getString("email"));
                id.setSenha(rs.getString("senha"));
                id.setCpf(rs.getString("cpf"));
                id.setTelefone(rs.getString("telefone"));
                id.setMatricula(rs.getString("matricula"));
                id.setCursoId(rs.getInt("curso_id"));
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

    //faz mais sentido colocar no professor
    public List<Aluno> listarPorCurso(int cursoId) throws ClassNotFoundException {
        List<Aluno> lista = new ArrayList<>();
        String sql = "SELECT * FROM alunos WHERE curso_id = ?";

        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setInt(1, cursoId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setId(rs.getInt("id"));
                aluno.setNome(rs.getString("nome"));
                aluno.setEmail(rs.getString("email"));
                aluno.setMatricula(rs.getString("matricula"));
                aluno.setCursoId(rs.getInt("curso_id"));
                lista.add(aluno);
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao listar alunos por curso: " + ex);
        }
        return lista;
    }

public Object validarAcesso(String email, String senha) {
    String sql = 
        "SELECT 'aluno' AS tipo, id, nome, email, senha, cpf, telefone, NULL AS usuario, NULL AS tipo_usuario, matricula " +
        "FROM alunos WHERE email = ? AND senha = ? " +
        "UNION ALL " +
        "SELECT 'professor' AS tipo, id, nome, email, senha, cpf, telefone, NULL AS usuario, NULL AS tipo_usuario, NULL AS matricula " +
        "FROM professores WHERE email = ? AND senha = ? " +
        "UNION ALL " +
        "SELECT 'usuario' AS tipo, id, usuario AS nome, email, senha, cpf, telefone, usuario, tipo AS tipo_usuario, NULL AS matricula " +
        "FROM usuarios WHERE email = ? AND senha = ? " +
        "LIMIT 1";

    try (Connection conexao = ConectaDB.conectar();
         PreparedStatement stmt = conexao.prepareStatement(sql)) {

        for (int i = 0; i < 3; i++) {
            stmt.setString(i * 2 + 1, email);
            stmt.setString(i * 2 + 2, senha);
        }

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            String tipo = rs.getString("tipo");

            switch (tipo) {
                case "aluno":
                    Aluno aluno = new Aluno();
                    aluno.setId(rs.getInt("id"));
                    aluno.setNome(rs.getString("nome"));
                    aluno.setEmail(rs.getString("email"));
                    aluno.setSenha(rs.getString("senha"));
                    aluno.setCpf(rs.getString("cpf"));
                    aluno.setTelefone(rs.getString("telefone"));
                    aluno.setMatricula(rs.getString("matricula"));
                    // 'createUser' não está no SELECT. Adicione ao SELECT se necessário.
                    return aluno;

                case "professor":
                    Professor professor = new Professor();
                    professor.setId(rs.getInt("id"));
                    professor.setNome(rs.getString("nome"));
                    professor.setEmail(rs.getString("email"));
                    professor.setSenha(rs.getString("senha"));
                    professor.setCpf(rs.getString("cpf"));
                    professor.setTelefone(rs.getString("telefone"));
                    return professor;

                case "usuario":
                    Usuarios usuario = new Usuarios();
                    usuario.setId(rs.getInt("id"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("senha"));
                    usuario.setCpf(rs.getString("cpf"));
                    usuario.setTelefone(rs.getString("telefone"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setTipo(rs.getString("tipo_usuario")); // Corrigido
                    return usuario;
            }
        }
    } catch (SQLException | ClassNotFoundException ex) {
        System.out.println("Erro ao validar acesso: " + ex);
    }
    return null;
}

    public List consultar_lista_simples() throws ClassNotFoundException, ParseException {
        List lista = new ArrayList();
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM alunos";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setId(Integer.parseInt(rs.getString("id")));
                aluno.setNome(rs.getString("nome"));
                aluno.setEmail(rs.getString("email"));
                aluno.setTelefone(rs.getString("telefone"));
                aluno.setCursoId(Integer.parseInt(rs.getString("curso_id")));
                aluno.setMatricula(rs.getString("matricula"));
                aluno.setCreateUser(rs.getString("createUser"));
                aluno.setCpf(rs.getString("cpf"));
                lista.add(aluno);
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

    public List<Aluno> consultar_cursos_do_alunoID(int id) throws ClassNotFoundException {
        List<Aluno> lista = new ArrayList<>();
        String sql = "SELECT * FROM cursos WHERE aluno_id = ? ";

        return lista;
    }
public Object validarAcesso2(String email, String senha) {
    String sql = "SELECT 'aluno' AS tipo, id, nome, email, senha, cpf, telefone, NULL AS usuario, NULL AS tipo_usuario, matricula "
               + "FROM alunos WHERE email = ? AND senha = ? "
               + "UNION ALL "
               + "SELECT 'professor' AS tipo, id, nome, email, senha, cpf, telefone, NULL AS usuario, NULL AS tipo_usuario, NULL AS matricula "
               + "FROM professores WHERE email = ? AND senha = ? "
               + "UNION ALL "
               + "SELECT 'usuario' AS tipo, id, usuario AS nome, email, senha, cpf, telefone, usuario, tipo AS tipo_usuario, NULL AS matricula "
               + "FROM usuarios WHERE email = ? AND senha = ? "
               + "LIMIT 1";

    try (Connection conexao = ConectaDB.conectar(); 
         PreparedStatement stmt = conexao.prepareStatement(sql)) {
        
        // Setar parâmetros para todas as consultas
        stmt.setString(1, email);
        stmt.setString(2, senha);
        stmt.setString(3, email);
        stmt.setString(4, senha);
        stmt.setString(5, email);
        stmt.setString(6, senha);

        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            String tipo = rs.getString("tipo");
            
            if ("aluno".equals(tipo)) {
                Aluno aluno = new Aluno();
                aluno.setId(rs.getInt("id"));
                aluno.setNome(rs.getString("nome"));
                aluno.setEmail(rs.getString("email"));
                aluno.setSenha(rs.getString("senha"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setTelefone(rs.getString("telefone"));
                aluno.setMatricula(rs.getString("matricula"));
                return aluno;
            } 
            else if ("professor".equals(tipo)) {
                Professor professor = new Professor();
                professor.setId(rs.getInt("id"));
                professor.setNome(rs.getString("nome"));
                professor.setEmail(rs.getString("email"));
                professor.setSenha(rs.getString("senha"));
                professor.setCpf(rs.getString("cpf"));
                professor.setTelefone(rs.getString("telefone"));
                return professor;
            }
            else if ("usuario".equals(tipo)) {
                Usuarios usuario = new Usuarios();
                usuario.setId(rs.getInt("id"));
                usuario.setUsuario(rs.getString("nome")); // Note que aqui usamos "nome" que é o alias para usuario
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setTipo(rs.getString("tipo_usuario")); // Corrigido para setTipo
                return usuario;
            }
        }
    } catch (SQLException | ClassNotFoundException ex) {
        System.out.println("Erro ao validar acesso: " + ex);
        ex.printStackTrace(); // Adicionado para melhor depuração
    }
    return null;
}
public List<Aluno> consultarAlunosPorCursoId(int cursoId) throws ClassNotFoundException {
    List<Aluno> lista = new ArrayList<>();
    Connection conexao = null;

    try {
        conexao = ConectaDB.conectar();
        String sql = "SELECT " +
                     "alunos.id, " +
                     "alunos.nome, " +
                     "alunos.matricula, " +
                     "alunos.email, " +
                     "alunos.cpf, " +
                     "alunos.telefone, " +
                     "cursos.nome AS nome_curso " +
                     "FROM alunos " +
                     "JOIN cursos ON alunos.curso_id = cursos.id " +
                     "WHERE cursos.id = ?";
                     
        PreparedStatement stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, cursoId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Aluno aluno = new Aluno();
            aluno.setId(rs.getInt("id"));
            aluno.setNome(rs.getString("nome"));
            aluno.setMatricula(rs.getString("matricula"));
            aluno.setEmail(rs.getString("email"));
            aluno.setCpf(rs.getString("cpf"));
            aluno.setTelefone(rs.getString("telefone"));
            //não utilizar pois ele reescreve o atributo nome 
            //aluno.setNome(rs.getString("nome_curso")); // campo adicional vindo do JOIN
            lista.add(aluno);
        }

        return lista;
    } catch (SQLException ex) {
        System.out.println("Erro ao consultar alunos por curso: " + ex);
        return null;
    }
}
public int contarTotalAlunos() {
        int totalAlunos = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Obtém conexão com o banco
            conn = ConectaDB.conectar();
            
            // Prepara a query SQL
            String sql = "SELECT COUNT(*) AS total_alunos FROM alunos";
            pstmt = conn.prepareStatement(sql);
            
            // Executa a query
            rs = pstmt.executeQuery();
            
            // Processa o resultado
            if (rs.next()) {
                totalAlunos = rs.getInt("total_alunos");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro ao contar alunos: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            // Fecha os recursos
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                System.out.println("Erro ao fechar recursos: " + ex.getMessage());
            }
        }
        
        return totalAlunos;
    }
}

