/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Programa;
import Modelo.mdlPrograma;
import Vista.vstPrograma;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.UUID;
import javax.swing.JOptionPane;

/**
 *
 * @author Aprendiz SENA
 */
public class cntPrograma implements ActionListener{
    vstPrograma vPrograma;

    public cntPrograma(vstPrograma vPrograma) {
        this.vPrograma = vPrograma;
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource().equals(vPrograma.regisBtn)){
            String nombre =vPrograma.nombre.getText();
            String codigo = vPrograma.codigo.getText();
             
            Programa p = new Programa();
            p.setCodigo(codigo);
            p.setNombre(nombre);
            p.setUid(UUID.randomUUID().toString());
            int r =mdlPrograma.addPrograma(p);
            if(r >0){
                JOptionPane.showMessageDialog(vPrograma,"se registrooo");
            }else{
                  JOptionPane.showMessageDialog(vPrograma,"error");
                
            }
            //int r = mdlPrograma.addPrograma(p);
            System.out.println("Registro");
        }
        
        if(e.getSource().equals(vPrograma.btnConsultar)){
            String codigo = vPrograma.txtValorbusqueda.getText();
            Programa p = new Programa();
            p.setCodigo(codigo);
            Programa r =mdlPrograma.finPrograma(codigo);
            
            if(r == null)
            {
            JOptionPane.showMessageDialog(vPrograma, "error");
            }else{
            vPrograma.txtCCodigo.setText(r.getCodigo());
            vPrograma.txtCNombre.setText(r.getNombre());
            
            }
            
           
        }
        
    
    }
     
    
}
