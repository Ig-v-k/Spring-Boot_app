package com.project.basic.repos;

import com.project.basic.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByActivationCode(String code);
    User findByCardNumber(int cardNumber);
    User findByRoomNumber(int roomNumber);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("update User usr set usr.usrdate =:newusrdate where usr.roomNumber =:usrRoomNumber")
    void addUserTime(@Param("usrRoomNumber") int roomNumber, @Param("newusrdate") String date);
}
