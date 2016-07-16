package com.github.toubou91.favboox;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

/**
 * Form Handling Servlet
 * Most of the action for this sample is in webapp/books.jsp, which displays the
 * {@link Book}'s. This servlet has one method
 * {@link #doPost(<#HttpServletRequest req#>, <#HttpServletResponse resp#>)} which takes the form
 * data and saves it.
 */
public class BookServlet extends HttpServlet {

  // Process the http POST of the form
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    
    String content = req.getParameter("content");
    Book book =  new Book(content);

    // Use Objectify to save the book and now() is used to make the call synchronously as we
    // will immediately redirect to a new page and we want the data to be present.
    ObjectifyService.ofy().save().entity(book).now();

    resp.sendRedirect("/books.jsp");
  }
}