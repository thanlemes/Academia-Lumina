<%@page import="dao.AvaliacaoDAO"%>
<%@page import="model.Avaliacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensagem = "";
    boolean sucesso = false;
    int current_CursoId = 0;

    try {
        // pegando parâmetros do formulário
        int id = request.getParameter("id") != null && !request.getParameter("id").isEmpty()
                    ? Integer.parseInt(request.getParameter("id")) : 0;
        int alunoId = Integer.parseInt(request.getParameter("aluno_id"));
        int cursoId = Integer.parseInt(request.getParameter("curso_id"));
        double nota1 = Double.parseDouble(request.getParameter("nota1"));
        double nota2 = Double.parseDouble(request.getParameter("nota2"));
        double notaFinal = Double.parseDouble(request.getParameter("nota_final"));
        int faltas = Integer.parseInt(request.getParameter("faltas"));
        String status = request.getParameter("status");

        // repassando os dados para avaliação
        Avaliacao avaliacao = new Avaliacao();
        avaliacao.setId(id);
        avaliacao.setAlunoId(alunoId);
        avaliacao.setCursoId(cursoId);
        avaliacao.setNota1(nota1);
        avaliacao.setNota2(nota2);
        avaliacao.setNotaFinal(notaFinal);
        avaliacao.setFaltas(faltas);
        avaliacao.setStatus(status);
        current_CursoId = avaliacao.getCursoId();
        // Chama o DAO
        AvaliacaoDAO dao = new AvaliacaoDAO();
        sucesso = dao.update_avalicao(avaliacao);

        if (sucesso) {
            mensagem = "Avaliação salva com sucesso!";
        } else {
            mensagem = "Erro ao salvar avaliação.";
        }

    } catch (Exception e) {
        mensagem = "Erro ao processar dados: " + e.getMessage();%>
  <pre>
aluno_id: <%= request.getParameter("aluno_id") %>
curso_id: <%= request.getParameter("curso_id") %>
nota1: <%= request.getParameter("nota1") %>
nota2: <%= request.getParameter("nota2") %>
nota_final: <%= request.getParameter("nota_final") %>
faltas: <%= request.getParameter("faltas") %>
status: <%= request.getParameter("status") %>
</pre>
      
<%        
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Atualizar Avaliação</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen p-4">

    <div class="bg-white shadow-lg rounded-2xl p-8 w-full max-w-lg text-center">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Atualizado com sucesso✅</h1>

        <p class="<%= sucesso ? "text-green-600" : "text-red-600" %> text-lg font-medium mb-4">
            <%= mensagem %>
        </p>

        <a href="alunos_por_curso.jsp?id=<%=current_CursoId%>"
           class="inline-block bg-blue-600 text-white px-6 py-2 rounded-xl shadow-md hover:bg-blue-700 transition">
            Voltar
        </a>
    </div>

</body>
</html>
