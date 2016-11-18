<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 18/11/16
  Time: 7:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%! int state;
    String user;
%>
<html>
<head>
    <title>ADMIN AUTHORITIES</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<fieldset>

    <%
        state = 0;
        String p = request.getParameter("state");
        if(p != null)
            state = Integer.parseInt(p);

        switch (state)
        {
            case 0:
            {
                %>
                    <h1 align="center">LOGIN</h1>
    <form>
        <div align="center">
            <input type="text" name="username" placeholder="Enter your username"><br><br>
            <input type="password" name="passwd" placeholder="Enter your password"><br><br>
            <button type="button" name="log" onclick="submit()">LOGIN</button><br><br>
            <input type="hidden" name="state" value="1">
        </div>
    </form>
                <%
                break;
            }

            case 1:
            {
                user = request.getParameter("username");
                String pass = request.getParameter("passwd");
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/IM", "root","root");
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM admin WHERE username='"+user+"' AND password='"+pass+"'");
                    if(rs.next())
                    {
                        %>
                            <form>
                                <div align="center">
                                <h1> Delete a USER </h1>
                                <input type="text" name="user"><br><br>
                                <button type="button" onclick="submit()">DELETE USER</button><br><br>
                                <input type="hidden" name="state" value="2">
                                </div>
                            </form>
                        <%
                    }
                }
                catch (Exception e)
                {
                    out.print(e);
                }
                break;
            }

            case 2:
            {
                String user = request.getParameter("user");
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/IM", "root","root");
                    Statement st = conn.createStatement();
                    int rs = st.executeUpdate("DELETE FROM users WHERE username='"+user+"'");
                    if(rs == 1)
                    {
                        %>
                            <form>
                                <div align="center">
                                <h1> USER HAS BEEN DELETED</h1>
                                <h3>DO YOU WANT TO DELETE ANOTHER USER CLICK</h3><br><br>
                                <button type="button" onclick="submit()">GO BACK</button><br><br>
                                <input type="hidden" name="state" value="3">
                                </div>
                            </form>
                        <%
                    }
                }
                catch (Exception e)
                {
                    out.print(e);
                }
                break;
            }
                                case 3:
                                {
                                    response.sendRedirect("admin.jsp");
                                    break;
                                }
        }

    %>

<h3 align="center">GO BACK TO <a href="index.jsp">LOGIN PAGE</a></h3>

</fieldset>

</body>
</html>
