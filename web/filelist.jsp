<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
    Connection conn = null;
    Statement st = null;
    ResultSet result = null;
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
    String id = null;
    id = (String) session.getAttribute("ID");
    if (id != null) {
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File List</title>
    <link href="css/register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/encryption.css">
</head>
<body>
    <header>
        <div class="logo">
            <img class="logo-img" src="images/logo.png">
            <span>Secure Cloud</span>
        </div>
        <div class="navbar">
            <ul class="navlist">
                <li><a href="adminlogin.jsp">Admin Login</a></li>
                <li><a href="userlist.jsp">User List</a></li>
                <li><a href="filelist.jsp">File List</a></li>
            </ul>
        </div>
        <div class="bx bx-menu" id="menu-icon">
        </div>
    </header>
    <div class="box">
        <form class="form">
            <h1 class="form-title">File List</h1>
            <table cellspacing="0" cellpadding="0" align="center" class="body_content">           
                <tr>
                    <td class="content">                    
                        <table cellpadding="2" cellspacing="2" width="100%">   
                            <%
                                String msg = null;
                                msg = (String) session.getAttribute("MSG");
                                if (msg != null) {
                            %>
                            <tr>
                                <td colspan="5" align="center">
                                    <div style="width:100%;color: #3278A3; font-size: 12px;font-weight: bold;" align="center"><%=msg%></div>
                                 </td>
                            </tr>
                            <%
                                    session.removeAttribute("MSG");
                                } else {
                                    session.setAttribute("MSG", "");
    
                                }
                            %>
                            <tr class="heading_lable">
                                <td align="center">S.No</td>                                            
                                <td align="center">User Name</td>
                                <td align="center">File Name</td>
                                <td align="center">Date</td>                                            
                                <td align="center">Delete</td>                                            
                            </tr>
                            <%
                                int i = 0;
                                try {
                                    conn = connection.dbConnection.makeConnection();
                                    String query = "SELECT u.name,f.id,f.file_name,f.created,f.file_path FROM users u, files f WHERE u.userid = f.userid ORDER BY f.id DESC";
                                    st = conn.prepareStatement(query);
                                    result = st.executeQuery(query);
                                    while (result.next()) {
                                        
                                        String username = result.getString(1);
                                        String fileid = result.getString(2);
                                        String fname = result.getString(3);                                    
                                        String adding_date = result.getString(4);
                                        String file_path = result.getString(5);
                                        i++;
                            %>
                            <tr bgcolor="#f9f9f9">
                                <td align="center"><%=i%>.</td>
                                <td><%=username%></td> 
                                <td><%=fname%></td> 
                                <td align="center"><%=adding_date%>.</td>                            
                                <td align="center">
                                    <a href="description?id=<%=fileid%>&filepath=<%=file_path%>" class="cursor">Delete</a>
                                </td>
                            </tr>
                            <%    }
    
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script src="js/nav.js"></script>
</body>
</html>
<%    } else {
    session.setAttribute("MSG", "You must be login.");
    response.sendRedirect("login.jsp");
}
%>%>