package lk.ijse.dep11.web;

import lk.ijse.dep11.web.tm.ItemPrew;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/index",""})
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid = (String) req.getSession().getAttribute("userid");
        List<ItemPrew> featuredList = new ArrayList<>();
        List<ItemPrew> latestList = new ArrayList<>();
        List<ItemPrew> recentList = new ArrayList<>();

        int featcount = 0;
        int latestcount =0;
        int recentcount =0;
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
            ResultSet rstrecent = featuredstm.executeQuery("SELECT * FROM item ORDER BY date DESC");
            while (rstrecent.next() && latestcount<5){
                latestcount++;
                int itemid = rstrecent.getInt("itemid");
                String title  = rstrecent.getString("title");
                String path = rstrecent.getString("image1");
                String rating = rstrecent.getString("rating");
                String price = rstrecent.getString("price");
                latestList.add(new ItemPrew(itemid,title,price,path,rating));

            }
            PreparedStatement stm = connection.prepareStatement("SELECT * FROM item as i INNER JOIN (SELECT date,itemid FROM view WHERE userid = ?) as v on v.itemid = i.itemid ORDER BY v.date DESC");
            stm.setString(1,userid);
            ResultSet rstlatest = stm.executeQuery();
            while (rstlatest.next() && recentcount<5){
                recentcount++;
                int itemid = rstlatest.getInt("i.itemid");
                String title  = rstlatest.getString("title");
                String path = rstlatest.getString("image1");
                String rating = rstlatest.getString("rating");
                String price = rstlatest.getString("price");
                recentList.add(new ItemPrew(itemid,title,price,path,rating));

            }
            req.setAttribute("recentList",recentList);
            req.setAttribute("featuredList",featuredList);
            req.setAttribute("latestList",latestList);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
