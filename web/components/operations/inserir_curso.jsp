<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Curso" %>
<%@ page import="dao.CursoDAO" %>
<%@ page import="dao.ProfessorDAO" %>
<%  
    boolean sucesso;
    Curso cur = new Curso();
    boolean existe;
    String nome = request.getParameter("nome");
    String cargaHoraria = request.getParameter("cargaHoraria");
    String professorId = request.getParameter("professorId");
    String descricao = request.getParameter("descricao");
    String createUser = request.getParameter("createUser");
    //VERIFICANDO SE O PROFESSOR EXISTE
    ProfessorDAO profdao = new ProfessorDAO();
    existe = profdao.existe_professor_id(Integer.parseInt(professorId));
    if (existe){
        //System.out.print("Professor exite");
        cur.setNome(nome);
        cur.setCargaHoraria(Integer.parseInt(cargaHoraria));
        cur.setProfessorId(Integer.parseInt(professorId));
        cur.setDescricao(descricao);    
        cur.setCreateUser(createUser);    
        CursoDAO dao = new CursoDAO();
    }else{
        //System.out.print("Professor não exite");
    }
    CursoDAO curdao = new CursoDAO();
    sucesso = curdao.inserir(cur);
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
                <h2 class="text-2xl font-bold text-green-700 mb-2">Curso cadastrado com sucesso!</h2>
                <p class="text-gray-600">O registro foi inserido na base de dados.</p>
            <% } else if (existe == false){ %>
                <i class="fas fa-circle-xmark text-red-500 text-5xl mb-4"></i>
                <h2 class="text-2xl font-bold text-red-700 mb-2">Falha no cadastro</h2>
                <p class="text-gray-600">Por favor insira um ID de Professor Válido</p>
            <% } else { %>
                <i class="fas fa-circle-xmark text-red-500 text-5xl mb-4"></i>
                <h2 class="text-2xl font-bold text-red-700 mb-2">Falha no cadastro</h2>
                <p class="text-gray-600">Ocorreu um erro ao tentar cadastrar o curso.</p>
            <% } %>
        </div>

        <a href="../forms/form_insert_curso.jsp" class="inline-flex items-center px-5 py-2.5 bg-indigo-600 text-white font-medium text-sm rounded-lg hover:bg-indigo-700 transition">
            <i class="fas fa-arrow-left mr-2"></i> Voltar ao cadastro
        </a>
    </div>

</body>
</html>
