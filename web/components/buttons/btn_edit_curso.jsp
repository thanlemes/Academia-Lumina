<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.CursoDAO"%>
<%@page import="model.Curso"%>
<%@page import="model.Usuarios"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Controle de Cursos</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-blue-100 min-h-screen flex items-center justify-center p-6">

        <div class="bg-white rounded-2xl shadow-lg w-full max-w-3xl p-10 space-y-6">
            <h1 class="text-3xl font-bold text-blue-800 border-b border-blue-300 pb-4">Controle de Cursos</h1>

            <%
                Usuarios usuario = (Usuarios) session.getAttribute("usuario");

                    
                if (usuario == null) {
                    response.sendRedirect("../../login.jsp");
                    return;
                }

                Curso curso = new Curso();
                curso.setId(Integer.parseInt(request.getParameter("id")));
                CursoDAO cursoDAO = new CursoDAO();
                curso = cursoDAO.consultar_por_id(curso.getId());

                if (curso != null) {
            %>

            <form method="post" action="../operations/update_curso.jsp" class="grid grid-cols-1 md:grid-cols-2 gap-6">

                <div>
                    <label class="block text-sm font-semibold text-blue-800">Código</label>
                    <input type="text" name="id" value="<%= curso.getId()%>" readonly
                           class="mt-1 w-full border border-blue-300 bg-gray-100 rounded-lg p-3 text-gray-600" />
                </div>

                <div>
                    <label class="block text-sm font-semibold text-blue-800">Nome do Curso</label>
                    <input type="text" name="nome" value="<%= curso.getNome()%>" required
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500" />
                </div>

                <div>
                    <label class="block text-sm font-semibold text-blue-800">Carga Horária</label>
                    <input type="number" name="cargaHoraria" value="<%= curso.getCargaHoraria()%>" required
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500" />
                </div>

                <div>
                    <label class="block text-sm font-semibold text-blue-800">ID do Professor</label>
                    <input type="number" name="professorId" value="<%= curso.getProfessorId()%>" required
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="md:col-span-2">
                    <label class="block text-sm font-semibold text-blue-800">Descrição</label>
                    <textarea name="descricao" required
                              class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500"><%= curso.getDescricao()%></textarea>
                </div>
                
                <div>
                    <label class="block text-sm font-semibold text-blue-800"></label>
                    <input type="hidden" name="createUser" value="<%= curso.getCreateUser()%>" 
                           class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500" />
                </div>


                <div class="md:col-span-2 flex justify-end gap-4 mt-4">
                    <button type="submit"
                            class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition">
                        Salvar Alteração
                    </button>
                    <a href="../../views/admin/management/edit_list_geral_cursos.jsp"
                       class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition">
                        Voltar
                    </a>
                    <button type="reset"
                            class="bg-gray-300 text-gray-800 px-6 py-2 rounded-lg hover:bg-gray-400 transition">
                        Limpar
                    </button>
                </div>
            </form>

            <p class="text-green-600 font-medium mt-6">Curso localizado com sucesso!</p>

            <%
            } else {
            %>
            <p class="text-red-600 font-semibold mt-4">Curso não localizado!</p>
            <%
                }
            %>
        </div>
    </body>
</html>
