package com.github.flashvayne.demo.mapper;

import com.github.flashvayne.demo.dto.StudentDTO;
import com.github.flashvayne.demo.dto.TeacherDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * DemoMapper
 *
 * @author flashvayne
 */
@Mapper
public interface DemoMapper {

    List<StudentDTO> selectStudent(String name, Integer age);
    List<TeacherDTO> selectTeacher(String name, Integer age);

}
