<%@page import="model.Usuarios" %>
<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <title>Cadastro de Usuário</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-blue-100 min-h-screen flex items-center justify-center p-6">
    <div class="bg-white rounded-2xl shadow-lg w-full max-w-2xl p-10 space-y-6">
        <div class="border-b border-blue-200 pb-4 mb-6">
            <h2 class="text-3xl font-bold text-blue-800 flex items-center">
                <i class="fas fa-user-plus mr-3"></i>
                Cadastro de Usuário
            </h2>
            <p class="text-sm text-blue-600">Preencha os dados abaixo para cadastrar um novo usuário.</p>
        </div>

        <form action="../operations/inserir_user.jsp" method="post" class="grid grid-cols-1 md:grid-cols-2 gap-6">

            <div>
                <label for="usuario" class="block text-sm font-semibold text-blue-800">Usuário</label>
                <input type="text" id="usuario" name="usuario" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none" />
            </div>

            <div>
                <label for="email" class="block text-sm font-semibold text-blue-800">Email</label>
                <input type="email" id="email" name="email" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none" />
            </div>

            <div>
                <label for="senha" class="block text-sm font-semibold text-blue-800">Senha</label>
                <input type="password" id="senha" name="senha" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none" />
            </div>

            <div>
                <label for="cpf" class="block text-sm font-semibold text-blue-800">CPF</label>
                <input type="text" id="cpf" name="cpf" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none" />
            </div>

            <div>
                <label for="telefone" class="block text-sm font-semibold text-blue-800">Telefone</label>
                <input type="text" id="telefone" name="telefone" required
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none" />
            </div>

            <div>
                <label for="tipo" class="block text-sm font-semibold text-blue-800">Tipo</label>
                <input type="text" id="tipo" name="tipo" value="admin" readonly
                       class="mt-1 w-full border border-blue-300 rounded-lg bg-gray-100 p-3 focus:outline-none" />
            </div>

            <!-- Usuário criador -->
            <input type="hidden" id="createUser" name="createUser" value="<%=usuario.getEmail()%>" />

            <div class="md:col-span-2 flex justify-end space-x-4">
                <button type="submit"
                        class="bg-blue-600 text-white font-medium px-6 py-3 rounded-lg hover:bg-blue-700 transition duration-200 flex items-center">
                    <i class="fas fa-paper-plane mr-2"></i> Cadastrar Usuário
                </button>

                <a href="../../views/admin/painel_administrativo.jsp"
                   class="bg-gray-300 text-blue-800 font-medium px-6 py-3 rounded-lg hover:bg-gray-400 transition duration-200 flex items-center">
                    <i class="fas fa-arrow-left mr-2"></i> Voltar
                </a>
            </div>
        </form>
    </div>
</body>
</html>
