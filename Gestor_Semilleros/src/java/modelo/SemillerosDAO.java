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
public class SemillerosDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List Listar() {
        String sql = "SELECT * FROM project.view_semilleros;";
        List<Semilleros> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Semilleros se = new Semilleros();
                se.setId_semi(rs.getInt(1));
                se.setNombre_s(rs.getString(2));
                se.setGrupo_in(rs.getString(3));
                lista.add(se);
            }
        } catch (Exception e) {
            System.out.println("No funciono Listar");
        }
        return lista;
    }

    public Semilleros registrar(Semilleros item) {
        String sql = "INSERT INTO project.semilleros\n"
                + "(`id`,\n"
                + "`nombre`,\n"
                + "`id_grupo_investigacion`\n)"
                + "VALUES\n"
                + "(?,\n"
                + "?,\n"
                + "?);";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, item.getId_semi());
            ps.setString(2, item.getNombre_s());
            ps.setString(3, item.getGrupo_in());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return item;

    }

    public Semilleros listarId(int id) {
        Semilleros ci = new Semilleros();
        String sql = "SELECT * FROM project.semilleros WHERE id = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ci.setNombre_s(rs.getString(2));
                ci.setGrupo_in_id(rs.getInt(3));
            }
        } catch (Exception e) {
        }
        return ci;
    }
    
    public Semilleros actualizar(Semilleros item) {
        String sql = "Update project.semilleros set \n"
                + "nombre = ?,\n"
                + "id_grupo_investigacion = ?,\n"
                + "WHERE id = ?\n";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getNombre_s());
            ps.setInt(2, item.getGrupo_in_id());
            ps.setInt(3, item.getId_semi());
            ps.executeUpdate();

        } catch (Exception e) {
        }
        return item;
    }
    
        public void delete(int id) {
        String sql = "DELETE from project.semilleros WHERE id =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
