package lk.ijse.dep11.web;

import lk.ijse.dep11.web.tm.Item;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;

@WebServlet("/item")
public class ItemPreviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemid = req.getParameter("itemid");
        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
        try(Connection connection = pool.getConnection()) {
            Item preview = null;
            PreparedStatement stm = connection.prepareStatement("SELECT * FROM item WHERE itemid = ?");
            stm.setString(1,itemid);
           ResultSet rst =  stm.executeQuery();
            if(rst.next()){
                String id = rst.getString("itemid");
                String title = rst.getString("title");
                String model = rst.getString("model");
                String brand = rst.getString("brand");
                String price = rst.getString("price");
                int qty = Integer.parseInt(rst.getString("qty"));
                int sold = Integer.parseInt(rst.getString("sold"));
                Date date = rst.getDate("date");
                String rating = rst.getString("rating");
                String path1 = rst.getString("image1");
                String path2 = rst.getString("image2");
                String path3 = rst.getString("image3");
                String path4 = rst.getString("image4");
                String path5 = rst.getString("image5");
                preview = new Item(id,title,model,brand,price,qty,sold,date,rating,path1,path2,path3,path4,path5);
            }else {

            }
            req.setAttribute("preview",preview);
            getServletContext().getRequestDispatcher("/item.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
