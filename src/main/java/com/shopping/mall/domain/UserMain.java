package com.shopping.mall.domain;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "user_main")
public class UserMain implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    private String email;

    @Column(name = "nick_name")
    private String nickName;

    private Integer role;

    @Transient
    private String password;

    @Transient
    private String userNameOrEmail;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserNameOrEmail() {
        return userNameOrEmail;
    }

    public void setUserNameOrEmail(String userNameOrEmail) {
        this.userNameOrEmail = userNameOrEmail;
    }

    @Override
    public String toString() {
        return "UserMain{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", nickName='" + nickName + '\'' +
                ", role=" + role +
                ", password='" + password + '\'' +
                ", userNameOrEmail='" + userNameOrEmail + '\'' +
                '}';
    }
}