package com.example.demo.service;

import com.example.demo.dto.UserRegistrationDto;
import com.example.demo.entity.Role;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    public User registerUser(UserRegistrationDto dto) {
        if (userRepository.existsByUsername(dto.getUsername())) {
            throw new RuntimeException("Користувач з таким ім'ям вже існує");
        }

        User user = new User();
        user.setUsername(dto.getUsername());

        String encodedPassword = passwordEncoder.encode(dto.getPassword());
        user.setPassword(encodedPassword);

        user.setRole(Role.USER);

        return userRepository.save(user);
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Користувач не знайдений"));
    }

    public boolean checkPassword(String rawPassword, String encodedPassword) {
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }
}