<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%
    Aluno aluno = (Aluno) session.getAttribute("aluno");
    System.out.println(aluno.getCreateUser());
    if (aluno == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Controle de Alunos</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
          integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-blue-100 min-h-screen flex items-center justify-center p-6">
    <div class="bg-white rounded-2xl shadow-lg w-full max-w-3xl p-10 space-y-6">
        <h1 class="text-3xl font-bold text-blue-800 border-b border-blue-300 pb-4">Atualizar Dados Pessoais</h1>

        <%
            AlunoDAO aluDAO = new AlunoDAO();
            if (aluDAO.consultar_por_id(aluno) != null) {
        %>
        <form method="post" action="../../components/operations/atualizar_dados_aluno.jsp" class="grid grid-cols-1 md:grid-cols-2 gap-6">

            <div>
                <label class="block text-sm font-semibold text-blue-800">Código</label>
                <input type="text" name="id" value="<%= aluno.getId()%>" readonly
                       class="mt-1 w-full border border-blue-300 bg-gray-100 rounded-lg p-3 text-gray-600" />
            </div>

            <div>
                <label class="block text-sm font-semibold text-blue-800">Nome Completo</label>
                <input type="text" name="nome" value="<%= aluno.getNome()%>" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500" />
            </div>

            <div>
                <label class="block text-sm font-semibold text-blue-800">Email</label>
                <input type="text" name="email" value="<%= aluno.getEmail()%>" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500" />
            </div>

            <!-- Campo de senha com ícone -->
            <div class="relative">
                <label class="block text-sm font-semibold text-blue-800">Senha</label>
                <input type="password" id="senha" name="senha" value="<%= aluno.getSenha()%>" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 pr-10 focus:ring-2 focus:ring-blue-500" />
                <button type="button" onclick="toggleSenha()" class="absolute right-3 top-9 text-gray-500 hover:text-gray-700">
                    <i id="icone-olho" class="fa-solid fa-eye"></i>
                </button>
            </div>

            <div>
                <label class="block text-sm font-semibold text-blue-800">Telefone</label>
                <input type="text" name="telefone" value="<%= aluno.getTelefone()%>" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500" />
            </div>

            <div>
                <label class="block text-sm font-semibold text-blue-800">CPF</label>
                <input type="text" name="cpf" value="<%= aluno.getCpf()%>" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500" />
            </div>

            <input type="hidden" name="matricula" value="<%= aluno.getMatricula()%>" />
            <input type="hidden" name="curso_id" value="<%= aluno.getCursoId()%>" />

            <div class="md:col-span-2 flex justify-end gap-4 mt-4">
                <button type="submit"
                        class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition">
                    Salvar Alteração
                </button>
                <a href="dados_pessoais.jsp"
                   class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition text-center">
                    Voltar
                </a>
                <button type="reset"
                        class="bg-gray-300 text-gray-800 px-6 py-2 rounded-lg hover:bg-gray-400 transition">
                    Limpar
                </button>
            </div>
        </form>

        <p class="text-green-600 font-medium mt-6">Aluno localizado com sucesso!</p>
        <%
            } else {
        %>
        <p class="text-red-600 font-semibold mt-4">Aluno não localizado!</p>
        <%
            }
        %>
    </div>

    <!-- Script para alternar exibição da senha -->
    <script>
        function toggleSenha() {
            const senhaInput = document.getElementById("senha");
            const olhoIcone = document.getElementById("icone-olho");
            const isPassword = senhaInput.type === "password";
            senhaInput.type = isPassword ? "text" : "password";
            olhoIcone.className = isPassword ? "fa-solid fa-eye-slash" : "fa-solid fa-eye";
        }
    </script>
</body>
</html>
