<%@page import="dao.AlunoDAO" %>
<%@page import="dao.ProfessorDAO" %>
<%@page import="dao.UsuariosDAO" %>
<%@page import="dao.AvaliacaoDAO" %>
<%@page import="dao.CursoDAO" %>
<%
    AlunoDAO aludao = new AlunoDAO();
    UsuariosDAO user= new UsuariosDAO();
    ProfessorDAO profdao = new ProfessorDAO();
    AvaliacaoDAO avadao = new AvaliacaoDAO();
    CursoDAO curdao = new CursoDAO();
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Plataforma de Ensino</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            .card-hover:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }
            .gradient-bg {
                background: linear-gradient(135deg, #1e3a8a 0%, #3b82f6 100%);
            }
        </style>
    </head>
    <body class="bg-blue-50 font-sans">
        <div class="min-h-screen flex items-center justify-center p-4">
            <div class="w-full max-w-4xl bg-white rounded-xl shadow-2xl overflow-hidden">
                <!-- Header -->
                <div class="gradient-bg py-6 px-8 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <h1 class="text-3xl font-bold">Painel Administrativo</h1>
                            <p class="mt-2 opacity-90">Sistema de Gerenciamento Acadêmico</p>
                        </div>
                        <div class="bg-white/20 p-3 rounded-full">
                            <i class="fas fa-graduation-cap text-2xl"></i>
                        </div>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="p-8">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <!-- Cadastros Section -->
                        <div class="bg-blue-50 p-6 rounded-lg border border-blue-100">
                            <h2 class="text-xl font-semibold text-blue-800 mb-4 flex items-center">
                                <i class="fas fa-user-plus text-blue-600 mr-3"></i> Cadastros
                            </h2>
                            <div class="space-y-3">
                                <a href="../../components/forms/form_insert_aluno.jsp" class="block group">
                                    <div class="flex items-center p-3 bg-white rounded-lg border border-blue-200 card-hover transition duration-300">
                                        <div class="p-2 rounded-full bg-blue-100 text-blue-600 mr-4">
                                            <i class="fas fa-user-graduate"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium text-gray-800 group-hover:text-blue-600">Cadastrar Alunos</h3>
                                            <p class="text-sm text-gray-500">Adicionar novos alunos ao sistema</p>
                                        </div>
                                        <div class="ml-auto text-gray-400 group-hover:text-blue-600">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </a>

                                <a href="../../components/forms/form_insert_prof.jsp" class="block group">
                                    <div class="flex items-center p-3 bg-white rounded-lg border border-blue-200 card-hover transition duration-300">
                                        <div class="p-2 rounded-full bg-blue-100 text-blue-600 mr-4">
                                            <i class="fas fa-chalkboard-teacher"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium text-gray-800 group-hover:text-blue-600">Cadastrar Professores</h3>
                                            <p class="text-sm text-gray-500">Registrar novos professores</p>
                                        </div>
                                        <div class="ml-auto text-gray-400 group-hover:text-blue-600">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </a>

                                <a href="../../components/forms/form_insert_user.jsp" class="block group">
                                    <div class="flex items-center p-3 bg-white rounded-lg border border-blue-200 card-hover transition duration-300">
                                        <div class="p-2 rounded-full bg-blue-100 text-blue-600 mr-4">
                                            <i class="fas fa-users-cog"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium text-gray-800 group-hover:text-blue-600">Cadastrar Usuários</h3>
                                            <p class="text-sm text-gray-500">Criar contas de acesso ao sistema</p>
                                        </div>
                                        <div class="ml-auto text-gray-400 group-hover:text-blue-600">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </a>
                                <a href="../../components/forms/form_insert_curso.jsp" class="block group">
                                    <div class="flex items-center p-3 bg-white rounded-lg border border-blue-200 card-hover transition duration-300">
                                        <div class="p-2 rounded-full bg-blue-100 text-blue-600 mr-4">
                                            <i class="fas fa-users-cog"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium text-gray-800 group-hover:text-blue-600">Cadastrar Curso</h3>
                                            <p class="text-sm text-gray-500">Criar contas de acesso ao sistema</p>
                                        </div>
                                        <div class="ml-auto text-gray-400 group-hover:text-blue-600">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </a>

                               
                            </div>
                        </div>

                        <!-- Listagens Section -->
                        <div class="bg-blue-50 p-6 rounded-lg border border-blue-100">
                            <h2 class="text-xl font-semibold text-blue-800 mb-4 flex items-center">
                                <i class="fas fa-list-ul text-blue-600 mr-3"></i> Listagens
                            </h2>
                            <div class="space-y-3">
                                <a href="../admin/management/edit_list_geral_alunos.jsp" class="block group">
                                    <div class="flex items-center p-3 bg-white rounded-lg border border-blue-200 card-hover transition duration-300">
                                        <div class="p-2 rounded-full bg-blue-100 text-blue-600 mr-4">
                                            <i class="fas fa-user-graduate"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium text-gray-800 group-hover:text-blue-600">Listar Alunos</h3>
                                            <p class="text-sm text-gray-500">Visualizar e editar alunos cadastrados</p>
                                        </div>
                                        <div class="ml-auto text-gray-400 group-hover:text-blue-600">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </a>

                                <a href="../admin/management/edit_list_geral_professor.jsp" class="block group">
                                    <div class="flex items-center p-3 bg-white rounded-lg border border-blue-200 card-hover transition duration-300">
                                        <div class="p-2 rounded-full bg-blue-100 text-blue-600 mr-4">
                                            <i class="fas fa-chalkboard-teacher"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium text-gray-800 group-hover:text-blue-600">Listar Professores</h3>
                                            <p class="text-sm text-gray-500">Visualizar e editar professores</p>
                                        </div>
                                        <div class="ml-auto text-gray-400 group-hover:text-blue-600">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </a>

                                <a href="../admin/management/edit_list_geral_user.jsp" class="block group">
                                    <div class="flex items-center p-3 bg-white rounded-lg border border-blue-200 card-hover transition duration-300">
                                        <div class="p-2 rounded-full bg-blue-100 text-blue-600 mr-4">
                                            <i class="fas fa-users-cog"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium text-gray-800 group-hover:text-blue-600">Listar Usuários</h3>
                                            <p class="text-sm text-gray-500">Visualizar e editar contas de acesso</p>
                                        </div>
                                        <div class="ml-auto text-gray-400 group-hover:text-blue-600">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </a>
                                <a href="../admin/management/edit_list_geral_cursos.jsp" class="block group">
                                    <div class="flex items-center p-3 bg-white rounded-lg border border-blue-200 card-hover transition duration-300">
                                        <div class="p-2 rounded-full bg-blue-100 text-blue-600 mr-4">
                                            <i class="fas fa-users-cog"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium text-gray-800 group-hover:text-blue-600">Listar Cursos</h3>
                                            <p class="text-sm text-gray-500">Visualizar e editar contas de acesso</p>
                                        </div>
                                        <div class="ml-auto text-gray-400 group-hover:text-blue-600">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </a>

                            </div>
                        </div>
                    </div>

                    <!-- Quick Stats -->
                    <div class="mt-8 grid grid-cols-2 md:grid-cols-4 gap-4">
                        <div class="bg-white p-4 rounded-lg shadow border border-blue-200 text-center">
                            <div class="text-blue-600 mb-2">
                                <i class="fas fa-user-graduate text-2xl"></i>
                            </div>
                            <h3 class="font-semibold text-gray-800">Alunos</h3>
                            <p class="text-2xl font-bold text-blue-600"><%= avadao.contarRegistros("Alunos")%></p>
                        </div>

                        <div class="bg-white p-4 rounded-lg shadow border border-blue-200 text-center">
                            <div class="text-blue-600 mb-2">
                                <i class="fas fa-chalkboard-teacher text-2xl"></i>
                            </div>
                            <h3 class="font-semibold text-gray-800">Professores</h3>
                            <p class="text-2xl font-bold text-blue-600"><%= avadao.contarRegistros("professores")%></p>
                        </div>

                        <div class="bg-white p-4 rounded-lg shadow border border-blue-200 text-center">
                            <div class="text-blue-600 mb-2">
                                <i class="fas fa-book text-2xl"></i>
                            </div>
                            <h3 class="font-semibold text-gray-800">Cursos</h3>
                            <p class="text-2xl font-bold text-blue-600"><%= avadao.contarRegistros("cursos")%></p>
                        </div>

                        <div class="bg-white p-4 rounded-lg shadow border border-blue-200 text-center">
                            <div class="text-blue-600 mb-2">
                                <i class="fas fa-clipboard-check text-2xl"></i>
                            </div>
                            <h3 class="font-semibold text-gray-800">Avaliações</h3>
                            <p class="text-2xl font-bold text-blue-600"><%= avadao.contarRegistros("avaliacoes")%></p>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="bg-blue-50 px-8 py-4 border-t border-blue-200">
                    <div class="flex items-center justify-between">
                        <p class="text-sm text-blue-600">© 2023 Plataforma de Ensino</p>
                        <div class="flex space-x-4">
                            <a href="#" class="text-blue-600 hover:text-blue-800">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="text-blue-600 hover:text-blue-800">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="text-blue-600 hover:text-blue-800">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Simple hover effects
            document.querySelectorAll('a').forEach(link => {
                link.addEventListener('mouseenter', function () {
                    this.querySelector('div').classList.add('shadow-md');
                });
                link.addEventListener('mouseleave', function () {
                    this.querySelector('div').classList.remove('shadow-md');
                });
            });
        </script>
    </body>
</html>