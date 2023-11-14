package lk.ijse.dep11.web;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet("/list")
@MultipartConfig(location = "/tmp")
public class AddListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] categorylist = {"Electronics","Sports","Fashion","Home & Garden","Kid's Items"};
        String title =req.getParameter("title");
        String category =categorylist[Integer.parseInt(req.getParameter("inlineRadioOptions").substring(6,req.getParameter("inlineRadioOptions").length()))-1] ;
        String brand =req.getParameter("brand");
        String model =req.getParameter("model");
        String price =req.getParameter("price");
        String qty =req.getParameter("qty");
        String desctription =req.getParameter("description");
        List<Part> parts = new ArrayList<>();
        for (Part part : req.getParts()) {
            if (part.getSubmittedFileName() != null) {
                parts.add(part);
            }
        }

        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
        try(Connection connection = pool.getConnection()) {
            connection.setAutoCommit(false);
            String uploadsDirPath = getServletContext().getRealPath("/uploads/");
            int index = 0;
            List<String> picpaths = new ArrayList<>();
            List<String> pathlist = new ArrayList<>();
            for (Part part : parts) {
                if(part.getSize()>0){
                    index++;
                    UUID imageID = UUID.randomUUID();
                    String picturePath = uploadsDirPath + imageID;
                    picpaths.add(picturePath);
                    pathlist.add("uploads/"+imageID);
                }
            }
            while (index<6){
                index++;
                pathlist.add(null);

            }
            PreparedStatement stm = connection.prepareStatement("INSERT INTO item ( title, category, price, brand, model, qty, image1, image2, image3, image4, image5, description, date) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
            stm.setString(1,title);
            stm.setString(2,category);
            stm.setString(3,price);
            stm.setString(4,brand);
            stm.setString(5,model);
            stm.setString(6,qty);
            stm.setString(7,pathlist.get(0));
            stm.setString(8,pathlist.get(1));
            stm.setString(9,pathlist.get(2));
            stm.setString(10,pathlist.get(3));
            stm.setString(11,pathlist.get(4));
            stm.setString(12,desctription);
            stm.setString(13, String.valueOf(LocalDateTime.now()));

            stm.executeUpdate();
            int index2 = 0;
            for (String picpath : picpaths) {
                parts.get(index2).write(picpath);
                index2++;
            }
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("/app/list.jsp");
    }
}
