package com.example.login_system.controller.admin;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.login_system.domain.User;
import com.example.login_system.repository.UserRepository;
import com.example.login_system.service.UserService;
import com.example.login_system.service.UploadService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UserRepository userRepository;
    private final UploadService uploadService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private PasswordEncoder PasswordEncoder;

    public UserController(UserService userService, UserRepository userRepository, UploadService uploadService) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.uploadService = uploadService;
    }

    // @GetMapping("/")
    // public String getHomePage(Model model, @PathVariable long id) {
    // User user = this.userService.getUserById(id);
    // model.addAttribute("user", user);
    // model.addAttribute("id", id);
    // return "client/homepage/dashboard/show";
    // }

    @GetMapping("/")
    public String getHomePage(Model model, Principal principal) {
        if (principal != null) {
            String email = principal.getName(); // Lấy email người đang login
            User currentUser = this.userService.getUserByEmail(email);
            model.addAttribute("user", currentUser); // Nạp nguyên cục user vào đây
        }
        return "client/homepage/dashboard/show";
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/show";

    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";

    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // @PostMapping("/admin/user/create")
    // public String createUserPage(Model model, @ModelAttribute("newUser") User
    // hoidanit) {
    // // this.userService.handleSaveUser(hoidanit);
    // return "redirect:/admin/user";

    // }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User hoidanit,
            BindingResult newUserBindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.PasswordEncoder.encode(hoidanit.getPassword());
        hoidanit.setAvatar(avatar);
        hoidanit.setPassword(hashPassword);
        hoidanit.setRole(this.userService.getRoleByName(hoidanit.getRole().getName()));
        this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";

    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";

    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/delete";

    }

    @PostMapping("/admin/user/delete")
    public String posDeleteteUser(Model model, @ModelAttribute("newUser") User user) {
        model.addAttribute("newUser", new User());
        this.userService.deleteAUser(user.getId());
        return "redirect:/admin/user";

    }

    @GetMapping("/change-password")
    public String showChangePasswordPage() {
        return "client/homepage/user/change-password";
    }

    @PostMapping("/change-password")
    public String changePassword(
            @RequestParam String oldPassword,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            Principal principal,
            Model model) {

        String email = principal.getName(); // user đang login
        User user = userService.getUserByEmail(email);

        // check mật khẩu cũ
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            model.addAttribute("error", "Mật khẩu cũ không đúng");
            return "client/homepage/user/change-password";
        }

        // check confirm
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu xác nhận không khớp");
            return "client/homepage/user/change-password";
        }

        // cập nhật mật khẩu mới
        user.setPassword(passwordEncoder.encode(newPassword));
        userService.handleSaveUser(user);

        model.addAttribute("success", "Đổi mật khẩu thành công");
        return "client/homepage/user/change-password";
    }

    // @GetMapping("/update/{id}")
    // public String getUpdate(Model model, @PathVariable long id) {
    // User currentUser = this.userService.getUserById(id);
    // model.addAttribute("newUser", currentUser);
    // return "client/homepage/user/update";

    // }

    // @PostMapping("/update")
    // public String postUpdate(Model model, @ModelAttribute("newUser") User user) {
    // User currentUser = this.userService.getUserById(user.getId());
    // if (currentUser != null) {
    // currentUser.setAddress(user.getAddress());
    // currentUser.setFullName(user.getFullName());
    // currentUser.setPhone(user.getPhone());
    // this.userService.handleSaveUser(currentUser);
    // }
    // return "redirect:/";

    // }

    @GetMapping("/update/{id}")
    public String getUpdate(Model model, @PathVariable long id, Principal principal) {
        // 1. Lấy thông tin user đang đăng nhập qua session (Email)
        String email = principal.getName();
        User loginUser = this.userService.getUserByEmail(email);

        // 2. Kiểm tra: Nếu ID trên URL khác với ID của người đang login thì chặn lại
        if (loginUser == null || loginUser.getId() != id) {
            return "auth/deny"; // Hoặc redirect về "/"
        }

        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "client/homepage/user/update";
    }

    @PostMapping("/update")
    public String postUpdate(Model model, @ModelAttribute("newUser") User user, Principal principal) {
        // 1. Lấy user thực sự đang đăng nhập
        String email = principal.getName();
        User loginUser = this.userService.getUserByEmail(email);

        // 2. Chỉ cho phép update nếu ID trùng khớp với loginUser
        if (loginUser != null && loginUser.getId() == user.getId()) {
            User currentUser = this.userService.getUserById(user.getId());
            if (currentUser != null) {
                currentUser.setAddress(user.getAddress());
                currentUser.setFullName(user.getFullName());
                currentUser.setPhone(user.getPhone());
                this.userService.handleSaveUser(currentUser);
            }
        } else {
            // Hành động giả mạo ID hoặc lỗi session
            return "redirect:/login";
        }

        return "redirect:/";
    }

}
