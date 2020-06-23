package com.project.basic.service;

import com.project.basic.domain.Role;
import com.project.basic.domain.User;
import com.project.basic.domain.dto.UsersDto;
import com.project.basic.repos.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserService implements UserDetailsService {

    private final DateFormat inputformatForDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm", Locale.US);
    private final DateFormat outputformatForDate = new SimpleDateFormat("E dd/MM   HH:mm", Locale.US);

    private final UserRepo userRepo;
//  private final MailSender mailSender;
    private final PasswordEncoder passwordEncoder;
    private final UsersConverter usersConverter;

//  @Value("${hostname}")
//  private String hostname;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByUsername(username);

        if(user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return user;
    }

    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepo.save(user);

//      sendMessage(user);

        return true;
    }

/*    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to LundryKey. Please, visit next link: http://%s/activate/%s for to continue registration",
                    user.getUsername(),
                    hostname,
                    user.getActivationCode()
            );

            mailSender.send(user.getEmail(), "Activation code", message);
        }
    }*/

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        userRepo.save(user);
        return true;
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public User findByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
    }

    @Scheduled(cron = "* 1 * * *")
    public void deleteUserOnlyDateById_Service(int userRoomNumber) {
        userRepo.deleteUserOnlyDateById_Repository(null, userRoomNumber);
    }

    public void addUserTime(int roomNumber, LocalDateTime date) throws ParseException {

        Date date1 = inputformatForDate.parse(date.toString());
        String mainOutputTime = outputformatForDate.format(date1);

        userRepo.addUserTime(roomNumber, mainOutputTime);
    }

    public User findByRoomNumber(int roomNumber) {
        return userRepo.findByRoomNumber(roomNumber);
    }

    public List<User> findOnlyUsersAll() {
        return userRepo.findUserOnlyHasNotEqualsToTheAdmin();
    }

    /* ------------------ Javascript - Ajax "test" SPACE ------------------ */
    public List<UsersDto> findOnlyUsersAllTest() {
        return userRepo.findUserOnlyHasNotEqualsToTheAdmin()
                .stream()
                .map(usersConverter::fromUserToUserDto)
                .collect(Collectors.toList());
    }
/*    public UsersDto saveUser(UsersDto usersDto) throws ValidationException, ParseException {

        validateUserDto(usersDto); //*

        Date date1 = inputformatForDate.parse(usersDto.getDate()).toString();
        String mainOutputTime = outputformatForDate.format(date1);

        userRepo.addUserTime(usersDto.getRoomNumber(), mainOutputTime);

        User savedUser = findByRoomNumber(usersDto.getRoomNumber());//* - has modificated

        return usersConverter.fromUserToUserDto(savedUser); //*
    }
    private void validateUserDto(UsersDto usersDto) throws ValidationException {
        if (isNull(usersDto)) {
            throw new ValidationException("Object time is null");
        }
        if (isNull(usersDto.getDate()) || usersDto.getDate().isEmpty()) {
            throw new ValidationException("Date is empty");
        }
    }*/
    /* --- --- */

    public User findByCardNumber(int cardNumber) {
        return userRepo.findByCardNumber(cardNumber);
    }

/*    public void updateProfile(User user, String password, String email) {
        String userEmail = user.getEmail();

        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(email));

        if (isEmailChanged) {
            user.setEmail(email);

            if (!StringUtils.isEmpty(email)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        if (!StringUtils.isEmpty(password)) {
            user.setPassword(passwordEncoder.encode(password));
        }

        userRepo.save(user);

        if (isEmailChanged) {
            sendMessage(user);
        }
    }*/
}
