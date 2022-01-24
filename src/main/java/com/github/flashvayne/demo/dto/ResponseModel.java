package com.github.flashvayne.demo.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * ResponseModel
 * Response的数据结构
 *
 * @author flashvayne
 */
@Data
public class ResponseModel implements Serializable {

    private static final long serialVersionUID = 1355243948967209213L;

    private Integer code;

    private String msg;

    private Object data;

    private ResponseModel(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static ResponseModel success(String msg, Object data) {
        return new ResponseModel(200, msg, data);
    }

    public static ResponseModel success(Object data) {
        return new ResponseModel(200, "请求成功", data);
    }

    public static ResponseModel fail(Integer code, String msg, Object data) {
        return new ResponseModel(code, msg, data);
    }
}
