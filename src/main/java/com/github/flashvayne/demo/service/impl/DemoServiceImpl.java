package com.github.flashvayne.demo.service.impl;

import com.github.flashvayne.Page;
import com.github.flashvayne.demo.dto.StudentDTO;
import com.github.flashvayne.demo.dto.TeacherDTO;
import com.github.flashvayne.demo.mapper.DemoMapper;
import com.github.flashvayne.demo.service.DemoService;
import com.github.flashvayne.dto.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * DemoServiceImpl
 *
 * @author flashvayne
 */
@Service
public class DemoServiceImpl implements DemoService {

    @Autowired
    private DemoMapper demoMapper;

    @Override
    public PageInfo<List<StudentDTO>> listStudent(String name, Integer age) {
        return Page.end(demoMapper.selectStudent(name,age));
    }

    @Override
    public PageInfo<List<TeacherDTO>> listTeacher(String name, Integer age) {
        return Page.end(demoMapper.selectTeacher(name,age));
    }
}
