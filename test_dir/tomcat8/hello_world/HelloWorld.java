import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWorld extends HttpServlet {
public void doGet(HttpServletRequest request,
HttpServletResponse response)
throws IOException, ServletException
{

PrintWriter out = response.getWriter();
out.println("<html>");
out.println("HelloWorld");
out.println("</html>");
out.close();
}
}
