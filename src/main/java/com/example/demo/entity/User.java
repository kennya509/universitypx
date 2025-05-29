package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    @NotBlank(message = "Ім'я користувача обов'язкове")
    @Size(min = 3, max = 50, message = "Ім'я користувача повинно містити від 3 до 50 символів")
    private String username;

    @Column(nullable = false)
    @NotBlank(message = "Пароль обов'язковий")
    @Size(min = 6, message = "Пароль повинен містити мінімум 6 символів")
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role = Role.USER;

    public User() {}

    public User(String username, String password, Role role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }

    @Override
    public String toString() {
        return "User{id=" + id + ", username='" + username + "', role=" + role + "}";
    }
}