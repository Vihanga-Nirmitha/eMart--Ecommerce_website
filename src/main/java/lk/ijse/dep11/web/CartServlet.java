package lk.ijse.dep11.web;

import lk.ijse.dep11.web.tm.CartItem;
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

@WebServlet("/cart")
public class CartServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CartItem> cartList = new ArrayList<>();
        String user_id = (String) req.getSession().getAttribute("userid");
        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
        try(Connection connection =  pool.getConnection()) {
            PreparedStatement stm = connection.prepareStatement("SELECT i.itemid,i.price,i.image1,i.title,i.brand,i.model,c.qty  FROM item AS i INNER JOIN cartitem AS c on i.itemid = c.itemid WHERE c.userid = ?");
            stm.setString(1,user_id);
            ResultSet rst = stm.executeQuery();
            while (rst.next()){
                System.out.println("A");
                int itemid = rst.getInt("itemid");
                String path = rst.getString("image1");
                String title = rst.getString("title");
                String model = rst.getString("model");
                String brand = rst.getString("brand");
                int qty = rst.getInt("qty");
                double price = rst.getDouble("price");
                cartList.add(new CartItem(itemid,title,price,path,model,brand,qty));
            }
            req.setAttribute("cartList",cartList);
            getServletContext().getRequestDispatcher("/cart.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String user_id = (String) req.getSession().getAttribute("userid");
        String item_id = req.getParameter("itemid");
        double price = Double.parseDouble(req.getParameter("price"));
        int qty = Integer.parseInt(req.getParameter("qty"));
        BasicDataSource pool = (BasicDataSource) getServletContext().getAttribute("connectionpool");
        try(Connection connection =  pool.getConnection()) {
            PreparedStatement stm = connection.prepareStatement("SELECT * FROM cartitem WHERE itemid = ? AND userid = ?");
            stm.setString(1,item_id);
            stm.setString(2,user_id);
            if(stm.executeQuery().next()){

            }else{
                try(Connection connection2 = pool.getConnection()){
                    PreparedStatement stminsert = connection2.prepareStatement("INSERT INTO cartitem (userid, itemid, price, qty) values (?,?,?,?)");
                    stminsert.setString(1,user_id);
                    stminsert.setString(2,item_id);
                    stminsert.setDouble(3,price);
                    stminsert.setInt(4,qty);
                    stminsert.executeUpdate();

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }
}
