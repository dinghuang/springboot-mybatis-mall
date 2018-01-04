package com.shopping.mall.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "torder")
public class Torder {
    /**
     * 订单编号
     */
    @Id
    @Column(name = "oid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long oid;
    /**
     * 订单用户名
     */
    @Column(name = "tuser")
    private String tuser;
    /**
     * 下单时间
     */
    @Column(name = "oorderdate")
    private Date oorderdate;
    /**
     * 付款方式
     */
    @Column(name = "opaymethod")
    private String opaymethod;
    /**
     * 发贷方式
     */
    @Column(name = "osendmethod")
    private String osendmethod;
    /**
     * 商品种类数
     */
    @Column(name = "omctypesize")
    private Long omctypesize;
    /**
     * 商品总个数
     */
    @Column(name = "omcsize")
    private Long omcsize;
    /**
     * 订单总金额
     */
    @Column(name = "ototalprice")
    private Long ototalprice;
    /**
     * 审核状态
     */
    @Column(name = "ostatus")
    private String ostatus;
    /**
     * 订单反馈
     */
    @Column(name = "omsg")
    private String omsg;
    /**
     * 审核人
     */
    @Column(name = "oeuser")
    private String oeuser;
    /**
     * 审核时间
     */
    @Column(name = "oedate")
    private Date oedate;
    /**
     * 收贷人
     */
    @Column(name = "oname")
    private String oname;
    /**
     * 收贷人地址
     */
    @Column(name = "oaddress")
    private String oaddress;
    /**
     * 收贷人邮编
     */
    @Column(name = "ocode")
    private String ocode;
    /**
     * 收贷人联系电话
     */
    @Column(name = "ophone")
    private String ophone;
    /**
     * 收贷人email
     */
    @Column(name = "oemail")
    private String oemail;

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    public String getTuser() {
        return tuser;
    }

    public void setTuser(String tuser) {
        this.tuser = tuser;
    }

    public Date getOorderdate() {
        return oorderdate;
    }

    public void setOorderdate(Date oorderdate) {
        this.oorderdate = oorderdate;
    }

    public String getOpaymethod() {
        return opaymethod;
    }

    public void setOpaymethod(String opaymethod) {
        this.opaymethod = opaymethod;
    }

    public String getOsendmethod() {
        return osendmethod;
    }

    public void setOsendmethod(String osendmethod) {
        this.osendmethod = osendmethod;
    }

    public Long getOmctypesize() {
        return omctypesize;
    }

    public void setOmctypesize(Long omctypesize) {
        this.omctypesize = omctypesize;
    }

    public Long getOmcsize() {
        return omcsize;
    }

    public void setOmcsize(Long omcsize) {
        this.omcsize = omcsize;
    }

    public Long getOtotalprice() {
        return ototalprice;
    }

    public void setOtotalprice(Long ototalprice) {
        this.ototalprice = ototalprice;
    }

    public String getOstatus() {
        return ostatus;
    }

    public void setOstatus(String ostatus) {
        this.ostatus = ostatus;
    }

    public String getOmsg() {
        return omsg;
    }

    public void setOmsg(String omsg) {
        this.omsg = omsg;
    }

    public String getOeuser() {
        return oeuser;
    }

    public void setOeuser(String oeuser) {
        this.oeuser = oeuser;
    }

    public Date getOedate() {
        return oedate;
    }

    public void setOedate(Date oedate) {
        this.oedate = oedate;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public String getOaddress() {
        return oaddress;
    }

    public void setOaddress(String oaddress) {
        this.oaddress = oaddress;
    }

    public String getOcode() {
        return ocode;
    }

    public void setOcode(String ocode) {
        this.ocode = ocode;
    }

    public String getOphone() {
        return ophone;
    }

    public void setOphone(String ophone) {
        this.ophone = ophone;
    }

    public String getOemail() {
        return oemail;
    }

    public void setOemail(String oemail) {
        this.oemail = oemail;
    }
}
