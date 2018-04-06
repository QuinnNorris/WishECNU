package com.quinnnorris.ssm.bean;

import java.util.Date;

public class User {

    private int user_id;
    private String phone;
    private String password;
    private int get_h;
    private int post_h;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getGet_h() {
        return get_h;
    }

    public void setGet_h(int get_h) {
        this.get_h = get_h;
    }

    public int getPost_h() {
        return post_h;
    }

    public void setPost_h(int post_h) {
        this.post_h = post_h;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
