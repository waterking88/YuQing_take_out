package com.yuqing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuqing.dto.SetmealDto;
import com.yuqing.entity.Dish;
import com.yuqing.entity.Setmeal;
import com.yuqing.entity.SetmealDish;
import com.yuqing.exception.CustomException;
import com.yuqing.mapper.SetmealMapper;
import com.yuqing.service.DishService;
import com.yuqing.service.SetmealDishService;
import com.yuqing.service.SetmealService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author water
 * @date 2023/10/23
 * @Description
 */
@Service
@Slf4j
public class SetmealServiceImpl extends ServiceImpl<SetmealMapper, Setmeal> implements SetmealService {
    @Autowired
    private SetmealDishService setmealDishService;

    @Autowired
    private DishService dishService;

    @Autowired
    private SetmealService setmealService;

    /**
     * 保存套餐信息以及套餐菜品关系信息
     *
     * @param setmealDto
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveWithDish(SetmealDto setmealDto) {
        //保存套餐基本信息
        this.save(setmealDto);
        //保存套餐跟菜品的关联信息
        List<SetmealDish> setmealDishes = setmealDto.getSetmealDishes();
        //this.save()后dishId自动生成赋给list
        for (SetmealDish setmealDish : setmealDishes) {
            setmealDish.setSetmealId(setmealDto.getId());
        }
        setmealDishService.saveBatch(setmealDishes);
    }

    /**
     * 删除套餐以及关联的套餐菜品信息
     *
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void removeWithDish(List<Long> ids) {
        //停售才能删除
        LambdaQueryWrapper<Setmeal> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(Setmeal::getId, ids);
        queryWrapper.eq(Setmeal::getStatus, 1);

        int count = this.count(queryWrapper);
        if (count > 0) {
            //不能删除则抛出业务异常
            throw new CustomException("含有套餐正在售卖中，不能删除");
        }

        //可以删除则先删除套餐表数据 setmeal
        this.removeByIds(ids);
        //删除关系表数据   setmeal_dish
        LambdaQueryWrapper<SetmealDish> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.in(SetmealDish::getSetmealId, ids);
        setmealDishService.remove(lambdaQueryWrapper);
    }

    /**
     * 获取套餐信息以及套餐菜品的关系数据
     *
     * @param id
     * @return
     */
    @Override
    public SetmealDto getByIdWithDish(Long id) {
        //查询基本套餐信息
        Setmeal setmeal = this.getById(id);
        //查询套餐对应菜品  setmeal_dish
        LambdaQueryWrapper<SetmealDish> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SetmealDish::getSetmealId, setmeal.getId());
        List<SetmealDish> dishes = setmealDishService.list(queryWrapper);

        //对象拷贝
        SetmealDto setmealDto = new SetmealDto();
        BeanUtils.copyProperties(setmeal, setmealDto);
        setmealDto.setSetmealDishes(dishes);
        return setmealDto;
    }

    /**
     * 更新套餐以及对应的套餐菜品信息
     *
     * @param setmealDto
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateWithDish(SetmealDto setmealDto) {
        //更新setmeal表
        this.updateById(setmealDto);
        //根据setmealId删setmeal_dish原来的数据
        LambdaQueryWrapper<SetmealDish> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SetmealDish::getSetmealId, setmealDto.getId());
        setmealDishService.remove(queryWrapper);
        //补上缺少的setmealId，再新增setmeal_dish内容。
        List<SetmealDish> dishes = setmealDto.getSetmealDishes();
        for (SetmealDish dish : dishes) {
            dish.setSetmealId(setmealDto.getId());
        }
        setmealDishService.saveBatch(dishes);
    }

    /**
     * 改变套餐状态
     *
     * @param status
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void changeStatus(int status, List<Long> ids) {
        //条件更新
        if (status != 0) {
            //套餐起售菜品也要起售,查找对应菜品
            LambdaQueryWrapper<SetmealDish> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.in(SetmealDish::getSetmealId, ids);
            List<SetmealDish> list = setmealDishService.list(lambdaQueryWrapper);
            ArrayList<Long> dishIds = new ArrayList<>();
            for (SetmealDish setmealDish : list) {
                Long dishId = setmealDish.getDishId();
                dishIds.add(dishId);
            }
            UpdateWrapper<Dish> updateWrapper = new UpdateWrapper<>();
            updateWrapper.in("id", dishIds);
            updateWrapper.set("status", status);
            dishService.update(updateWrapper);
        }

        UpdateWrapper<Setmeal> updateWrapper = new UpdateWrapper<>();
        updateWrapper.in("id", ids);
        updateWrapper.set("status", status);
        setmealService.update(updateWrapper);
    }
}
