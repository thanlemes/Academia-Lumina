<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Usuarios" %>
<%@ page import="dao.UsuariosDAO" %>
<%
    String usuario = request.getParameter("usuario");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String cpf = request.getParameter("cpf");
    String telefone = request.getParameter("telefone");
    String tipo = request.getParameter("tipo");
    String createUser = request.getParameter("createUser");

    Usuarios u = new Usuarios();
    u.setUsuario(usuario);
    u.setEmail(email);
    u.setSenha(senha);
    u.setCpf(cpf);
    u.setTelefone(telefone);
    u.setTipo(tipo);
    u.setCreateUser(createUser);

    UsuariosDAO dao = new UsuariosDAO();
    boolean sucesso = dao.inserir_usuario(u);
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Resultado do Cadastro</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-blue-50 min-h-screen flex items-center justify-center">

    <div class="bg-white rounded-xl shadow-xl p-8 w-full max-w-md text-center">
        <div class="mb-6">
            <% if (sucesso) { %>
                <i class="fas fa-circle-check text-green-500 text-5xl mb-4"></i>
                <h2 class="text-2xl font-bold text-green-700 mb-2">Usuário cadastrado com sucesso!</h2>
                <p class="text-gray-600">O registro foi inserido na base de dados.</p>
            <% } else { %>
                <i class="fas fa-circle-xmark text-red-500 text-5xl mb-4"></i>
                <h2 class="text-2xl font-bold text-red-700 mb-2">Falha no cadastro</h2>
                <p class="text-gray-600">Ocorreu um erro ao tentar cadastrar o usuário.</p>
            <% } %>
        </div>

        <a href="../forms/form_insert_user.jsp" class="inline-flex items-center px-5 py-2.5 bg-indigo-600 text-white font-medium text-sm rounded-lg hover:bg-indigo-700 transition">
            <i class="fas fa-arrow-left mr-2"></i> Voltar ao cadastro
        </a>
    </div>

</body>
</html>
