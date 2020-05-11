package com.project.basic.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.util.Collection;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "usr")
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "User name can't be empty")
    private String username;

    @NotBlank(message = "Password can't be empty")
    private String password;

    private boolean active;

//    @Email(message = "Email is not correct")
//    @NotBlank(message = "User name can't be empty")
//    private String email;

    private String activationCode;

    @Min(value = 3000, message = "must be equal or greater than 3000")
    @Max(value = 4000, message = "must be equal or less than 4000")
    private int cardNumber;

    @Min(value = 200, message = "must be equal or greater than 200")
    @Max(value = 550, message = "must be equal or less than 550")
    private int roomNumber;

    private String usrdate;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    public boolean isAdmin() {
        return roles.contains(Role.ADMIN);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

//    public String getEmail() {
//        return email;
//    }

//    public void setEmail(String email) {
//        this.email = email;
//    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getDate() {
        return usrdate;
    }

    public void setDate(String usrdate) {
        this.usrdate = usrdate;
    }

    @Override
    public String toString() {
        return "User info:\n" +
                "username -> " + this.username + "\n" +
                "password -> " + this.password + "\n" +
                "usrdate -> " + this.usrdate + "\n" +
//                "email -> " + this.email + "\n" +
                "active -> " + this.active + "\n" +
                "activationCode -> " + this.activationCode + "\n" +
                "roomNumber -> " + this.roomNumber + "\n" +
                "cardNumber -> " + this.cardNumber + "\n";
    }
}
