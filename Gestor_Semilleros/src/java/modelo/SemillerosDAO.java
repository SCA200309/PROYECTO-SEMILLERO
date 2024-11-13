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

    public boolean registrar(Semilleros item) {
        String sql = "INSERT INTO project.semilleros (id, nombre, id_grupo_investigacion) VALUES (?, ?, ?);";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, item.getId_semi());
            ps.setString(2, item.getNombre_s());
            ps.setInt(3, item.getGrupo_in_id());

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("Registro exitoso para el semillero con ID: " + item.getId_semi());
                return true;
            } else {
                System.out.println("No se pudo registrar el semillero.");
                return false;
            }

        } catch (Exception e) {
            System.out.println("Error al registrar el semillero. Detalles: " + e.getMessage());
            return false;
        }
    }

    public Semilleros listarId(int id) {
        Semilleros ci = new Semilleros();
        String sql = "SELECT * FROM project.semilleros WHERE id = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ci.setId_semi(id);
                ci.setNombre_s(rs.getString(2));
                ci.setGrupo_in_id(rs.getInt(3));
            }
            System.out.println("id_semi:" + ci.getId_semi() + "\n Nombre:" + ci.getNombre_s() + "\n Semillero_id:" + ci.getGrupo_in_id());
        } catch (Exception e) {
        }
        return ci;
    }

    public boolean actualizar(Semilleros item) {
        String sql = "UPDATE project.semilleros SET \n"
                + "nombre = ?,\n"
                + "id_grupo_investigacion = ?\n"
                + "WHERE id = ?;";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.getNombre_s());
            ps.setInt(2, item.getGrupo_in_id());
            ps.setInt(3, item.getId_semi());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Actualización exitosa para el semillero con ID: " + item.getId_semi());
                return true;
            } else {
                System.out.println("No se encontró el semillero con ID: " + item.getId_semi() + " para actualizar.");
                return false;
            }

        } catch (Exception e) {
            System.out.println("Error al actualizar el semillero con ID: " + item.getId_semi() + ". Detalles: " + e.getMessage());
            return false;
        }
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM project.semilleros WHERE id = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                System.out.println("Eliminación exitosa para el semillero con ID: " + id);
                return true;
            } else {
                System.out.println("No se encontró el semillero para eliminar.");
                return false;
            }

        } catch (Exception e) {
            System.out.println("Error al eliminar el semillero. Detalles: " + e.getMessage());
            return false;
        }
    }

}
