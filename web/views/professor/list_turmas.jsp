<%@page import="java.util.List"%>
<%@page import="model.Professor"%>
<%@page import="model.Curso"%>
<%@page import="dao.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Professor professor = (Professor) session.getAttribute("professor");

    if (professor == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }

    CursoDAO cursoDAO = new CursoDAO();
    List<Curso> cursos = cursoDAO.consultar_curso_prof_id(professor.getId());
    
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Cursos do Professor</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 min-h-screen p-6">
        <div class="max-w-6xl mx-auto">

            <h1 class="text-3xl font-bold text-center text-blue-700 mb-8">
                Cursos do Professor(a) <%= professor.getNome()%>
            </h1>

            <div class="overflow-x-auto shadow-lg rounded-2xl bg-white p-4">
                <table class="w-full table-auto border-collapse">
                    <thead>
                        <tr class="bg-gray-100 text-left text-sm uppercase text-gray-600">
                            <th class="px-4 py-2">ID</th>
                            <th class="px-4 py-2">Nome</th>
                            <th class="px-4 py-2">Carga Horária</th>
                            <th class="px-4 py-2">Descrição</th>
                            <th class="px-4 py-2">Alunos</th>
                        </tr>
                    </thead>
                    <tbody class="text-gray-700">
                        <%
                            if (cursos.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="5" class="text-center px-4 py-6 text-red-500">Nenhum curso cadastrado.</td>
                        </tr>
                        <%
                        } else {
                            for (Curso curso : cursos) {
                            
                        %>
                        <tr class="hover:bg-gray-50 transition">
                            <td class="px-4 py-3"><%= curso.getId()%></td>
                            <td class="px-4 py-3"><%= curso.getNome()%></td>
                            <td class="px-4 py-3"><%= curso.getCargaHoraria()%>h</td>
                            <td class="px-4 py-3"><%= curso.getDescricao()%></td>
                            <td class="px-4 py-3">
                                <a href="by_pass_alunos_por_curso.jsp?id=<%=curso.getId()%>" class="text-blue-600 hover:underline">
                                    Consultar
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                    <div class="mt-6 text-center">
                        <a href="frame.jsp" class="inline-block px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition">
                            Voltar
                        </a>
                    </div>
            </div>
        </div>

    </body>
</html>
