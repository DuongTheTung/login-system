package com.example.login_system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.login_system.domain.Role;
import com.example.login_system.domain.User;
import com.example.login_system.domain.dto.RegisterDTO;
import com.example.login_system.repository.RoleRepository;
import com.example.login_system.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    // private final ProductRepository productRepository;
    // private final OrderRepository orderRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository
    // ,
    // ProductRepository productRepository,
    // com.example.demo.repository.OrderRepository orderRepository
    ) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        // this.productRepository = productRepository;
        // this.orderRepository = orderRepository;
    }

    public String handleHello() {
        return "Hello from service";
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();

        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    // public long countProducts(){
    // return this.productRepository.count();
    // }

    // public long countOrders(){
    // return this.orderRepository.count();
    // }
}
