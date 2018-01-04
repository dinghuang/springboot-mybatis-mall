package com.shopping.mall.domain;

import javax.persistence.*;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "smallmc")
public class Smallmc {
    /**
     * 小类编号
     */
    @Id
    @Column(name = "sid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sid;
    /**
     * 小类名称
     */
    @Column(name = "sname")
    private String sname;
    /**
     * 所属大类ID
     */
    @Column(name = "bid")
    private Long bid;

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }
}
