package com.example.login_system.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.login_system.domain.User;
import com.example.login_system.service.UserService;

@ControllerAdvice
public class GlobalControllerAdvice {

    @Autowired
    private UserService userService;

    @ModelAttribute("currentUser")
    public User populateCurrentUser(Principal principal) {
        if (principal != null) {
            return this.userService.getUserByEmail(principal.getName());
        }
        return null;
    }
}
