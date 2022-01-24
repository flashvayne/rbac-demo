package com.github.flashvayne.demo.service;

import com.github.flashvayne.dto.PageInfo;

/**
 * DemoService
 *
 * @author flashvayne
 */
public interface DemoService {
    PageInfo listStudent(String name,Integer age);
    PageInfo listTeacher(String name,Integer age);
}
