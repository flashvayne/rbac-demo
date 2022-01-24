package com.github.flashvayne.demo.dto;

import lombok.Data;

/**
 * TeacherDTO
 *
 * @author flashvayne
 */
@Data
public class TeacherDTO {
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
