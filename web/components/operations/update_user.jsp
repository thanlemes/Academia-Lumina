<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UsuariosDAO"%>
<%@page import="model.Usuarios"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Controle de Usuários</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen p-4">

        <div class="bg-white shadow-2xl rounded-2xl p-10 max-w-xl w-full text-center">
            <h1 class="text-2xl font-bold text-blue-700 mb-6">Atualizado com sucesso✅</h1>

            <%
                Usuarios user = new Usuarios();
                user.setId(Integer.parseInt(request.getParameter("id")));
                user.setUsuario(request.getParameter("nome"));
                user.setEmail(request.getParameter("email"));
                user.setSenha(request.getParameter("senha"));
                user.setTelefone(request.getParameter("telefone"));
                user.setCpf(request.getParameter("cpf"));
                user.setTipo(request.getParameter("tipo"));

                UsuariosDAO usuariosDAO = new UsuariosDAO();
                boolean atualizado = usuariosDAO.atualizar(user);
            %>

            <div class="text-lg font-medium text-gray-800">
                <%
                    if (atualizado) {
                %>
                <p class="text-green-600">Dados atualizados!</p>
                <%
                } else {
                %>
                <p class="text-red-600">Usuário não alterado!</p>
                <%
                    }
                %>
            </div>

            <div class="mt-6">
                <a href="../../views/admin/management/edit_list_geral_user.jsp" class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
                    Voltar
                </a>
            </div>
        </div>

    </body>
</html>
