/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Aprendiz SENA
 */
public class Usuario {
    private int id;
    private String nombres;
    private String apellidos;
    private String email;
    private String password;
    private String rol;
    private String telefono;
    private String uid;

    public int getId() {
        return id;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRol() {
        return rol;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getUid() {
        return uid;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }
  
    
    
    
    
}
