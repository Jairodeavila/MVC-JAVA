/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author Aprendiz SENA
 */
public class mdlPrograma {
    public static int addPrograma(Programa pro){
        
     Conexion o = new Conexion();
     Connection con = o.getConexion();
     String sql="INSERT INTO t_programa(PRO_NOMBRE,PRO_CODIGO,PRO_UID)"
             + "VALUES (?,?,?)";
     int r = 0;
     try{
     PreparedStatement st = con.prepareStatement(sql);
     st.setString(1, pro.getNombre());
      st.setString(2, pro.getCodigo());
       st.setString(3, pro.getUid());
       
   
     r= st.executeUpdate();
     }catch(SQLException ex){
         System.out.println("error al registrar");
     }
     return r;
    
    }
    public int editPrograma (Programa pro){
     Conexion o = new Conexion();
     Connection con = o.getConexion();
     String sql="UPDATE t_programa SET PRO_NOMBRE = ?,PRO_CODIGO  ?,PRO_UID = ?"
             ;
     int r = 0;
     try{
     PreparedStatement st = con.prepareStatement(sql);
     st.setString(0, pro.getNombre());
      st.setString(1, pro.getCodigo());
       st.setString(2, pro.getUid());
       
   
     r= st.executeUpdate();
     }catch(SQLException ex){
         System.out.println("error al editar");
     }
     return r;
    }
    
    
    
    
    public int delPrograma(Programa pro){
    Conexion o = new Conexion();
     Connection con = o.getConexion();
     String sql="DELETE FROM  t_programa WHERE PRO_UID = ?";
     int r = 0;
     try{
     PreparedStatement st = con.prepareStatement(sql);
       st.setString(1, pro.getUid());
     r= st.executeUpdate();
     }catch(SQLException ex){
         System.out.println("error al eliminar");
     }
     return r;
    }
    
    
    
   public static Programa finPrograma (String codigo){
       System.out.println(codigo);
        Conexion o     = new Conexion();
        Connection con = o.getConexion();
        String sql = "SELECT * FROM t_programa WHERE PRO_CODIGO = ?";
        ResultSet rs; 
        Programa p = new Programa();
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,codigo);
            rs = st.executeQuery();
            if(rs.next())
            {
                p.setId(rs.getInt("PRO_ID"));
                p.setNombre(rs.getString("PRO_NOMBRE"));
                p.setCodigo(rs.getString("PRO_CODIGO"));
                System.out.println(p.getNombre());
            }else{
                System.out.println("nada mrk");
                p = null;
            }
        } catch (SQLException ex){
            System.out.println("Error");
        }
      
        return p;
    }
    
    
}
