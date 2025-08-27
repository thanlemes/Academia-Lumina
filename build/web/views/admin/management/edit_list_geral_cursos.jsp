<%@page import="java.util.List"%>
<%@page import="model.Curso"%>
<%@page import="dao.CursoDAO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Controle de Cursos</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body class="bg-gray-100 min-h-screen flex flex-col">

        <main class="flex-grow container mx-auto px-4 py-8 max-w-7xl">
            <%
                CursoDAO cursoDAO = new CursoDAO();
                List<Curso> cursos = cursoDAO.consultar_curso();
            %>

            <!-- Título -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden mb-6">
                <div class="bg-indigo-600 px-6 py-4 text-white">
                    <h2 class="text-2xl font-bold">Lista Geral de Cursos</h2>
                </div>
            </div>

            <!-- Tabela -->
            <div class="bg-white rounded-xl shadow-md p-6">
                <h5 class="text-indigo-700 font-medium mb-4">Todos os cursos cadastrados:</h5>

                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-indigo-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">#</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Nome</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Descrição</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Carga Horária</th>
                                <th class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Professor ID</th>
                                <th colspan="3" class="px-6 py-3 text-left text-xs font-semibold text-indigo-800 uppercase tracking-wider">Ações</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-100">
                            <%
                                for (int i = 0; i < cursos.size(); i++) {
                                    Curso curso = cursos.get(i);
                            %>
                            <tr class="hover:bg-indigo-50 transition duration-150">
                                <td class="px-6 py-4 text-sm text-gray-700"><%= i + 1 %></td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= curso.getId() %></td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= curso.getNome() %></td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= curso.getDescricao()%></td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= curso.getCargaHoraria() %>h</td>
                                <td class="px-6 py-4 text-sm text-gray-700"><%= curso.getProfessorId() %></td>
                                <td class="px-6 py-4 text-sm">
                                    <a href="../../../components/buttons/btn_edit_curso.jsp?id=<%= curso.getId() %>" class="text-indigo-600 hover:text-indigo-800 mr-3" title="Editar">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                </td>
                                <td class="px-6 py-4 text-sm">
                                    <a href="../../../components/buttons/btn_cons_curso.jsp?id=<%= curso.getId() %>" class="text-indigo-600 hover:text-indigo-800 mr-3" title="Consultar">
                                        <i class="fas fa-search"></i>
                                    </a>
                                </td>
                                <td class="px-6 py-4 text-sm">
                                    <a href="../../../components/buttons/btn_dell_curso.jsp?id=<%= curso.getId() %>" class="text-red-600 hover:text-red-800" title="Excluir" onclick="return confirm('Deseja realmente excluir este curso?');">
                                        <i class="fas fa-trash-alt"></i>
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
