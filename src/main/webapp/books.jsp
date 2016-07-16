<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- //[START imports]--%>
<%@ page import="com.github.toubou91.favboox.Book" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%-- //[END imports]--%>

<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<body>

<%-- //[START datastore]--%>
<%

    // Running a query to retrieve all the existing books in datastore.
      List<Book> books
      = ObjectifyService.ofy()
          .load()
          .type(Book.class) // We want only Books.
          .order("-date")   // Most recent first - date is indexed.
          .list();

    if (books.isEmpty()) {
%>
<p>No favorite books have been added yet.</p>
<%
    } else {
      // List all books.
        for (Book book : books) {
            pageContext.setAttribute("book_content", book.title);
            
%>
<blockquote style='font-family: "Times New Roman", Times, serif;'>
	${fn:escapeXml(book_content)}
</blockquote>
<%
        }
    }
%>

</body>
</html>
