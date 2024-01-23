package com.example.todo.todoapi.entity;

import com.example.todo.userapi.entity.User;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDateTime;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString @EqualsAndHashCode(of = "todoId")
@Entity
@Table(name = "tbl_todo")
@Builder
public class Todo {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid",strategy = "uuid")
    private String todoId;

    @Column(nullable = false, length = 30)
    private String title;

    private boolean done;

    @CreationTimestamp
    private LocalDateTime createDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;


}
