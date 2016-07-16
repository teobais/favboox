<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.github.toubou91.favboox.Book" %>

<html>
<body>

<form action="/books" method="post">
    <div><textarea name="content" rows="3" cols="60"></textarea></div>
    <div><input type="submit" value="Submit"/></div>
</form>

</body>
</html>