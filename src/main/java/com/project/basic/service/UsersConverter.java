package com.project.basic.service;

import com.project.basic.domain.User;
import com.project.basic.domain.dto.UsersDto;
import org.springframework.stereotype.Component;

@Component
public class UsersConverter {

    public User fromUserDtoToUser(UsersDto usersDto) {
        User users = new User();
        users.setDate(usersDto.getDate());
        users.setRoomNumber(usersDto.getRoomNumber());
        return users;
    }

    public UsersDto fromUserToUserDto(User users) {
        return UsersDto.builder()
                .date(users.getDate())
                .roomNumber(users.getRoomNumber())
                .build();
    }
}