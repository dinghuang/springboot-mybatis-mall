package com.shopping.mall.core;

public class CommonException extends RuntimeException {

    private final transient Object[] parameters;

    public CommonException(String message, Object... parameters) {

        super(message);
        this.parameters = parameters;
    }

    public CommonException(Throwable cause, Object... parameters) {
        super(cause);
        this.parameters = parameters;
    }

    public Object[] getParameters() {
        return parameters;
    }
}
