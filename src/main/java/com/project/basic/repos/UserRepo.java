package com.project.basic.repos;

import com.project.basic.domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserRepo extends CrudRepository<User, Long> {
    List<User> findByUserName(String userName);
}
