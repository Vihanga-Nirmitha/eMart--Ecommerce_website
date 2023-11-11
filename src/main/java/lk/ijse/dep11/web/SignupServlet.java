package lk.ijse.dep11.web;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/signup.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String conf_password = req.getParameter("conf-password");
        if(password.equals(conf_password)){
            BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
            try(Connection connection = pool.getConnection()){
                PreparedStatement existstm = connection.prepareStatement("SELECT * FROM user WHERE username = ?");
                existstm.setString(1,email);
                if(existstm.executeQuery().next()){
                    req.setAttribute("duplicateemail",true);
                    getServletContext().getRequestDispatcher("/signup.jsp").forward(req,resp);
                    return;
                }
                PreparedStatement countstm = connection.prepareStatement("SELECT COUNT(*) AS row_count FROM user");
                ResultSet rstcount = countstm.executeQuery();
                rstcount.next();
                int count = 1+ Integer.valueOf(rstcount.getString("row_count"));
                String id = String.format("%05d",count);
                PreparedStatement stm = connection.prepareStatement("INSERT INTO user (userid, password, first_name, username) VALUES (?,?,?,?)");
                stm.setString(1,"D"+id);
                stm.setString(4,email);
                stm.setString(2,password);
                stm.setString(3,name);
                stm.executeUpdate();
                req.setAttribute("created",true);
                getServletContext().getRequestDispatcher("/login.jsp").forward(req,resp);



            } catch (SQLException e) {
                req.setAttribute("error",false);
                getServletContext().getRequestDispatcher("/signup.jsp").forward(req,resp);
            }
            req.setAttribute("created",true);
            getServletContext().getRequestDispatcher("/login.jsp").forward(req,resp);
        }else{
            req.setAttribute("mismatch",true);
            getServletContext().getRequestDispatcher("/signup.jsp").forward(req,resp);
        }

    }
}
