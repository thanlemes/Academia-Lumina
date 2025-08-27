<%@page import="model.Aluno"%>
<%@page import="model.Professor"%>
<%@page import="model.Usuarios"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="java.security.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // 1. Recebe os dados do formulário
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    // Criptografa a senha com MD5
    MessageDigest md5 = MessageDigest.getInstance("MD5");
    md5.update(senha.getBytes());
    byte[] digest = md5.digest();

    // Converte o digest em hexadecimal
    StringBuilder senhaCriptografada = new StringBuilder();
    for (byte b : digest) {
        senhaCriptografada.append(String.format("%02x", b & 0xff));
    }

    String senhaFinal = senhaCriptografada.toString();

    System.out.println("Email: " + email);
    System.out.println("Senha criptografada (MD5): " + senhaFinal);

    // 2. Valida o acesso via DAO com a senha criptografada
    AlunoDAO dao = new AlunoDAO();
    Object usuarioAutenticado = dao.validarAcesso(email, senhaFinal);

    if (usuarioAutenticado != null) {
        // Verifica o tipo de usuário
        if (usuarioAutenticado instanceof Aluno) {
            session.setAttribute("aluno", (Aluno)usuarioAutenticado);
            response.sendRedirect("views/aluno/acesso_aluno.jsp");
        } 
        else if (usuarioAutenticado instanceof Professor) {
            session.setAttribute("professor", (Professor)usuarioAutenticado);
            response.sendRedirect("views/professor/acesso_professor.jsp");
        }
        else if (usuarioAutenticado instanceof Usuarios) {
            session.setAttribute("usuario", (Usuarios)usuarioAutenticado);
            response.sendRedirect("views/admin/acesso_admin.jsp");
        }
    } else {
%>
        <script>
            alert("Usuário ou senha inválidos.");
            location.href = "login.jsp";
        </script>
<%
    }
%>
