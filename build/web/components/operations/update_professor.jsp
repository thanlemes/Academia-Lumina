<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="model.Professor"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Atualização de Professor</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">

        <div class="bg-white shadow-2xl rounded-2xl p-10 max-w-xl w-full text-center">
            <h1 class="text-2xl font-bold text-blue-700 mb-4">Atualizado com sucesso✅</h1>

            <%
                Professor prof = new Professor();
                prof.setId(Integer.parseInt(request.getParameter("id")));
                prof.setNome(request.getParameter("nome"));
                prof.setEmail(request.getParameter("email"));
                prof.setSenha(request.getParameter("senha"));
                prof.setTelefone(request.getParameter("telefone"));
                prof.setCpf(request.getParameter("cpf"));

                ProfessorDAO profDAO = new ProfessorDAO();

                boolean atualizado = profDAO.atualizar(prof);
            %>
            <div class="text-lg font-medium text-gray-800">
                <%
                    if (atualizado) {
                        Professor professorAtualizado = profDAO.consultar_por_id(prof);
                        session.setAttribute("professor", professorAtualizado);
                %>
                <p class="text-green-600">Dados atualizados!</p>
                <%
                } else {
                %>
                <p class="text-red-600">Aluno não alterado!</p>
                <%
                    }
                %>
            </div>

            <div class="mt-6">
                <a href="../../views/admin/management/edit_list_geral_professor.jsp" class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
                    Voltar
                </a>
            </div>
        </div>

    </body>
</html>