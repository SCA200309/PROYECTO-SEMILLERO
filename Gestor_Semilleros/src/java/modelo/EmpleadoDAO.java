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
public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Empleado validar(Empleado item) {
        Empleado em = new Empleado();
        String sql = "SELECT * FROM sistema_ventas.empleado WHERE USER =? AND password=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getUser());
            ps.setString(2, item.getPass());
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setIdEmpleado(rs.getInt("IdEmpleado"));
                em.setDni(rs.getString("Dni"));
                em.setNombres(rs.getString("Nombres"));
                em.setTel(rs.getString("Telefono"));
                em.setEstado(rs.getString("Estado"));
                em.setUser(rs.getString("User"));
                em.setPass(rs.getString("password"));
            }
        } catch (Exception e) {
        }
        return em;
    }

    // Operaciones CRUD
    public List Listar() {
        String sql = "SELECT * FROM sistema_ventas.empleado";
        List<Empleado> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado em = new Empleado();
                em.setIdEmpleado(rs.getInt(1));
                em.setDni(rs.getString(2));
                em.setNombres(rs.getString(3));
                em.setTel(rs.getString(4));
                em.setEstado(rs.getString(5));
                em.setUser(rs.getString(6));
                em.setPass(rs.getString(7));
                lista.add(em);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public Empleado registrar(Empleado item) {
        Empleado em = new Empleado();
        String sql = "INSERT INTO sistema_ventas.empleado\n"
                + "(`Dni`,\n"
                + "`Nombres`,\n"
                + "`Telefono`,\n"
                + "`Estado`,\n"
                + "`User`,\n"
                + "`password`)\n"
                + "VALUES\n"
                + "(?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?);";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getDni());
            ps.setString(2, item.getNombres());
            ps.setString(3, item.getTel());
            ps.setString(4, item.getEstado());
            ps.setString(5, item.getUser());
            ps.setString(6, item.getPass());
            int res = ps.executeUpdate();

        } catch (Exception e) {
        }
        return em;
    }

    public Empleado listarId(int id) {
        Empleado em = new Empleado();
        String sql = "SELECT * FROM sistema_ventas.empleado WHERE IdEmpleado = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setDni(rs.getString(2));
                em.setNombres(rs.getString(3));
                em.setTel(rs.getString(4));
                em.setEstado(rs.getString(5));
                em.setUser(rs.getString(6));
                em.setPass(rs.getString(7));
            }
        } catch (Exception e) {
        }
        return em;
    }

    public Empleado actualizar(Empleado item) {
        String sql = "Update sistema_ventas.empleado set \n"
                + "Dni = ?,\n"
                + "Nombres = ?,\n"
                + "Telefono = ?,\n"
                + "Estado = ?,\n"
                + "User = ?,\n"
                + "password = ? WHERE IdEmpleado = ?\n";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getDni());
            ps.setString(2, item.getNombres());
            ps.setString(3, item.getTel());
            ps.setString(4, item.getEstado());
            ps.setString(5, item.getUser());
            ps.setString(6, item.getPass());
            ps.setInt(7, item.getIdEmpleado());
            int res = ps.executeUpdate();

        } catch (Exception e) {
        }
        return item;
    }

    public void delete(int id) {
        String sql = "DELETE from empleado WHERE idEmpleado =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            int res = ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
