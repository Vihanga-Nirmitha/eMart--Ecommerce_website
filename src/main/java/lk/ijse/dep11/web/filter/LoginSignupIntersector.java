package lk.ijse.dep11.web.filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter({"/login.jsp","/signup.jsp"})
public class LoginSignupIntersector extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if(req.getSession(false) != null){
            res.sendRedirect(req.getContextPath());
        }else {
            chain.doFilter(req,res);
        }
    }
}