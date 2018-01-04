package com.shopping.mall.domain;

import javax.persistence.*;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "bigmc")
public class Bigmc {

    /**
     * 大类编号
     */
    @Id
    @Column(name = "bid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bid;

    /**
     * 大类名称
     */
    @Column(name = "bname")
    private String bname;

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

}
