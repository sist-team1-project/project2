package com.sist.exception;

import java.io.*;
import java.sql.*;

import org.springframework.web.bind.annotation.*;

@ControllerAdvice("com.sist.web")
public class CommonsException {

    @ExceptionHandler(RuntimeException.class)
    public void runtimeHandler(RuntimeException ex) {
        System.out.println("===== RuntimeException 에러 발생 =====");
        System.out.println(ex.getMessage());
    }

    @ExceptionHandler(SQLException.class)
    public void sqlHandler(SQLException ex) {
        System.out.println("===== SQLException 에러 발생 =====");
        System.out.println(ex.getMessage());
    }

    @ExceptionHandler(IOException.class)
    public void ioHanlder(IOException ex) {
        System.out.println("===== IOException 에러 발생 =====");
        System.out.println(ex.getMessage());
    }

    @ExceptionHandler(ClassNotFoundException.class)
    public void classNotFoundHandler(ClassNotFoundException ex) {
        System.out.println("===== ClassNotFoundException 에러 발생 =====");
        System.out.println(ex.getMessage());
    }

    @ExceptionHandler(Exception.class)
    public void exceptionHandler(Exception ex) {
        System.out.println("===== Exception 에러 발생 =====");
        System.out.println(ex.getMessage());
    }
}