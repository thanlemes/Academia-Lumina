<%@page import="dao.AvaliacaoDAO"%>
<%@page import="model.Avaliacao"%>
<%@page import="model.Professor"%>
<%@page import="model.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Professor professor = (Professor) session.getAttribute("professor");

    if (professor == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
    Curso curso = (Curso) session.getAttribute("curso");

    String alunoIdParam = request.getParameter("id");
    String cursoIdParam = request.getParameter("id_curso");
    System.out.println(alunoIdParam + " arquivo editar avaliacao" + cursoIdParam);
    Avaliacao avaliacao = null;

    if (alunoIdParam != null && !alunoIdParam.isEmpty()) {
        try {
            int alunoId = Integer.parseInt(alunoIdParam);
            AvaliacaoDAO avadao = new AvaliacaoDAO();
            avaliacao = avadao.buscar_ava_aluno(alunoId, curso.getId());

            if (avaliacao == null) {
                avaliacao = new Avaliacao();
                avaliacao.setAlunoId(alunoId);
            }
        } catch (Exception e) {
%>
<p class="text-red-600 text-center mt-6">Erro ao carregar avaliação: <%= e.getMessage()%></p>
<%
    }
} else {
%>
<p class="text-red-600 text-center mt-6">Parâmetro 'id' do aluno não informado.</p>
<%
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Avaliação do Aluno</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-6 min-h-screen">

        <div class="max-w-xl mx-auto bg-white rounded-2xl shadow-lg p-8">
            <h1 class="text-2xl font-bold text-center text-blue-700 mb-6">
                <%= avaliacao != null && avaliacao.getId() != 0 ? "Editar Avaliação" : "Criar Avaliação"%>
            </h1>

            <form action="update_avalicao.jsp" method="POST" class="space-y-5">
                <input type="hidden" name="curso_id" value="<%= curso != null ? curso.getId() : ""%>">
                <input type="hidden" name="aluno_id" value="<%= avaliacao != null ? avaliacao.getAlunoId() : ""%>">
                <input type="hidden" name="id" value="<%= avaliacao != null && avaliacao.getId() != 0 ? avaliacao.getId() : "" %>">


                <div>
                    <label for="curso_id" class="block font-medium text-gray-700">Aluno ID</label>
                    <input type="number" id="curso_id" name="curso_id" readonly
                           value="<%= avaliacao != null && avaliacao.getAlunoId()!= 0 ? avaliacao.getAlunoId(): ""%>"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 px-4 py-2" />
                </div>

                <div>
                    <label for="nota1" class="block font-medium text-gray-700">Nota 1:</label>
                    <input type="number" step="0.01" id="nota1" name="nota1"
                           value="<%= avaliacao != null ? avaliacao.getNota1() : ""%>"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 px-4 py-2" />
                </div>

                <div>
                    <label for="nota2" class="block font-medium text-gray-700">Nota 2:</label>
                    <input type="number" step="0.01" id="nota2" name="nota2"
                           value="<%= avaliacao != null ? avaliacao.getNota2() : ""%>"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 px-4 py-2" />
                </div>

                <div>
                    <label for="nota_final" class="block font-medium text-gray-700">Nota Final:</label>
                    <input type="number" step="0.01" id="nota_final" name="nota_final"
                           value="<%= avaliacao != null ? avaliacao.getNotaFinal() : ""%>"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 px-4 py-2" />
                </div>

                <div>
                    <label for="faltas" class="block font-medium text-gray-700">Faltas:</label>
                    <input type="number" id="faltas" name="faltas"
                           value="<%= avaliacao != null ? avaliacao.getFaltas() : ""%>"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 px-4 py-2" />
                </div>

                <div>
                    <label for="status" class="block font-medium text-gray-700">Status:</label>
                    <select id="status" name="status"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 px-4 py-2">
                        <option value="">Selecione...</option>
                        <option value="Aprovado" <%= "Aprovado".equals(avaliacao.getStatus()) ? "selected" : ""%>>Aprovado</option>
                        <option value="Reprovado" <%= "Reprovado".equals(avaliacao.getStatus()) ? "selected" : ""%>>Reprovado</option>
                        <option value="Em andamento" <%= "Em andamento".equals(avaliacao.getStatus()) ? "selected" : ""%>>Em andamento</option>
                    </select>
                </div>
                <div class="text-center">
                    <button type="submit"
                            class="bg-blue-600 text-white font-semibold px-6 py-2 rounded-xl hover:bg-blue-700 transition">
                        Salvar Avaliação
                    </button>
                    <button type="button"
                            class="bg-blue-600 text-white font-semibold px-6 py-2 rounded-xl hover:bg-blue-700 transition">

                        <a href="alunos_por_curso.jsp">Voltar</a>
                    </button>
                </div>
            </form>
        </div>

    </body>
</html>
