/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class consultas extends conexion {

    //Método para verificar si un usuario existe dentro de la base de datos.
    public boolean Autenticacion(String usuario, String contrasena) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from usuarios where usuario = ? and contrasena = ?";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, contrasena);
            rs = pst.executeQuery();
            if (rs.absolute(1)) {
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Error " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error " + e);
            }
        }
        return false;
    }

    //Método para registrar un nuevo usuario en la base de datos.
    public boolean RegistrarUsuario(String usuario, String contrasena) {

        PreparedStatement pst = null;

        try {
            String registro = "insert into usuarios (usuario, contrasena) values (?, ?)";
            pst = getConexion().prepareStatement(registro);
            pst.setString(1, usuario);
            pst.setString(2, contrasena);
            if (pst.executeLargeUpdate() == 1) {

                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                System.out.println("Error " + e);
            }
        }
        return false;

    }

    public boolean ActualizarUsuario(String id, String usuario, String contrasena) {

        PreparedStatement pst = null;
        try {
            String actualizacion = "update usuarios set usuario=?, contrasena=? where id=?";
            pst=getConexion().prepareStatement(actualizacion);
            pst.setString(1, id);
            pst.setString(2, usuario);
            pst.setString(3, contrasena);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error " + e);
        }
        return false;
        
    }
    /*public boolean obtenerRegistros(String usuario, String contrasena){
       PreparedStatement pst = null;
       ResultSet rs = null;
       try{
           String consulta = "select * from usuarios where usuario = ? and contrasena = ?";
           pst.setString(1, usuario);
           pst.setString(2, contrasena);
           rs = pst.executeQuery();
           while(rs.next()){
               
           }
           
       }catch(SQLException e){
           System.out.println("Error " + e);
       }
       
       
        return false;
       
   }*/
}
