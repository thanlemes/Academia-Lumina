<%@page import="model.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("../../login.jsp");
        System.out.println(usuario.getUsuario()+" acessou DADOS PESSOAIS");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dados do Usuário</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center p-6">
    <div class="bg-white shadow-2xl rounded-2xl p-10 max-w-md w-full">
        <h1 class="text-2xl font-bold text-blue-700 mb-6 border-b pb-3 text-center">
            Meus Dados
        </h1>

        <div class="space-y-4 text-gray-800">
            <div>
                <label class="font-semibold text-sm text-gray-600">ID do Usuário:</label>
                <p class="text-lg"><%= usuario.getId() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">Nome completo:</label>
                <p class="text-lg"><%= usuario.getUsuario() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">Email:</label>
                <p class="text-lg"><%= usuario.getEmail() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">CPF:</label>
                <p class="text-lg"><%= usuario.getCpf() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">Telefone:</label>
                <p class="text-lg"><%= usuario.getTelefone() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">Tipo de Usuário:</label>
                <p class="text-lg"><%= usuario.getTipo() %></p>
            </div>
            <div>
                <label class="font-semibold text-sm text-gray-600">Criado por:</label>
                <p class="text-lg"><%= usuario.getCreateUser() != null ? usuario.getCreateUser() : "Sistema" %></p>
            </div>
        </div>

        <div class="mt-8 flex justify-center space-x-4">
            <a href="editar_dados.jsp?id=<%= usuario.getId()%>" 
               class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
                Editar Dados
            </a>
               
               <a href="../shared/frame.jsp" 
               class="inline-block bg-gray-600 text-white px-6 py-2 rounded-xl shadow hover:bg-gray-700 transition">
                Voltar ao Painel
            </a>
        </div>
    </div>
</body>
</html>