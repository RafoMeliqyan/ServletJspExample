package servlet;

import manager.TodoManager;
import model.Todo;
import model.TodoStatus;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = "/addTodo")
public class AddTodoServlet extends HttpServlet {

    TodoManager todoManager = new TodoManager();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String deadline = req.getParameter("deadline");
        Todo todo = null;
        try {
            todo = Todo.builder()
                    .title(title)
                    .deadLine(sdf.parse(deadline))
                    .status(TodoStatus.TODO)
                    .build();
            todoManager.create(todo);
            resp.getWriter().write("Todo added successfully");
        } catch (ParseException e) {
            throw new RuntimeException("error");
        }
    }
}
