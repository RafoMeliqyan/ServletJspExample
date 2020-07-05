<%@ page import="model.Todo" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User page</title>
</head>
<body>
<%
    List<Todo> todos = (List<Todo>) request.getAttribute("todos");
    User user = (User) session.getAttribute("user");
%>
Welcome <%=user.getName()%> <br>
<% if (user.getPictureUrl() != null) { %>
<img src="/image?path=<%=user.getPictureUrl()%>" width="70"/> <% } %> <br>
<a href="/logout">Logout</a> <br>
<a href="/">Index</a> <br> <br>

<div id="info">

</div>
<div id="todoList">
    Loading...
</div>

Add Todo:
<form action="/addTodo" method="post" id="addTodo">
    <input name="title" id="title" type="text" placeholder="name"/> <br>
    <input name="deadline" id="deadline" type="date"/> <br>
    <input type="submit" value="create">
</form>

<script src="/js/jquery.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {

        $("#addTodo").submit(function (e) {
            e.preventDefault();
            let title = $("#title").val();
            let deadline = $("#deadline").val();

            $.ajax({
                url: "/addTodo?title=" + title + "&deadline=" + deadline,
                method: "POST",
                success: function (result) {
                    $("#info").html(result)
                    $("#title").val("");
                    $("#deadline").val("");
                },
                error: function () {
                    $("#info").html("there is problem with todo data.!");
                }
            });
        })

        let getTodoList = function () {
            $.ajax({
                url: "/todoList",
                method: "GET",
                success: function (result) {
                    $("#todoList").html(result)
                }
            });
        }
        getTodoList();
        setInterval(getTodoList, 2000)
    })
</script>

</body>
</html>
