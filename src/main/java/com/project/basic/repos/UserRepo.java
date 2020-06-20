package com.project.basic.repos;

import com.project.basic.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByActivationCode(String code);
    User findByCardNumber(int cardNumber);
    User findByRoomNumber(int roomNumber);

    @Query(value = "select * from usr where (card_number > 1 and room_number > 1)", nativeQuery = true)
    List<User> findUserOnlyHasNotEqualsToTheAdmin();

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("update User usr set usr.user_date =:newUsrDate where usr.roomNumber =:userRoomNumber")
    void deleteUserOnlyDateById_Repository(@Param("newUsrDate") String stringDateNull, @Param("userRoomNumber") int userRoomNumber);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("update User usr set usr.user_date =:newusrdate where usr.roomNumber =:usrRoomNumber")
    void addUserTime(@Param("usrRoomNumber") int roomNumber, @Param("newusrdate") String date);
}
