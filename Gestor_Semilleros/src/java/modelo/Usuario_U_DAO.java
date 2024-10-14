/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SEBAS
 */
public class Usuario_U_DAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Usuario_U validar(Usuario_U item) {
        Usuario_U em = new Usuario_U();
        String sql = "SELECT * FROM project.usuarios_u WHERE usuario=? AND contrasena=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getUsuario());
            ps.setString(2, item.getContrasena());
            System.out.println("Validar Usuario DAO: "+item.getUsuario()+" Contraseña: "+item.getContrasena());
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setId(rs.getInt("id"));
                em.setUsuario(rs.getString("usuario"));
                em.setContrasena(rs.getString("contrasena"));
            }
        } catch (Exception e) {
        }
        return em;
    }

    // Operaciones CRUD
    public List Listar() {
        String sql = "SELECT * FROM project.usuarios_u";
        List<Usuario_U> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario_U em = new Usuario_U();
                em.setId(rs.getInt(1));
                em.setUsuario(rs.getString(2));
                em.setContrasena(rs.getString(3));
                lista.add(em);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public Usuario_U registrar(Usuario_U item) {
        Usuario_U em = new Usuario_U();
        String sql = "INSERT INTO project.usuarios_u(`usuario`,`contrasena`) VALUES(?,?);";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getUsuario());
            ps.setString(2, item.getContrasena());
            System.out.println("Registro Usuario DAO: "+item.getUsuario()+" Contraseña: "+item.getContrasena());
            int res = ps.executeUpdate();
        } catch (Exception e) {
        }
        return em;
    }

    public Usuario_U listarId(int id) {
        Usuario_U em = new Usuario_U();
        String sql = "SELECT * FROM project.usuarios_u WHERE id = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setUsuario(rs.getString(2));
                em.setContrasena(rs.getString(3));
            }
        } catch (Exception e) {
        }
        return em;
    }

    public Usuario_U actualizar(Usuario_U item) {
        String sql = "Update project.usuarios_u set \n"
                + "usuario = ?,\n"
                + "contraseña = ? WHERE id = ?\n";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getUsuario());
            ps.setString(2, item.getContrasena());
            int res = ps.executeUpdate();

        } catch (Exception e) {
        }
        return item;
    }

    public void delete(int id) {
        String sql = "DELETE from project.usuarios_u WHERE id =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            int res = ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
