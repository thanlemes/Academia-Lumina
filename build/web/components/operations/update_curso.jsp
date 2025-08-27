<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.CursoDAO"%>
<%@page import="model.Curso"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Atualização de Curso</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">

        <div class="bg-white shadow-2xl rounded-2xl p-10 max-w-xl w-full text-center">
            <h1 class="text-2xl font-bold text-blue-700 mb-4">Atualizado com sucesso ✅</h1>

            <%
                Curso curso = new Curso();
                curso.setId(Integer.parseInt(request.getParameter("id")));
                curso.setNome(request.getParameter("nome"));
                curso.setCargaHoraria(Integer.parseInt(request.getParameter("cargaHoraria")));
                curso.setDescricao(request.getParameter("descricao"));
                curso.setCreateUser(request.getParameter("createUser"));
                curso.setProfessorId(Integer.parseInt(request.getParameter("professorId")));

                CursoDAO cursoDAO = new CursoDAO();

                boolean atualizado = cursoDAO.atualizar(curso); // Assumindo que você tenha o método atualizar
            %>

            <div class="text-lg font-medium text-gray-800">
                <%
                    if (atualizado) {
                        Curso cursoAtualizado = cursoDAO.consultar_por_id(curso.getId());
                        session.setAttribute("curso", cursoAtualizado);
                %>
                <p class="text-green-600">Curso atualizado com sucesso!</p>
                <%
                } else {
                %>
                <p class="text-red-600">Curso não foi atualizado.</p>
                <%
                    }
                %>
            </div>

            <div class="mt-6">
                <a href="../../views/admin/management/edit_list_geral_cursos.jsp" class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
                    Voltar
                </a>
            </div>
        </div>

    </body>
</html>
