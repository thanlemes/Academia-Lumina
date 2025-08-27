<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Aluno" %>
<%@ page import="dao.AlunoDAO" %>
<%
    String nome = request.getParameter("nome");
    String matricula = request.getParameter("matricula");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String createUser = request.getParameter("createUser");
    String cpf = request.getParameter("cpf");
    String telefone = request.getParameter("telefone");
    int cursoId = Integer.parseInt(request.getParameter("cursoId"));

    Aluno aluno = new Aluno();
    aluno.setNome(nome);
    aluno.setMatricula(matricula);
    aluno.setEmail(email);
    aluno.setSenha(senha);
    aluno.setCreateUser(createUser);
    aluno.setCpf(cpf);
    aluno.setTelefone(telefone);
    aluno.setCursoId(cursoId);

    AlunoDAO dao = new AlunoDAO();
    boolean sucesso = dao.inserir_aluno(aluno);
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Resultado do Cadastro</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-blue-50 min-h-screen flex items-center justify-center">

    <div class="bg-white rounded-xl shadow-xl p-8 w-full max-w-md text-center">
        <div class="mb-6">
            <% if (sucesso) { %>
                <i class="fas fa-circle-check text-green-500 text-5xl mb-4"></i>
                <h2 class="text-2xl font-bold text-green-700 mb-2">Aluno cadastrado com sucesso!</h2>
                <p class="text-gray-600">O registro foi inserido na base de dados.</p>
            <% } else { %>
                <i class="fas fa-circle-xmark text-red-500 text-5xl mb-4"></i>
                <h2 class="text-2xl font-bold text-red-700 mb-2">Falha no cadastro</h2>
                <p class="text-gray-600">Ocorreu um erro ao tentar cadastrar o aluno.</p>
            <% } %>
        </div>

        <a href="../forms/form_insert_aluno.jsp" class="inline-flex items-center px-5 py-2.5 bg-indigo-600 text-white font-medium text-sm rounded-lg hover:bg-indigo-700 transition">
            <i class="fas fa-arrow-left mr-2"></i> Voltar ao cadastro
        </a>
    </div>

</body>
</html>
