package servlet;

import manager.TodoManager;
import model.Todo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/todoList")
public class TodoListServlet extends HttpServlet {
    //todoManager
    TodoManager todoManager = new TodoManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Todo> all = todoManager.getAll();
        req.setAttribute("todos", all);
        req.getRequestDispatcher("/WEB-INF/todoList.jsp").forward(req, resp);
    }
}
