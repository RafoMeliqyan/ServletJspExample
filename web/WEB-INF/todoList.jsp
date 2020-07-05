<%@ page import="model.Todo" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Todo> todos = (List<Todo>) request.getAttribute("todos");
%>

<ul>
    <% for (Todo todo : todos) { %>
    <li><a href="/todo?id=<%=todo.getId()%>"><%=todo.getTitle()%></a> - <%=todo.getStatus()%> - <%=todo.getCreatedDate()%>
    </li>
    <% } %>
</ul>