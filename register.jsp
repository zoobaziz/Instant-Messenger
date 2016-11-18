<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 17/11/16
  Time: 6:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
</head>
<fieldset>
    <h1 align="center">REGISTER</h1>

        <%
        int state = 0;
        String param = request.getParameter("login");
        if(param!=null)
            state = Integer.parseInt(param);
        switch (state)
        {
            case 0:{
                %>

    <form>
        <div align="center">
            <input type="text" name="username" placeholder="Enter your username"><br><br>
            <input type="password" name="passwd" placeholder="Enter your password"><br><br>
            <button type="button" name="log" onclick="submit()">LOGIN</button><br><br>
            <input type="hidden" name="login" value="1">
        </div>
    </form>
        <%
                break;
            }

            case 1:{

                String user = request.getParameter("username");
                String passwd = request.getParameter("passwd");

                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/IM", "root", "root");
                    Statement stmt = conn.createStatement();
                    Statement st1 = conn.createStatement();
                    int rs = stmt.executeUpdate("INSERT INTO users (username, password, log_status) values('"+user+"','"+passwd+"', '0')");
                    int rs1 = st1.executeUpdate("UPDATE users SET log_status = '1' where username='"+user+"'");
                    if (rs == 1 && rs1 == 1)
                    {
                        response.sendRedirect("chatting.jsp");
                    }
                    else
                    {
                        %>
    <script type="text/javascript">
        alert("COULD REGISTER PLEASE TRY AGAIN");
    </script>
    <form>
        <div align="center">
            <button type="button" onclick="submit()">RETRY</button>
            <input type="hidden" name="login" value="0"/>
        </div>
    </form>
        <%
                    }
                }
                catch (Exception e)
                {
                    out.println(e);
                }
                break;
            }
        }
    %>

</html>
