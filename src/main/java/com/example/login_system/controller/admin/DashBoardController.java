package com.example.login_system.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.ui.Model;
import com.example.login_system.service.UserService;

@Controller
public class DashBoardController {

    private final UserService userService;

    public DashBoardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        long totalUsers = this.userService.countUsers();
        long totalAdmins = this.userService.countByRoleName("ADMIN");
        long activeAccounts = this.userService.countByEnabled(true);
        long lockedAccounts = this.userService.countByEnabled(false);

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalAdmins", totalAdmins);
        model.addAttribute("activeAccounts", activeAccounts);
        model.addAttribute("lockedAccounts", lockedAccounts);

        return "admin/dashboard/show";
    }
}
