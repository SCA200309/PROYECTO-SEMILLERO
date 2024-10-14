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
    int r;

    public Usuario_U validar(Usuario_U item) {
        Usuario_U em = new Usuario_U();
        String sql = "SELECT * FROM project.usuario_u WHERE USER =? AND password=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getUsuario());
            ps.setString(2, item.getContraseña());
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setId(rs.getInt("Id"));
                em.setUsuario(rs.getString("Usuario"));
                em.setContraseña(rs.getString("Contraseña"));
            }
        } catch (Exception e) {
        }
        return em;
    }

    // Operaciones CRUD
    public List Listar() {
        String sql = "SELECT * FROM sistema_ventas.empleado";
        List<Usuario_U> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario_U em = new Usuario_U();
                em.setId(rs.getInt(1));
                em.setUsuario(rs.getString(2));
                em.setContraseña(rs.getString(3));
                lista.add(em);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public Usuario_U registrar(Usuario_U item) {
        Usuario_U em = new Usuario_U();
        String sql = "INSERT INTO project.usuario_u\n"
                + "(`usuario`,\n"
                + "`contraseña`)\n"
                + "VALUES\n"
                + "(?,\n"
                + "?);";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getUsuario());
            ps.setString(2, item.getContraseña());
            int res = ps.executeUpdate();
        } catch (Exception e) {
        }
        return em;
    }

    public Usuario_U listarId(int id) {
        Usuario_U em = new Usuario_U();
        String sql = "SELECT * FROM project.usuario_u WHERE id = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setUsuario(rs.getString(2));
                em.setContraseña(rs.getString(3));
            }
        } catch (Exception e) {
        }
        return em;
    }

    public Usuario_U actualizar(Usuario_U item) {
        String sql = "Update project.usuario_u set \n"
                + "usuario = ?,\n"
                + "contraseña = ? WHERE id = ?\n";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getUsuario());
            ps.setString(2, item.getContraseña());
            int res = ps.executeUpdate();

        } catch (Exception e) {
        }
        return item;
    }

    public void delete(int id) {
        String sql = "DELETE from project.usuario_u WHERE id =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            int res = ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
