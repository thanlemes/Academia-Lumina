<%@page import="java.util.List"%>
<%@page import="model.Aluno"%>
<%@page import="dao.AlunoDAO"%>
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

    Curso curso = (Curso) session.getAttribute("curso");
    int cursoId = 0;
    List<Aluno> alunos = null;

    if (curso.getId() != 0) {
        try {
            
            AlunoDAO alunoDAO = new AlunoDAO();
            alunos = alunoDAO.consultarAlunosPorCursoId(curso.getId());
        } catch (Exception e) {
%>
            <p class="text-red-600 text-center mt-10">Erro ao carregar alunos: <%= e.getMessage() %></p>
<%
        }
    } else {
%>
        <p class="text-red-600 text-center mt-10">ID do curso não fornecido.</p>
<%
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Alunos do Curso</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6 min-h-screen">

    <div class="max-w-6xl mx-auto bg-white shadow-xl rounded-2xl p-8">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-3xl font-bold text-center text-blue-700">Alunos do Curso <%=curso.getNome()%> </h1>
            <a href="list_turmas.jsp" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
                Voltar
            </a>
        </div>

        <%
            if (alunos != null && !alunos.isEmpty()) {
        %>
        <div class="overflow-x-auto">
            <table class="min-w-full table-auto border-collapse border border-gray-300">
                <thead>
                    <tr class="bg-blue-100">
                        <th class="border px-4 py-2 text-left">ID</th>
                        <th class="border px-4 py-2 text-left">Nome</th>
                        <th class="border px-4 py-2 text-left">Matrícula</th>
                        <th class="border px-4 py-2 text-left">Email</th>
                        <th class="border px-4 py-2 text-left">CPF</th>
                        <th class="border px-4 py-2 text-left">Telefone</th>
                        <th class="border px-4 py-2 text-left">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Aluno aluno : alunos) {
                    %>
                    <tr class="hover:bg-gray-100">
                        <td class="border px-4 py-2"><%= aluno.getId() %></td>
                        <td class="border px-4 py-2"><%= aluno.getNome() %></td>
                        <td class="border px-4 py-2"><%= aluno.getMatricula() %></td>
                        <td class="border px-4 py-2"><%= aluno.getEmail() %></td>
                        <td class="border px-4 py-2"><%= aluno.getCpf() %></td>
                        <td class="border px-4 py-2"><%= aluno.getTelefone() %></td>
                        <td class="border px-4 py-2">
                            <a href="editar_avaliacao.jsp?id=<%= aluno.getId() %>&id_curso=<%=curso.getId()%>" class="text-blue-600 hover:underline">Avaliação</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <%
            } else {
        %>
        <p class="text-center text-gray-600 mt-6">Nenhum aluno encontrado para este curso.</p>
        <%
            }
        %>
    </div>

</body>
</html>
