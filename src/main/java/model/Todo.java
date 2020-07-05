package model;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Todo {

    private long id;
    private String title;
    private Date deadLine;
    private model.TodoStatus status;
//    private User user;
    private Date createdDate;

}
