package com.github.flashvayne.demo.service;

import com.github.flashvayne.demo.dto.StudentDTO;
import com.github.flashvayne.demo.dto.TeacherDTO;
import com.github.flashvayne.dto.PageInfo;

import java.util.List;

/**
 * DemoService
 *
 * @author flashvayne
 */
public interface DemoService {
    PageInfo<List<StudentDTO>> listStudent(String name, Integer age);
    PageInfo<List<TeacherDTO>> listTeacher(String name, Integer age);
}
