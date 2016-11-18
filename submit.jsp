<%--
      Created by IntelliJ IDEA.
      User: neo
      Date: 17/11/16
      Time: 7:37 PM
      To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@page import="java.sql.*"%>

    <%!
        void insert(String message, String user)
        {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/IM", "root", "root");
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("INSERT INTO inbox (username, message) values ('"+user+"','"+message+"')");
        }
        catch (Exception e)
        {
        }
        }
    %>