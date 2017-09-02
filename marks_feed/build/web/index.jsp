<%-- 
    Document   : login
    Created on : July 19, 2017, 3:01:18 PM
    Author     : Manvith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <form name="frm" method="post" action="login.jsp" >
                <label>Username</label>
                <input type="text" size="20" id="username" name="username"/><br />
                <label>Password</label>
                <input type="password" size="20" id="password" name="pwd"/><br />
                <input type="hidden" name="hdnbt" />
                <input id="submit" type="submit" value="Log In As Faculty" onclick="{document.frm.hdnbt.value=this.value;document.frm.submit();}"/>
                <input id="submit" type="submit" value="Log In As Hod" onclick="{document.frm.hdnbt.value=this.value;document.frm.submit();}"/>
            </form>
        </div>
    </body>
</html>
