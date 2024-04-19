package com.yuqing.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuqing.entity.Employee;
import com.yuqing.mapper.EmployeeMapper;
import com.yuqing.service.EmployeeService;
import org.springframework.stereotype.Service;

/**
 * @author water
 * @date 2023/10/16
 * @Description
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {
}
