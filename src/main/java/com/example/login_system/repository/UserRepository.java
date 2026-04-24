package com.example.login_system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.login_system.domain.User;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hoidanit); // == UPDATE/ INSERT

    void deleteById(long id); // đây là phương thức , khi gọi sẽ tự động tạo truy vấn sql

    List<User> findOneByEmail(String email);

    List<User> findAll();

    User findById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);

    Page<User> findAll(Pageable pageable);

    Page<User> findByEmailContainingIgnoreCaseOrFullNameContainingIgnoreCase(String email, String fullName, Pageable pageable);

    long countByRoleName(String roleName);

    long countByEnabled(boolean enabled);
}
