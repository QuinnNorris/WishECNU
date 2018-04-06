package com.quinnnorris.ssm.bean;

import java.util.Date;

/**
 * Title: Wish
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2018/2/14 下午10:19 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
public class Wish {

    private int wish_id;
    private int post_id;
    private int get_id;
    private int cares;
    private int wish_status;
    private String nickname;
    private String titles;
    private String inners;
    private int conn_type;
    private String conn;
    private long pub_time;
    private long get_time;
    private int sexs;
    private String headp;
    private Date date_pub_time;

    public int getWish_id() {
        return wish_id;
    }

    public void setWish_id(int wish_id) {
        this.wish_id = wish_id;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getGet_id() {
        return get_id;
    }

    public void setGet_id(int get_id) {
        this.get_id = get_id;
    }

    public int getCares() {
        return cares;
    }

    public void setCares(int cares) {
        this.cares = cares;
    }

    public int getWish_status() {
        return wish_status;
    }

    public void setWish_status(int wish_status) {
        this.wish_status = wish_status;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getTitles() {
        return titles;
    }

    public void setTitles(String titles) {
        this.titles = titles;
    }

    public String getInners() {
        return inners;
    }

    public void setInners(String inners) {
        this.inners = inners;
    }

    public int getConn_type() {
        return conn_type;
    }

    public void setConn_type(int conn_type) {
        this.conn_type = conn_type;
    }

    public String getConn() {
        return conn;
    }

    public void setConn(String conn) {
        this.conn = conn;
    }

    public long getPub_time() {
        return pub_time;
    }

    public void setPub_time(long pub_time) {
        this.pub_time = pub_time;
    }

    public long getGet_time() {
        return get_time;
    }

    public void setGet_time(long get_time) {
        this.get_time = get_time;
    }

    public Date getDate_pub_time() {
        return date_pub_time;
    }

    public void setDate_pub_time(Date date_pub_time) {
        this.date_pub_time = date_pub_time;
    }

    public int getSexs() {
        return sexs;
    }

    public void setSexs(int sexs) {
        this.sexs = sexs;
    }

    public String getHeadp() {
        return headp;
    }

    public void setHeadp(String headp) {
        this.headp = headp;
    }
}
