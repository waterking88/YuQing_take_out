package com.yuqing.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yuqing.entity.Dish;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author water
 * @date 2023/10/23
 * @Description
 */
@Mapper
public interface DishMapper extends BaseMapper<Dish> {
}
