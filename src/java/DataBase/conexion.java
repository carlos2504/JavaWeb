/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;


/**
 *
 * @author Lenovo
 */
public class conexion {
    private String USERNAME = "root";
    private String PASSWORD = "1234";
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DATABASE = "examen";
    private String CLASSNAME = "com.mysql.jdbc.Driver";
    private String COMPLEMENT = "?autoReconnect=true&useSSL=false";
    private String URL= "jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE+"?useSSL=false";
    private Connection con;
    
    public conexion(){
        try{
            Class.forName(CLASSNAME);
            con= DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch(ClassNotFoundException e){
            System.err.println("Error"+  e);
            
        } catch(SQLException e){
            System.err.println("Error "+ e);
        }
    }
    public Connection getConexion(){
        return con;
    }
    public static void main(String[] args){
        conexion con = new conexion();
        
    }
}
