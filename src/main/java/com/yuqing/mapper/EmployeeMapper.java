package com.yuqing.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yuqing.entity.Employee;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author water
 * @date 2023/10/16
 * @Description
 */
@Mapper
public interface EmployeeMapper extends BaseMapper<Employee> {
}
