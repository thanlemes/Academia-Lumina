<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Curso" %>
<%@page import="model.Usuarios" %>
<%
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        
    if (usuario == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }
    Curso curso = (Curso) request.getAttribute("curso");
    
    boolean isEdit = curso != null;
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title><%= isEdit ? "Editar Curso" : "Cadastrar Curso" %></title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-blue-100 min-h-screen flex items-center justify-center p-6">

    <div class="bg-white rounded-2xl shadow-lg w-full max-w-2xl p-10 space-y-6">
        <div class="border-b border-blue-200 pb-4 mb-6">
            <h2 class="text-3xl font-bold text-blue-800 flex items-center">
                <i class="fas <%= isEdit ? "fa-pen-to-square" : "fa-plus" %> mr-3"></i>
                <%= isEdit ? "Editar Curso" : "Cadastrar Novo Curso" %>
            </h2>
            <p class="text-sm text-blue-600">
                <%= isEdit ? "Atualize os dados do curso abaixo." : "Preencha os dados abaixo para cadastrar um novo curso." %>
            </p>
        </div>

            <form action="../operations/inserir_curso.jsp" method="post" class="grid grid-cols-1 gap-6">
            <% if (isEdit) { %>
                <input type="hidden" name="id" value="<%= curso.getId() %>"/>
            <% } %>

            <div>
                <label for="nome" class="block text-sm font-semibold text-blue-800">Nome do Curso</label>
                <input type="text" id="nome" name="nome" required
                       value="<%= isEdit ? curso.getNome() : "" %>"
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none" />
            </div>

            <div>
                <label for="cargaHoraria" class="block text-sm font-semibold text-blue-800">Carga Horária (h)</label>
                <input type="number" id="cargaHoraria" name="cargaHoraria" required
                       value="<%= isEdit ? curso.getCargaHoraria() : "" %>"
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none" />
            </div>

            <div>
                <label for="professorId" class="block text-sm font-semibold text-blue-800">ID do Professor</label>
                <input type="number" id="professorId" name="professorId" required
                       value="<%= isEdit ? curso.getProfessorId() : "" %>"
                       class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none" />
            </div>

            <div>
                <label for="descricao" class="block text-sm font-semibold text-blue-800">Descrição</label>
                <textarea id="descricao" name="descricao" rows="4"
                          class="mt-1 w-full border border-blue-300 rounded-lg p-3 focus:ring-2 focus:ring-blue-500 focus:outline-none"><%= isEdit ? curso.getDescricao() : "" %></textarea>
            </div>

            <input type="hidden" id="createUser" name="createUser" value="<%=usuario.getUsuario()%>" />

            <div class="flex justify-end space-x-4">
                <button type="submit"
                        class="bg-blue-600 text-white font-medium px-6 py-3 rounded-lg hover:bg-blue-700 transition duration-200 flex items-center">
                    <i class="fas <%= isEdit ? "fa-save" : "fa-check" %> mr-2"></i>
                    <%= isEdit ? "Atualizar Curso" : "Cadastrar Curso" %>
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
