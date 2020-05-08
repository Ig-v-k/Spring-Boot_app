package com.project.basic.repos;

import com.project.basic.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByActivationCode(String code);
    User findByCardNumber(int cardNumber);
    User findByRoomNumber(int roomNumber);
}
