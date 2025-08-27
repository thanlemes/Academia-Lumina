<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Aluno aluno = (Aluno) session.getAttribute("aluno");

    if (aluno == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dados Pessoais</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center p-6">
    <div class="bg-white shadow-2xl rounded-2xl p-10 max-w-md w-full">
        <h1 class="text-2xl font-bold text-blue-700 mb-6 border-b pb-3 text-center">
            Meus Dados Pessoais
        </h1>

        <div class="space-y-4 text-gray-800">
            <div>
                <label class="font-semibold text-sm text-gray-600">Nome:</label>
                <p class="text-lg"><%= aluno.getNome() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">Matrícula:</label>
                <p class="text-lg"><%= aluno.getMatricula() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">Email:</label>
                <p class="text-lg"><%= aluno.getEmail() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">CPF:</label>
                <p class="text-lg"><%= aluno.getCpf() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">Telefone:</label>
                <p class="text-lg"><%= aluno.getTelefone() %></p>
            </div>

        </div>

        <div class="mt-8 text-center">
            <a href="editar_dados.jsp?=<%= aluno.getId()%>" class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
                Atualizar Dados
            </a>
        </div>
        <div class="mt-8 text-center">
            <a href="../shared/frame.jsp" class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
                Voltar ao Painel
            </a>
        </div>
    </div>
</body>
</html>
