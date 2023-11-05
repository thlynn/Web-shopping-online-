/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import model.Customer;

/**
 *
 * @author dell
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/signup"})
public class SignUpServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
        DAO d = new DAO();
        try {
            String user_raw = request.getParameter("user");
            String pass_raw = request.getParameter("pass");
            String name_raw = request.getParameter("name");
            String role_raw = request.getParameter("role");

            // Kiểm tra xem tên khách hàng đã tồn tại chưa
            if (!d.checkCustomerName(user_raw)) {
                // Kiểm tra xem vai trò có phải là "admin" hoặc "user" không
                if ("admin".equals(role_raw) || "user".equals(role_raw)) {
                    // Tạo một khách hàng mới và chèn vào cơ sở dữ liệu
                    Customer cNew = new Customer(name_raw, user_raw, pass_raw, role_raw);
                    d.insert(cNew);
                    request.setAttribute("accountNew", cNew);
                    request.getRequestDispatcher("success.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Please enter 'admin' or 'user' for the role.");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
            } else {
                // Tên khách hàng đã tồn tại
                request.setAttribute("error", "Username '" + user_raw + "' already exists!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            // Xử lý ngoại lệ NumberFormatException
            request.setAttribute("error", "Invalid Username format");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
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
