package com.shopping.mall.domain;

import javax.persistence.Column;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "tuser")
public class Tuser {
    /**
     * 用户名
     */
    @Column(name = "tuser")
    private String tuser;
    /**
     * 密码
     */
    @Column(name = "tpwd")
    private String tpwd;
    /**
     * 账户余额
     */
    @Column(name = "taccount")
    private String taccount;
    /**
     * 真实姓名
     */
    @Column(name = "tname")
    private String tname;
    /**
     * 性别
     */
    @Column(name = "tsex")
    private String tsex;
    /**
     * 出生日期
     */
    @Column(name = "tbirth")
    private Date tbirth;
    /**
     * 电子邮箱
     */
    @Column(name = "temail")
    private String temail;
    /**
     * 电话号码
     */
    @Column(name = "tphone")
    private String tphone;
    /**
     * 地址
     */
    @Column(name = "taddress")
    private String taddress;
    /**
     * 邮编
     */
    @Column(name = "tcode")
    private String tcode;
    /**
     * 注册时间
     */
    @Column(name = "tregdate")
    private Date tregdate;
    /**
     * 是否冻结
     */
    @Column(name = "tlock")
    private String tlock;
    /**
     * 最后登录时间
     */
    @Column(name = "tlastdate")
    private Date tlastdate;
    /**
     * 登录次数
     */
    @Column(name = "tlogin")
    private Long tlogin;
    /**
     * 用户权限
     */
    @Column(name = "trights")
    private String trights;

    public String getTuser() {
        return tuser;
    }

    public void setTuser(String tuser) {
        this.tuser = tuser;
    }

    public String getTpwd() {
        return tpwd;
    }

    public void setTpwd(String tpwd) {
        this.tpwd = tpwd;
    }

    public String getTaccount() {
        return taccount;
    }

    public void setTaccount(String taccount) {
        this.taccount = taccount;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

    public Date getTbirth() {
        return tbirth;
    }

    public void setTbirth(Date tbirth) {
        this.tbirth = tbirth;
    }

    public String getTemail() {
        return temail;
    }

    public void setTemail(String temail) {
        this.temail = temail;
    }

    public String getTphone() {
        return tphone;
    }

    public void setTphone(String tphone) {
        this.tphone = tphone;
    }

    public String getTaddress() {
        return taddress;
    }

    public void setTaddress(String taddress) {
        this.taddress = taddress;
    }

    public String getTcode() {
        return tcode;
    }

    public void setTcode(String tcode) {
        this.tcode = tcode;
    }

    public Date getTregdate() {
        return tregdate;
    }

    public void setTregdate(Date tregdate) {
        this.tregdate = tregdate;
    }

    public String getTlock() {
        return tlock;
    }

    public void setTlock(String tlock) {
        this.tlock = tlock;
    }

    public Date getTlastdate() {
        return tlastdate;
    }

    public void setTlastdate(Date tlastdate) {
        this.tlastdate = tlastdate;
    }

    public Long getTlogin() {
        return tlogin;
    }

    public void setTlogin(Long tlogin) {
        this.tlogin = tlogin;
    }

    public String getTrights() {
        return trights;
    }

    public void setTrights(String trights) {
        this.trights = trights;
    }
}
