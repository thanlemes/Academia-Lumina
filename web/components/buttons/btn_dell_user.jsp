<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UsuariosDAO"%>
<%@page import="model.Usuarios"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Controle de Usuários - Exclusão</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-blue-100 flex items-center justify-center min-h-screen p-6">
    <div class="bg-white rounded-2xl shadow-lg w-full max-w-xl p-10 text-center space-y-6">
        <h1 class="text-3xl font-bold text-blue-800 border-b border-blue-300 pb-4">
            Exclusão de Usuário
        </h1>

        <%
            Usuarios user = new Usuarios();
            user.setId(Integer.parseInt(request.getParameter("id")));

            UsuariosDAO aluDAO = new UsuariosDAO();

            if (aluDAO.deletar(user)) {
        %>
            <p class="text-green-700 font-semibold text-lg">
                ✅ Usuário excluído com sucesso!
            </p>
        <%
            } else {
        %>
            <p class="text-red-700 font-semibold text-lg">
                ❌ Usuário não localizado ou não pôde ser excluído!
            </p>
        <%
            }
        %>

        <a href="../../views/admin/management/edit_list_geral_user.jsp"
           class="inline-block mt-4 bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
            Voltar para a lista de usuários
        </a>
    </div>
</body>
</html>
