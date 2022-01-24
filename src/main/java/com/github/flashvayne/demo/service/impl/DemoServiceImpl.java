package com.github.flashvayne.demo.service.impl;

import com.github.flashvayne.Page;
import com.github.flashvayne.demo.mapper.DemoMapper;
import com.github.flashvayne.demo.service.DemoService;
import com.github.flashvayne.dto.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public PageInfo listStudent(String name, Integer age) {
        return Page.end(demoMapper.selectStudent(name,age));
    }

    @Override
    public PageInfo listTeacher(String name, Integer age) {
        return Page.end(demoMapper.selectTeacher(name,age));
    }
}
