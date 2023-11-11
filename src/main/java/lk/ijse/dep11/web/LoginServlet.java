package lk.ijse.dep11.web;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
        try(Connection connection = pool.getConnection()) {
            PreparedStatement stm = connection.prepareStatement("SELECT userid , password FROM user WHERE username=?");
            stm.setString(1,email);
           ResultSet rst = stm.executeQuery();
            if(rst.next()){
                if(rst.getString("password").equals(password)){
                    HttpSession session = req.getSession();
                    if(remember!=null){
                        String header = resp.getHeader("Set-Cookie");
                        header += "; Max-Age="+(60*60);
                        resp.setHeader("Set-Cookie",header);
                    }
                    Cookie shopzycokie = new Cookie("shopzy", "shopzy");
                    session.setMaxInactiveInterval(30);
                    session.setAttribute("userid",rst.getString("userid"));
                    resp.sendRedirect(req.getContextPath());

                }else{
                    req.setAttribute("denied", true);
                    getServletContext().getRequestDispatcher("/login.jsp").forward(req,resp);
                }

            }else {
                req.setAttribute("denied", true);
                getServletContext().getRequestDispatcher("/login.jsp").forward(req,resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
