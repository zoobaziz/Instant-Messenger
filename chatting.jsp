<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 13/11/16
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="java.sql.*"

%>
<%@include file="submit.jsp"%>
<%@include file="logout.jsp"%>
<%! String user;%>
<%
        user = null;
        Cookie[] cookie= request.getCookies();
        if(cookie!=null)
        {
            for (int i=0;i<cookie.length; i++)
            {
                Cookie ck = cookie[i];
                String name = ck.getName();
                if (name.equals("username"))
                    user = ck.getValue();
            }
        }
%>
<html>
<head>
    <title>Chats</title>
    <link rel="stylesheet" href="styles.css">
    <script type="text/javascript">

    /*    function submit() {
            var r = new XMLHttpRequest();
            var msg = document.getElementById("msgs").value;

            r.onreadystatechange = function()
            {
                if(r.readyState == 4 && r.status == 200);
            }
            r.open('POST', 'submit.jsp', true);
            r.send();
        }
      */  function disp() {
            var req = new XMLHttpRequest();
            req.onreadystatechange = function () {
                if(req.readyState == 4 && req.status == 200)
                {
                    document.getElementById("users").innerHTML = req.responseText;
                }
            }
            req.open('GET', 'disp_users.jsp',true);
            req.send();

            var req1 = new XMLHttpRequest();
            req1.onreadystatechange = function () {
                if (req1.readyState == 4 && req1.status == 200)
                {
                    document.getElementById("messages").innerHTML = req1.responseText;
                }
            }
            req1.open('GET', 'disp_msgs.jsp', true);
            req1.send();
        }
      setInterval(function () { disp() }, 5000);

    </script>
</head>
<body onload="disp();">
<div id="container">
<table>
    <tr>
        <th>MESSAGES</th>
        <th>USERS</th>
    </tr>
    <tr>

        <td id="logged_users">
            <div id="chat_box">
            <div id="messages"></div>
            </div>
        </td>

        <td id="msg">
            <div id="user_box">
            <div id="users"></div>
            </div>
        </td>
    </tr>
</table>


<%! int state;%>
    <%
        state = 0;
        String p = request.getParameter("state");
        if(p != null)
            state = Integer.parseInt(p);
        switch (state)
        {
            case 0: {
    %>
        <form>
            <input type="text" name="msgs"  id="msgs" placeholder="Enter Your Message Here"/><br><br>
            <button type="submit" name="send" id="send" onclick="submit()">SEND MESSAGE</button>
            <input type="hidden" name="state" value="1">
        </form>
    <%
            break;
            }
            case 1: {
                String msg = request.getParameter("msgs");
                insert(msg, user);
                %>
                    <form>
                        <button type="submit" id="send" onclick="submit()">NEXT MESSAGE</button>
                        <input type="hidden" value="0" name="state">
                    </form>
                <%
                break;
            }
        }
    %>

    <%
        int s = 0;
        String p1 = request.getParameter("s");
        if(p1 != null)
            s = Integer.parseInt(p1);
        switch(s)
        {
            case 0: {
                %>

        <form>
            <button type="logout" id="send" onclick="submit()">LOGOUT</button>
            <input type="hidden" name="s" value="1">
        </form>

                <%
                break;
            }

                        case 1:
                        {
                            logout(user);
                            response.sendRedirect("index.jsp");
                            break;
                        }
        }
    %>


    </div>

</body>
</html>
