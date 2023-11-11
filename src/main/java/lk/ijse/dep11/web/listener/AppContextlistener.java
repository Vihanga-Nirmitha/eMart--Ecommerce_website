package lk.ijse.dep11.web.listener;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.File;
import java.sql.SQLException;

@WebListener
public class AppContextlistener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce){

        String appPath = sce.getServletContext().getRealPath("/");
        new File(appPath, "uploads").mkdir();
        BasicDataSource pool = new BasicDataSource();
        pool.setDriverClassName("com.mysql.cj.jdbc.Driver");
        pool.setUsername("root");
        pool.setPassword("1234");
        pool.setUrl("jdbc:mysql://localhost:3306/shopzy");
        pool.setInitialSize(10);
        pool.setMaxTotal(15);
        sce.getServletContext().setAttribute("connectionpool",pool);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            ((BasicDataSource) sce.getServletContext().getAttribute("connectionpool")).close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
