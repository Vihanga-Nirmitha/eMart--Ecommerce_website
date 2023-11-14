package lk.ijse.dep11.web;

import lk.ijse.dep11.web.tm.ItemPrew;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/products")
@MultipartConfig(location = "/tmp")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ItemPrew> itemList = new ArrayList<>();
        String category1 = (req.getParameter("category1")!=null)? "Electronics": "";
        String category2 = (req.getParameter("category2")!=null)? "Sports": "";
        String category3 = (req.getParameter("category3")!=null)? "Fashion": "";
        String category4 = (req.getParameter("category4")!=null)? "Home & Garden": "";
        String category5 = (req.getParameter("category5")!=null)? "Kid's Items": "";
        String min_price = (req.getParameter("min-price").equals(""))? "0": req.getParameter("min-price");
        String max_price = (req.getParameter("max-price").equals(""))? "100000": req.getParameter("max-price");
        System.out.println(req.getParameter("sort"));
         if((category1.equals(category2)) && (category1.equals(category3)) && (category1.equals(category4)) && (category1.equals(category5))){
             category1 = "Electronics";
             category2 ="Sports";
             category3="Fashion";
             category4="Home & Garden";
             category5="Kid's Items";
         }
        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
        try( Connection connection = pool.getConnection()) {
            PreparedStatement stm = connection.prepareStatement("SELECT * FROM item WHERE price < ? AND price > ? AND (category = ? OR category = ? OR category = ? OR category = ? OR category = ? )");
           stm.setString(1,max_price);
            stm.setString(2,min_price);
            stm.setString(3,category1);
            stm.setString(4,category2);
            stm.setString(5,category3);
            stm.setString(6,category4);
            stm.setString(7,category5);
            ResultSet rst = stm.executeQuery();

            while (rst.next()){
                int itemid = rst.getInt("itemid");
                String title  = rst.getString("title");
                String path = rst.getString("image1");
                String rating = rst.getString("rating");
                String price = rst.getString("price");
                itemList.add(new ItemPrew(itemid,title,price,path,rating));

            }
            req.setAttribute("itemList",itemList);
            getServletContext().getRequestDispatcher("/product.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
