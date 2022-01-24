package com.github.flashvayne.demo.dto;

import lombok.Data;

/**
 * StudentDTO
 *
 * @author flashvayne
 */
@Data
public class StudentDTO {
    /**
     * 自增id
     */
    private Integer id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 年龄
     */
    private Integer age;
}
