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
import java.sql.SQLException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
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
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else{
            //notequals
        }

    }
}
