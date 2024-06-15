package com.test_bca.entity;

public class Student {
    private String studentId;
    private String studentName;
    private int mark;
    private String department;

    public Student(String studentId, String studentName, int mark, String department) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.mark = mark;
        this.department = department;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}
