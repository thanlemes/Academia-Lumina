<%@page import="model.Aluno"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="model.Avaliacao"%>
<%@page import="dao.AvaliacaoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    // Recupera o objeto Aluno da sessão
    Aluno aluno = (Aluno) session.getAttribute("aluno");
    if (aluno == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Meus Cursos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen p-6">
    <div class="max-w-6xl mx-auto bg-white shadow-xl rounded-2xl p-10">
        <h1 class="text-3xl font-bold text-blue-800 mb-6 border-b pb-4">
            Meus Cursos - <span class="text-gray-600 text-xl"><%= aluno.getNome() %></span>
        </h1>

        <%
            AvaliacaoDAO avao = new AvaliacaoDAO();
            List<Avaliacao> lista = avao.avaliacao_por_aluno_id(aluno.getId());

            dao.CursoDAO cursoDAO = new dao.CursoDAO();
        %>

        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 text-sm text-gray-700">
                <thead class="bg-blue-100 text-blue-900 font-semibold">
                    <tr>
                        <th class="px-4 py-3 text-left">Curso</th>
                        <th class="px-4 py-3 text-center">Nota 1</th>
                        <th class="px-4 py-3 text-center">Nota 2</th>
                        <th class="px-4 py-3 text-center">Nota Final</th>
                        <th class="px-4 py-3 text-center">Faltas</th>
                        <th class="px-4 py-3 text-center">Status</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-100">
                <%
                    if (lista != null && !lista.isEmpty()) {
                        for (Avaliacao a : lista) {
                            String nomeCurso = cursoDAO.getNomeCursoPorId(a.getCursoId());
                %>
                    <tr>
                        <td class="px-4 py-3"><%= nomeCurso %></td>
                        <td class="px-4 py-3 text-center"><%= a.getNota1() %></td>
                        <td class="px-4 py-3 text-center"><%= a.getNota2() %></td>
                        <td class="px-4 py-3 text-center font-bold text-blue-800"><%= a.getNotaFinal() %></td>
                        <td class="px-4 py-3 text-center"><%= a.getFaltas() %></td>
                        <td class="px-4 py-3 text-center">
                            <span class="<%= a.getStatus().equalsIgnoreCase("Aprovado") ? "text-green-700 font-semibold" : "text-red-600 font-semibold" %>">
                                <%= a.getStatus() %>
                            </span>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center px-4 py-6 text-gray-500">Nenhuma avaliação encontrada.</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <div class="mt-8 text-center">
            <a href="../shared/frame.jsp" class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
                Voltar ao Painel
            </a>
        </div>
    </div>
</body>
</html>
