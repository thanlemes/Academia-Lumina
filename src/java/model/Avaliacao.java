/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author kaike
 */
public class Avaliacao {
    private int id;
    private int alunoId;
    private int cursoId;
    private double nota1;
    private double nota2;
    private double notaFinal;
    private int faltas;
    private String status;
    
    public Avaliacao() {
    }

    public Avaliacao(int id, int alunoId, int cursoId, double nota1, double nota2, double notaFinal, int faltas, String status) {
        this.id = id;
        this.alunoId = alunoId;
        this.cursoId = cursoId;
        this.nota1 = nota1;
        this.nota2 = nota2;
        this.notaFinal = notaFinal;
        this.faltas = faltas;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public int getAlunoId() {
        return alunoId;
    }

    public int getCursoId() {
        return cursoId;
    }

    public double getNota1() {
        return nota1;
    }

    public double getNota2() {
        return nota2;
    }

    public double getNotaFinal() {
        return notaFinal;
    }

    public int getFaltas() {
        return faltas;
    }

    public String getStatus() {
        return status;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public void setAlunoId(int alunoId) {
        this.alunoId = alunoId;
    }

    public void setCursoId(int cursoId) {
        this.cursoId = cursoId;
    }

    public void setNota1(double nota1) {
        this.nota1 = nota1;
    }

    public void setNota2(double nota2) {
        this.nota2 = nota2;
    }

    public void setNotaFinal(double notaFinal) {
        this.notaFinal = notaFinal;
    }

    public void setFaltas(int faltas) {
        this.faltas = faltas;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}