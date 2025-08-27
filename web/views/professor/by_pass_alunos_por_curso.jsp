<%@page import="java.util.List"%>
<%@page import="model.Professor"%>
<%@page import="model.Curso"%>
<%@page import="dao.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
// Resgata o parâmetro ID da URL
    Professor professor = (Professor) session.getAttribute("professor");

    if (professor == null) {
        response.sendRedirect("../../login.jsp");
        return;
    }

    String cursoIdParam = request.getParameter("id");

    try {
        if (cursoIdParam != null && !cursoIdParam.isEmpty()) {
            int curso_id = Integer.parseInt(cursoIdParam);

            CursoDAO curdao = new CursoDAO();
            Curso curso = curdao.consultar_por_id(curso_id);

            if (curso != null) {
                session.setAttribute("curso", curso);
                response.sendRedirect("alunos_por_curso.jsp");
            } else {
                // Tratar caso o curso não seja encontrado
                session.setAttribute("erro", "Curso não encontrado");
                response.sendRedirect("frame.jsp");
            }
        } else {
            // Tratar caso o parâmetro id não seja fornecido
            session.setAttribute("erro", "ID do curso não fornecido");
            response.sendRedirect("frame.jsp");
        }
    } catch (NumberFormatException e) {
        System.out.print("Erro de conversão: " + e);
        session.setAttribute("erro", "ID do curso inválido");
        response.sendRedirect("frame.jsp");
    } catch (Exception e) {
        System.out.print("Erro geral: " + e);
        session.setAttribute("erro", "Ocorreu um erro inesperado");
        response.sendRedirect("frame.jsp");
    }
%>
