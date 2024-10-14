/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import com.sun.tools.javac.resources.compiler;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    String nombreBD = "project";
    String user = "root";
    String pass = "jenisebas23";
    String url = "jdbc:mysql://localhost:3306/" + nombreBD + "?useUnicode = true&use"
            + "JDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&"
            + "serverTimezone=UTC";
    public Connection Conexion (){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,user,pass);
        } catch (Exception e){
           
        }
        
        return con;
    }
}
