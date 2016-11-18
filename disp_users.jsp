<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 17/11/16
  Time: 5:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%@page import="java.sql.*"
%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/IM", "root", "root");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT username FROM users WHERE log_status = 1 ");
        while(rs.next())
        {
            String user = rs.getString(1);
            %>

                <div id="user">
                    <% out.print(user); %>
                </div>

            <%
        }
    }
    catch (Exception e)
    {
        System.out.println(e);
    }
%>


</body>
</html>
