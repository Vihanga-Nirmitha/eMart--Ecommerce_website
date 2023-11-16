package lk.ijse.dep11.web;

import lk.ijse.dep11.web.tm.Feedback;
import lk.ijse.dep11.web.tm.Item;
import org.apache.commons.codec.digest.DigestUtils;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/item")
public class ItemPreviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Feedback> feedbackList = new ArrayList<>();
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
                String description = rst.getString("description");
                preview = new Item(id,title,model,brand,price,qty,sold,date,rating,path1,path2,path3,path4,path5,description);

            }else {

            }

            req.setAttribute("preview",preview);
//            getServletContext().getRequestDispatcher("/item.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try(Connection connection = pool.getConnection()) {
            PreparedStatement stm = connection.prepareStatement("SELECT cokieid FROM view WHERE itemid = ? AND  userid =?");
            stm.setString(1,itemid);
            stm.setString(2, (String) req.getSession().getAttribute("userid"));
            ResultSet rst = stm.executeQuery();
            boolean sessionactive =false;
            while (rst.next()){
                if(rst.getString("cokieid").equals(DigestUtils.sha256Hex(req.getSession().getId()))){
                    sessionactive = true;
                }
            }
            if(!sessionactive)doPost(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try(Connection connection = pool.getConnection()) {
            PreparedStatement stmfeed = connection.prepareStatement("SELECT * FROM (SELECT * FROM feedback WHERE itemid = ?) as f INNER JOIN user as u on f.userid = u.userid");
            stmfeed.setString(1,itemid);
            ResultSet rst = stmfeed.executeQuery();
            while (rst.next()){

                String feedback = rst.getString("feedbackid");
                String itemId = rst.getString("itemid");
                String username = rst.getString("first_name");
                String comment = rst.getString("comment");
                int rating = rst.getInt("rating");
                Date date = rst.getDate("date");
                feedbackList.add(new Feedback(feedback,itemid,username,comment,rating,date));

            }
            req.setAttribute("feedbackList",feedbackList);
            getServletContext().getRequestDispatcher("/item.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemid = req.getParameter("itemid");
        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
        try(Connection connection = pool.getConnection()) {
            PreparedStatement stm = connection.prepareStatement("INSERT INTO view (itemid, date, userid,cokieid) VALUES (?,?,?,?)");
            stm.setString(1,itemid);
            stm.setString(2,String.valueOf(LocalDateTime.now()));
            stm.setString(3, (String) req.getSession().getAttribute("userid"));
            stm.setString(4 , DigestUtils.sha256Hex(req.getSession().getId()));

            stm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
