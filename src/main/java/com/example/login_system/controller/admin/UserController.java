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

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    public String getUserPage(Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(required = false) String keyword) {
        int pageSize = 5;
        Pageable pageable = PageRequest.of(page - 1, pageSize);
        Page<User> userPage;

        if (keyword != null && !keyword.trim().isEmpty()) {
            userPage = this.userService.getUsersWithSearch(keyword.trim(), pageable);
        } else {
            userPage = this.userService.getAllUsers(pageable);
        }

        model.addAttribute("userPage", userPage);
        model.addAttribute("users1", userPage.getContent());
        model.addAttribute("keyword", keyword);
        return "admin/user/show";

    }

    @GetMapping("/admin/user/lock/{id}")
    public String lockUser(@PathVariable long id) {
        User user = this.userService.getUserById(id);
        if (user != null) {
            user.setEnabled(false);
            this.userService.handleSaveUser(user);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/unlock/{id}")
    public String unlockUser(@PathVariable long id) {
        User user = this.userService.getUserById(id);
        if (user != null) {
            user.setEnabled(true);
            this.userService.handleSaveUser(user);
        }
        return "redirect:/admin/user";
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

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User user,
            BindingResult newUserBindingResult,
            @RequestParam("userFile") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (user.getPassword() == null
                || !user.getPassword().matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!*()]).{8,}$")) {
            newUserBindingResult.rejectValue("password", "error.user",
                    "Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt (@#$%^&+=!*())");
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.PasswordEncoder.encode(user.getPassword());
        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";

    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(
            Model model,
            @ModelAttribute("newUser") User user,
            BindingResult newUserBindingResult,
            @RequestParam("userFile") MultipartFile file) {

        // 1. Lấy thông tin User hiện tại từ Database
        User currentUser = this.userService.getUserById(user.getId());

        if (currentUser != null) {
            // 2. Xử lý Password (Logic quan trọng nhất)
            String newPassword = user.getPassword();

            // Chỉ xử lý nếu Admin có nhập gì đó vào ô mật khẩu
            if (newPassword != null && !newPassword.trim().isEmpty()) {
                // Kiểm tra mật khẩu mạnh (tránh lỗi ConstraintViolationException)
                if (!newPassword.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!*()]).{8,}$")) {
                    newUserBindingResult.rejectValue("password", "error.user",
                            "Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt (@#$%^&+=!*())");
                    return "admin/user/update";
                }
                // Nếu hợp lệ (> 2 ký tự) thì mới mã hóa và thay thế
                String hashPassword = this.PasswordEncoder.encode(newPassword);
                currentUser.setPassword(hashPassword);
            }
            // NẾU Ô PASSWORD TRỐNG: currentUser vẫn giữ password cũ (dạng hash) từ DB
            // nên khi save sẽ không bao giờ bị lỗi thiếu ký tự.

            // 3. Xử lý Avatar (Chỉ thay đổi nếu có chọn file mới)
            if (file != null && !file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "avatar");
                currentUser.setAvatar(img);
            }

            // 4. Cập nhật các thông tin cơ bản khác từ form vào currentUser
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            currentUser.setBirthday(user.getBirthday());

            // Cập nhật Role (Lấy object Role thật từ DB dựa trên name gửi về)
            currentUser.setRole(this.userService.getRoleByName(user.getRole().getName()));

            // 5. Lưu đối tượng currentUser (đối tượng này luôn đầy đủ Email, ID, Password)
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

        String email = principal.getName();
        User user = userService.getUserByEmail(email);

        // check mật khẩu cũ
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            model.addAttribute("error", "Mật khẩu cũ không đúng");
            return "client/homepage/user/change-password";
        }

        // check password mạnh
        if (!newPassword.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!*()]).{8,}$")) {
            model.addAttribute("error",
                    "Mật khẩu mới phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt (@#$%^&+=!*())");
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
    public String postUpdate(
            Model model,
            @ModelAttribute("newUser") User user,
            @RequestParam(value = "userFile", required = false) MultipartFile file,
            Principal principal) {
        // 1. Lấy user thực sự đang đăng nhập
        String email = principal.getName();
        User loginUser = this.userService.getUserByEmail(email);

        // 2. Chỉ cho phép update nếu ID trùng khớp với loginUser
        if (loginUser != null && loginUser.getId() == user.getId()) {
            User currentUser = this.userService.getUserById(user.getId());
            if (currentUser != null) {
                // Xử lý Avatar (Chỉ thay đổi nếu có chọn file mới)
                if (file != null && !file.isEmpty()) {
                    String img = this.uploadService.handleSaveUploadFile(file, "avatar");
                    currentUser.setAvatar(img);
                }

                currentUser.setAddress(user.getAddress());
                currentUser.setFullName(user.getFullName());
                currentUser.setPhone(user.getPhone());
                currentUser.setBirthday(user.getBirthday());
                this.userService.handleSaveUser(currentUser);
            }
        } else {
            // Hành động giả mạo ID hoặc lỗi session
            return "redirect:/login";
        }

        return "redirect:/";
    }

}
