    package com.example.demo.controller;

    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.RequestParam;

    @Controller
    public class LoginController {

        @GetMapping("/login")
        public String login(@RequestParam(value = "error", required = false) String error,
                            @RequestParam(value = "logout", required = false) String logout,
                            Model model) {

            if (error != null) {
                model.addAttribute("errorMessage", "Неверное имя пользователя или пароль!");
            }

            if (logout != null) {
                model.addAttribute("successMessage", "Вы успешно вышли из системы!");
            }

            return "login";
        }

        @GetMapping("/")
        public String home() {
            return "index";
        }
    }