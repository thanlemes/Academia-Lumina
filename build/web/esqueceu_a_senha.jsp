<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Redefinir Senha</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

    <!-- Navbar -->
    <!-- Navbar -->
<header class="bg-white shadow">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center"> <!-- Já estava correto -->
        <div class="flex items-center">
            <i class="fas fa-graduation-cap text-3xl text-indigo-600 mr-2"></i>
            <h1 class="text-2xl font-bold text-indigo-800">Academia <span class="text-indigo-500">Lumina</span></h1>
        </div>
        <nav class="hidden md:flex space-x-6">
            <a href="index.jsp" class="text-gray-700 hover:text-indigo-600 font-medium">Sobre</a>
            <a href="index.jsp" class="text-gray-700 hover:text-indigo-600 font-medium">Cursos</a>
            <a href="index.jsp" class="text-gray-700 hover:text-indigo-600 font-medium">Eventos</a>
            <a href="index.jsp" class="text-gray-700 hover:text-indigo-600 font-medium">Contato</a>
            <a href="login.jsp" class="text-gray-700 hover:text-indigo-600 font-medium">Login</a>
        </nav>
    </div>
</header>

    <!-- Conteúdo da página -->
    <main class="flex-grow flex items-center justify-center px-4">
        <div class="bg-white shadow-2xl rounded-xl p-8 w-full max-w-md">
            <h2 class="text-center text-2xl font-bold text-indigo-700 mb-4">Redefinir Senha</h2>
            <p class="text-center text-gray-600 mb-6 text-sm">Digite seu e-mail para receber o link de redefinição</p>

            <%-- Mensagens de erro ou sucesso --%>
            <%
                String message = (String) request.getAttribute("message");
                String messageType = (String) request.getAttribute("messageType");

                if (message != null && !message.isEmpty()) {
                    String alertClass = "error".equals(messageType) ?
                        "bg-red-100 border-red-400 text-red-700" :
                        "bg-green-100 border-green-400 text-green-700";
            %>
                <div class="<%= alertClass %> border-l-4 px-4 py-3 rounded mb-4 text-sm">
                    <%= message %>
                </div>
            <%
                }
            %>

            <!-- Formulário -->
            <form action="ForgotPasswordServlet" method="post" class="space-y-5">
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">E-mail:</label>
                    <input 
                        type="email" 
                        id="email" 
                        name="email" 
                        required 
                        placeholder="seu@email.com"
                        class="mt-1 w-full px-4 py-2 border rounded-lg shadow-sm focus:ring focus:ring-indigo-300 outline-none"
                    />
                </div>

                <button 
                    type="submit"
                    class="w-full bg-indigo-600 text-white py-2 rounded-lg hover:bg-indigo-700 transition duration-300 font-medium"
                >
                    Enviar Link
                </button>
            </form>

            <div class="mt-6 text-center text-sm">
                <a href="login.jsp" class="text-indigo-500 hover:underline">Voltar para o login</a>
            </div>
        </div>
    </main>

</body>
</html>
