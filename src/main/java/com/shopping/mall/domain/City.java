package com.shopping.mall.domain;

/**
 * @author dinghuang
 * @since 2017-12-04 16:16
 */
public class City extends BaseEntity {
    private String name;

    private String state;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

}
