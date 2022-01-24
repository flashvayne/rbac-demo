package com.github.flashvayne.demo.mapper;

import com.github.flashvayne.rbac.mapper.BaseRbacMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 继承BaseRbacMapper，使Mybatis扫描到BaseRbacMapper
 *
 * @author flashvayne
 */
@Mapper
public interface RbacMapper extends BaseRbacMapper {
}
