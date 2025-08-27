<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Controle de Alunos - Exclusão</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-blue-50 flex items-center justify-center min-h-screen p-6">
    <div class="bg-white rounded-2xl shadow-xl w-full max-w-xl p-10 text-center space-y-6">
        <h1 class="text-3xl font-bold text-blue-800 border-b border-blue-300 pb-4">
            Exclusão de Aluno
        </h1>

        <%
            Aluno alu = new Aluno();
            alu.setId(Integer.parseInt(request.getParameter("id")));

            AlunoDAO aluDAO = new AlunoDAO();

            if (aluDAO.deletar(alu)) {
        %>
            <p class="text-green-700 text-lg font-semibold">
                ✅ Aluno excluído com sucesso!
            </p>
        <%
            } else {
        %>
            <p class="text-red-700 text-lg font-semibold">
                ❌ Aluno não localizado ou não pôde ser excluído!
            </p>
        <%
            }
        %>

        <a href="../../views/admin/management/edit_list_geral_alunos.jsp"
           class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
            Voltar para a lista de alunos
        </a>
    </div>
</body>
</html>
