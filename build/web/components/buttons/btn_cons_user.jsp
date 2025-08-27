<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UsuariosDAO"%>
<%@page import="model.Usuarios"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Consulta de Usuários</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-blue-100 min-h-screen flex items-center justify-center p-6">
        <div class="bg-white rounded-2xl shadow-lg w-full max-w-3xl p-10 space-y-6">
            <h1 class="text-3xl font-bold text-blue-800 border-b border-blue-300 pb-4">Consulta de Usuário</h1>

            <%
                Usuarios user = new Usuarios();
                user.setId(Integer.parseInt(request.getParameter("id")));

                UsuariosDAO alunoDAO = new UsuariosDAO();

                if (alunoDAO.consultar_por_id(user) != null) {
            %>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-semibold text-blue-800">Código</label>
                    <input type="text" value="<%= user.getId()%>" readonly
                           class="mt-1 w-full border border-blue-300 bg-gray-100 rounded-lg p-3 text-gray-600" />
                </div>

                <div>
                    <label class="block text-sm font-semibold text-blue-800">Nome Completo</label>
                    <input type="text" value="<%= user.getUsuario()%>" readonly
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3" />
                </div>

                <div>
                    <label class="block text-sm font-semibold text-blue-800">Email</label>
                    <input type="text" value="<%= user.getEmail()%>" readonly
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3" />
                </div>

                <div>
                    <label class="block text-sm font-semibold text-blue-800">Senha</label>
                    <input type="password" value="<%= user.getSenha()%>" readonly
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3" />
                </div>

                <div>
                    <label class="block text-sm font-semibold text-blue-800">Telefone</label>
                    <input type="text" value="<%= user.getTelefone()%>" readonly
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3" />
                </div>

                <div>
                    <label class="block text-sm font-semibold text-blue-800">CPF</label>
                    <input type="text" value="<%= user.getCpf()%>" readonly
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3" />
                </div>
                <div class="md:col-span-2 flex justify-end gap-4 mt-4">
                    <button type="button"
                            class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition">

                        <a href="../../views/admin/management/edit_list_geral_user.jsp">Voltar</a>
                    </button>
                </div>
            </div>

            <p class="text-green-600 font-medium mt-6">Usuário localizado com sucesso!</p>

            <%
            } else {
            %>
            <p class="text-red-600 font-semibold mt-4">Usuário não localizado!</p>
            <%
                }
            %>
        </div>
    </body>
</html>
