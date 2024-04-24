/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Aprendiz SENA
 */
public class mdlUsuario {
  
   
   public int addUsuario(Usuario usu){
        
     Conexion o = new Conexion();
     Connection con = o.getConexion();
     String sql="INSERT INTO t_usuario(USU_NOMBRES,USU_APELLIDOS,USU_EMAIL,USU_PASSWORD,USU_ROL,USU_TELEFONO,PRO_UID)"
             + "VALUES (?,?,?,?,?,?,?)";
     int r = 0;
     try{
     PreparedStatement st = con.prepareStatement(sql);
     st.setString(0, usu.getNombres());
      st.setString(1, usu.getApellidos());
      st.setString(2, usu.getEmail());
      st.setString(3, usu.getPassword());
      st.setString(4, usu.getRol());
      st.setString(5, usu.getTelefono());
       st.setString(6, usu.getUid());
       
   
     r= st.executeUpdate();
     }catch(SQLException ex){
         System.out.println("error al registrar");
     }
     return r;
    
    }
    
    
    public int editUsuario(Usuario usu){
    Conexion o = new Conexion();
     Connection con = o.getConexion();
     String sql="UPDATE t_usuario SET USU_NOMBRES = ?,USU_ID = ?,USU_UID = ?,USU_APELLIDOS=?,USU_EMAIL=?,USU_PASSWORD=?,USU_ROL=?,USU_TELEFONO=?"
             ;
     int r = 0;
     try{
     PreparedStatement st = con.prepareStatement(sql);
     st.setString(0, usu.getNombres());
      st.setString(1, usu.getApellidos());
      st.setString(2, usu.getEmail());
      st.setString(3, usu.getPassword());
      st.setString(4, usu.getRol());
      st.setString(5, usu.getTelefono());
       st.setString(6, usu.getUid());
       
   
     r= st.executeUpdate();
     }catch(SQLException ex){
         System.out.println("error al editar");
     }
     return r;
    }
    
    
    public int delUsuario(Usuario usu){
   Conexion o = new Conexion();
     Connection con = o.getConexion();
     String sql="DELETE FROM  t_usuario WHERE USU_UID = ?";
     int r = 0;
     try{
     PreparedStatement st = con.prepareStatement(sql);
       st.setString(1, usu.getUid());
     r= st.executeUpdate();
     }catch(SQLException ex){
         System.out.println("error al eliminar");
     }
     return r;
    }
    
    public Usuario finUsuario(String email){
     Conexion o     = new Conexion();
        Connection con = o.getConexion();
        String sql = "SELECT * FROM t_usuario WHERE USU_ID = ?";
        ResultSet rs; 
        Usuario u = new Usuario();
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(0,email);
            rs = st.executeQuery();
            u.setId(rs.getInt(1));
            u.setNombres(rs.getString(2));
            u.setApellidos(rs.getString(3));
            u.setEmail(rs.getString(4));
            u.setPassword(rs.getString(5));
            u.setRol(rs.getString(6));
            u.setTelefono(rs.getString(7));
                    
            u.setUid(rs.getString("USU_UID"));
        } catch (SQLException ex){
            System.out.println("Error");
        }
      
        return u;
    }
    
}
    

