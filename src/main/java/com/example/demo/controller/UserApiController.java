package com.example.demo.controller;

import com.example.demo.dto.UserRegistrationDto;
import com.example.demo.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/api")
public class UserApiController {

    private final UserService userService;

    @Autowired
    public UserApiController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute UserRegistrationDto userDto,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("error",
                    "Будь-ласка, виправте помилки в формі");
            redirectAttributes.addFlashAttribute("userDto", userDto);
            return "redirect:/register";
        }

        if (!userDto.isPasswordMatch()) {
            redirectAttributes.addFlashAttribute("error", "Паролі не співпадають");
            redirectAttributes.addFlashAttribute("userDto", userDto);
            return "redirect:/register";
        }

        try {
            userService.registerUser(userDto);
            redirectAttributes.addFlashAttribute("success",
                    "Користувач успішно зареєстрований!");
            return "redirect:/register";
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            redirectAttributes.addFlashAttribute("userDto", userDto);
            return "redirect:/register";
        }
    }
}