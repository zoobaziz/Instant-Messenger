<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 17/11/16
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    void logout(String username)
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/IM", "root", "root");
            Statement st = conn.createStatement();
            st.executeUpdate("UPDATE users SET log_status = '0' where username='"+user+"'");
        }
        catch (Exception e){}
    }
%>