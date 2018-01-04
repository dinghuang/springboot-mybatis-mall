package com.shopping.mall.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by dinghuang on 2018/1/2.
 */
@Table(name = "mc")
public class Mc {
    /**
     * 商品编号
     */
    @Id
    @Column(name = "mid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long mid;

    /**
     * 商品名称
     */
    @Column(name = "mname")
    private String mname;
    /**
     * 商品描述
     */
    @Column(name = "mdescription")
    private String mdescription;
    /**
     * 商品价格
     */
    @Column(name = "mprice")
    private Long mprice;
    /**
     *商品图片
     */
    @Column(name = "mimg")
    private String mimg;
    /**
     *商品总数量
     */
    @Column(name = "mtotal")
    private Long mtotal;
    /**
     *是否缺贷
     */
    @Column(name = "mstock")
    private String mstock;
    /**
     *添加时间
     */
    @Column(name = "mdate")
    private Date mdate;
    /**
     *所属小类
     */
    @Column(name = "sid")
    private Long sid;

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMdescription() {
        return mdescription;
    }

    public void setMdescription(String mdescription) {
        this.mdescription = mdescription;
    }

    public Long getMprice() {
        return mprice;
    }

    public void setMprice(Long mprice) {
        this.mprice = mprice;
    }

    public String getMimg() {
        return mimg;
    }

    public void setMimg(String mimg) {
        this.mimg = mimg;
    }

    public Long getMtotal() {
        return mtotal;
    }

    public void setMtotal(Long mtotal) {
        this.mtotal = mtotal;
    }

    public String getMstock() {
        return mstock;
    }

    public void setMstock(String mstock) {
        this.mstock = mstock;
    }

    public Date getMdate() {
        return mdate;
    }

    public void setMdate(Date mdate) {
        this.mdate = mdate;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }
}
