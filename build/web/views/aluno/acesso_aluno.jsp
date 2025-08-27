<%@page import="model.Aluno"%>
<%
    // Recupera o objeto Aluno da session
    Aluno aluno = (Aluno) session.getAttribute("aluno");
    System.out.println("Aluno logado : "+aluno.getEmail());
    
    if (aluno == null) {
        // Se não estiver logado, redireciona para login
        response.sendRedirect("../../login.jsp");
        System.out.println("Aluno não logado");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Academia Lumina - Educação Transformadora</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            .hero {
                background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
                background-size: cover;
                background-position: center;
                height: 80vh;
            }

            .course-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            }

            .event-card:hover {
                transform: scale(1.03);
            }

            .map-container iframe {
                transition: all 0.3s ease;
            }

            .map-container:hover iframe {
                transform: scale(1.05);
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            }

            /* Estilo para o iframe de conteúdo */
            .content-iframe {
                width: 100%;
                height: calc(100vh - 64px); /* Altura total menos a altura do navbar */
                border: none;
                margin-top: 1px;
            }

            @media (max-width: 768px) {
                .hero {
                    height: 60vh;
                }
            }
        </style>
    </head>
    <body class="font-sans bg-gray-50">
        <!-- Header/Navigation -->
        <header class="bg-white shadow-md sticky top-0 z-50">
            <div class="container mx-auto px-4 py-3 flex justify-between items-center">
                <div class="flex items-center">
                    <i class="fas fa-graduation-cap text-3xl text-indigo-600 mr-2"></i>
                    <h1 class="text-2xl font-bold text-indigo-800">Academia <span class="text-indigo-500">Lumina</span></h1>
                </div>
                <nav class="hidden md:flex space-x-8">
                    <a href="javascript:void(0)" onclick="loadIframe('../shared/frame.jsp')" class="text-gray-700 hover:text-indigo-600 font-medium">Página inicial</a>
                    <a href="javascript:void(0)" onclick="loadIframe('meus_cursos.jsp')" class="text-gray-700 hover:text-indigo-600 font-medium">Meus Cursos</a>
                    <a href="javascript:void(0)" onclick="loadIframe('dados_pessoais.jsp')" class="text-gray-700 hover:text-indigo-600 font-medium">Dados pessoais</a>
                    <a href="../shared/session_invalidate.jsp" class="text-gray-700 hover:text-indigo-600 font-medium">Logout</a>
                </nav>
                <button class="md:hidden text-gray-700">
                    <i class="fas fa-bars text-2xl"></i>
                </button>
            </div>
        </header>

        <!-- Iframe para carregar o conteúdo -->
        <iframe id="contentFrame" class="content-iframe" src="../shared/frame.jsp" name="contentFrame"></iframe>

        <script>
            // Função para carregar páginas no iframe
            function loadIframe(page) {
                document.getElementById('contentFrame').src = page;
            }
            
            // Carrega a página inicial por padrão
            window.onload = function() {
                document.getElementById('contentFrame').src = '../shared/frame.jsp';
            };
        </script>
    </body>
</html>