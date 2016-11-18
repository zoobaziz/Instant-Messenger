<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 13/11/16
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
    <title>LOGIN PAGE</title>
</head>
<body>
<fieldset>
    <h1 align="center">LOGIN</h1>

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
                Cookie ck1 = new Cookie("username", user);
                Cookie ck2 = new Cookie("password", passwd);
                ck1.setMaxAge(60*60*2);
                ck2.setMaxAge(60*60*2);
                response.addCookie(ck1);
                response.addCookie(ck2);

                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/IM", "root", "root");
                    Statement stmt = conn.createStatement();
                    Statement st1 = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE username='"+user+"' and password='"+passwd+"'");
                    int rs1 = st1.executeUpdate("UPDATE users SET log_status = '1' where username='"+user+"'");
                    if (rs.next() && rs1 == 1)
                    {
                        response.sendRedirect("chatting.jsp");
                    }
                    else
                    {
                        %>
                            <script type="text/javascript">
                                alert("INVALID USERNAME AND PASSWORD")
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
<div align="center">
<form>
    NOT A MEMBER ?
    <a href="register.jsp">CLICK HERE</a>
</form>
</div>
</fieldset>
</body>
</html>