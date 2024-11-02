/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Semilleros;
import modelo.SemillerosDAO;
import modelo.Usuario_U;

/**
 *
 * @author SEBAS
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class Controlador extends HttpServlet {

    Semilleros se = new Semilleros();
    SemillerosDAO seDAO = new SemillerosDAO();
    int id_se;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();
        Usuario_U ss = (Usuario_U) sesion.getAttribute("usuario");
        if (ss != null) {
            if (menu.equals("Principal")) {
                request.getRequestDispatcher("Principal.jsp").forward(request, response);
            }
        } else if (menu.equals("Registrarse")) {
            request.getRequestDispatcher("Registrarse.jsp").forward(request, response);
        } else if (menu.equals("Semilleros")) {
            switch (accion) {
                case "Listar":
                    List lista = seDAO.Listar();
                    request.setAttribute("semilleros", lista);
                    break;
                case "Agregar":

                    String nombre_semi = request.getParameter("txt_nombre");
                    String id_grupo = request.getParameter("txt_GrupoInID");
                    se.setNombre_s(nombre_semi);
                    se.setGrupo_in_id(Integer.parseInt(id_grupo));
                    seDAO.registrar(se);
                    request.getRequestDispatcher("Controlador?menu=Semilleros&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    id_se = Integer.parseInt(request.getParameter("id_s"));
                    Semilleros s = seDAO.listarId(id_se);
                    request.setAttribute("semillero", s);
                    request.getRequestDispatcher("Controlador?menu=Semilleros&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    int seID = Integer.parseInt(request.getParameter("txt_IdSemi"));
                    String nombre_S = request.getParameter("txt_nombre");
                    int G_ID = Integer.parseInt(request.getParameter("txt_GrupoInID"));
                    se.setId_semi(seID);
                    se.setNombre_s(nombre_S);
                    se.setGrupo_in_id(G_ID);
                    seDAO.actualizar(se);
                    request.getRequestDispatcher("Controlador?menu=Semilleros&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":

                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Semilleros.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("Bloqueo.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
