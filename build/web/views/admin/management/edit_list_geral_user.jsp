<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UsuariosDAO"%>
<%@page import="model.Usuarios"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Controle de Usuários</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body class="bg-gray-100 min-h-screen flex flex-col">



        <!-- Conteúdo -->
        <main class="flex-grow container mx-auto px-4 py-10 max-w-7xl">
            <%
                UsuariosDAO userDAO = new UsuariosDAO();
                List<Usuarios> lista = userDAO.consultar_lista_simples();
            %>

            <!-- Título -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden mb-6">
                <div class="bg-indigo-600 px-6 py-4 text-white">
                    <h2 class="text-2xl font-bold">Lista Geral de Usuários</h2>
                </div>
            </div>

            <!-- Tabela -->
            <div class="bg-white rounded-xl shadow-md p-6">
                <h5 class="text-indigo-700 font-medium mb-4">Todos os usuários cadastrados:</h5>

                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-indigo-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">#</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Código</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Nome</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Email</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">CPF</th>
                                <th colspan="3" class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Ações</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-100">
                            <%
                                for (int i = 0; i < lista.size(); i++) {
                                    Usuarios u = lista.get(i);
                            %>
                            <tr class="hover:bg-indigo-50 transition duration-150">
                                <td class="px-6 py-4 text-sm text-gray-700"><%= i + 1%></td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= u.getId()%></td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= u.getUsuario()%></td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= u.getEmail()%></td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= u.getCpf()%></td>
                                <td class="px-6 py-4 text-sm text-center">
                                    <a href="../../../components/buttons/btn_edit_user.jsp?id=<%= u.getId()%>" title="Editar"
                                       class="text-indigo-600 hover:text-indigo-800">
                                        <i class="fas fa-pen-to-square"></i>
                                    </a>
                                </td>
                                <td class="px-6 py-4 text-sm text-center">
                                    <a href="../../../components/buttons/btn_cons_user.jsp?id=<%= u.getId()%>" title="Consultar"
                                       class="text-indigo-600 hover:text-indigo-800">
                                        <i class="fas fa-magnifying-glass"></i>
                                    </a>
                                </td>
                                <td class="px-6 py-4 text-sm text-center">
                                    <a href="../../../components/buttons/btn_dell_user.jsp?id=<%= u.getId()%>" title="Excluir"
                                       class="text-red-600 hover:text-red-800"
                                       onclick="return confirm('Deseja realmente excluir este usuário?');">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="mt-6">
                <a href="../painel_administrativo.jsp"
                   class="inline-block bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 px-4 rounded-xl shadow transition duration-200">
                    ← Voltar ao Painel Administrativo
                </a>
            </div>

        </main>

    </body>
</html>
