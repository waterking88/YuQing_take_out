package com.yuqing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuqing.entity.Category;
import com.yuqing.entity.Dish;
import com.yuqing.entity.Setmeal;
import com.yuqing.exception.CustomException;
import com.yuqing.mapper.CategoryMapper;
import com.yuqing.service.CategoryService;
import com.yuqing.service.DishService;
import com.yuqing.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author water
 * @date 2023/10/22
 * @Description
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private DishService dishService;
    @Autowired
    private SetmealService setmealService;

    /**
     * 删除分类
     *
     * @param id
     */
    @Override
    public void remove(Long id) {
        //判断是否关联,有则抛出业务异常
        LambdaQueryWrapper<Dish> dishLambdaQueryWrapper = new LambdaQueryWrapper<>();
        //查询菜品
        dishLambdaQueryWrapper.eq(Dish::getCategoryId, id);
        int dishCount = dishService.count(dishLambdaQueryWrapper);
        //关联菜品,抛出业务异常
        if (dishCount > 0) {
            //抛出业务异常
            throw new CustomException("当前分类下关联了菜品，不能删除");
        }
        //查询套餐
        LambdaQueryWrapper<Setmeal> setmealLambdaQueryWrapper = new LambdaQueryWrapper<>();
        setmealLambdaQueryWrapper.eq(Setmeal::getCategoryId, id);
        int setmealCount = setmealService.count(setmealLambdaQueryWrapper);
        if (setmealCount > 0) {
            //抛出业务异常
            throw new CustomException("当前分类下关联了套餐，不能删除");
        }
        //正常删除
        super.removeById(id);
    }
}
