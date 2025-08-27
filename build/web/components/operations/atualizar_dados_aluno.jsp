<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Controle de Alunos - Atualização</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen p-4">

        <div class="bg-white shadow-2xl rounded-2xl p-10 max-w-xl w-full text-center">
            <h1 class="text-2xl font-bold text-blue-700 mb-6">Atualizado com sucesso✅</h1>

            <%
                Aluno alu = new Aluno();
                alu.setId(Integer.parseInt(request.getParameter("id")));
                alu.setNome(request.getParameter("nome"));
                alu.setEmail(request.getParameter("email"));
                alu.setSenha(request.getParameter("senha"));
                alu.setTelefone(request.getParameter("telefone"));
                alu.setCpf(request.getParameter("cpf"));
                alu.setMatricula(request.getParameter("matricula"));
                alu.setCursoId(Integer.parseInt(request.getParameter("curso_id")));

                AlunoDAO alunoDAO = new AlunoDAO();
                boolean atualizado = alunoDAO.atualizar(alu);
            %>

            <div class="text-lg font-medium text-gray-800">
                <%
                    if (atualizado) {
                        Aluno alunoAtualizado = alunoDAO.consultar_por_id(alu);
                        session.setAttribute("aluno", alunoAtualizado);
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
                <a href="../../views/aluno/dados_pessoais.jsp" class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow hover:bg-blue-700 transition">
                    Voltar
                </a>
            </div>
        </div>

    </body>
</html>
