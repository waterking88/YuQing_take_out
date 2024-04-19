package com.yuqing;

import com.yuqing.entity.Employee;
import com.yuqing.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/**
 * @author water
 * @date 2023/10/16
 * @Description
 */
@SpringBootTest
public class Test {
    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * 测试mp
     */
    @org.junit.jupiter.api.Test
    void test() {
        List<Employee> employees = employeeMapper.selectList(null);
        System.out.println(employees);
    }

    /**
     * 测试文件后缀提取
     */
    @org.junit.jupiter.api.Test
    public void test1() {
        String fileName = "abc.jpg";
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        System.out.println(suffix);
    }

}
