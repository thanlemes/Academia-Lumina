<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Acessar Academia</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

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
            <a href="index.jsp" class="text-gray-700 hover:text-indigo-600 font-medium">Login</a>
        </nav>
    </div>
</header>

    <!-- Login Form -->
    <main class="flex-grow flex items-center justify-center px-4">
        <div class="bg-white shadow-2xl rounded-xl p-8 w-full max-w-md">
            <h2 class="text-center text-2xl font-bold text-indigo-700 mb-6">Login</h2>

            <form action="controller_login.jsp" method="POST" class="space-y-4">
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">E-mail:</label>
                    <input type="text" id="email" name="email" required
                           class="mt-1 w-full px-4 py-2 border rounded-lg shadow-sm focus:ring focus:ring-indigo-300 outline-none">
                </div>

                <div>
                    <label for="senha" class="block text-sm font-medium text-gray-700">Senha:</label>
                    <input type="password" id="senha" name="senha" required
                           class="mt-1 w-full px-4 py-2 border rounded-lg shadow-sm focus:ring focus:ring-indigo-300 outline-none">
                </div>

                <div class="text-right text-sm">
                    <a href="esqueceu_a_senha.jsp" class="text-indigo-500 hover:underline">Esqueceu a senha?</a>
                </div>

                <button type="submit"
                        class="w-full bg-indigo-600 text-white py-2 rounded-lg hover:bg-indigo-700 transition duration-300">
                    Entrar
                </button>
            </form>
        </div>
    </main>

</body>
</html>
