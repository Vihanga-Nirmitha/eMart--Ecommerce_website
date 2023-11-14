package lk.ijse.dep11.web;

import lk.ijse.dep11.web.tm.ItemPrew;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/index","/",""})
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ItemPrew> featuredList = new ArrayList<>();
        List<ItemPrew> latestList = new ArrayList<>();
        int featcount = 0;
        int latestcount =0;
        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
        try(Connection  connection = pool.getConnection()) {
            Statement featuredstm = connection.createStatement();
            ResultSet rstfeatured = featuredstm.executeQuery("SELECT * FROM item ORDER BY sold DESC");

            while (rstfeatured.next() && featcount<5){
                featcount++;
                int itemid = rstfeatured.getInt("itemid");
                String title  = rstfeatured.getString("title");
                String path = rstfeatured.getString("image1");
                String rating = rstfeatured.getString("rating");
                String price = rstfeatured.getString("price");
                featuredList.add(new ItemPrew(itemid,title,price,path,rating));

            }
            ResultSet rstlatest = featuredstm.executeQuery("SELECT * FROM item ORDER BY date DESC");
            while (rstlatest.next() && latestcount<5){
                latestcount++;
                int itemid = rstlatest.getInt("itemid");
                String title  = rstlatest.getString("title");
                String path = rstlatest.getString("image1");
                String rating = rstlatest.getString("rating");
                String price = rstlatest.getString("price");
                latestList.add(new ItemPrew(itemid,title,price,path,rating));

            }
            req.setAttribute("featuredList",featuredList);
            req.setAttribute("latestList",latestList);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
