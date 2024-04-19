package com.yuqing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuqing.dto.DishDto;
import com.yuqing.entity.Dish;
import com.yuqing.entity.DishFlavor;
import com.yuqing.entity.Setmeal;
import com.yuqing.entity.SetmealDish;
import com.yuqing.exception.CustomException;
import com.yuqing.mapper.DishMapper;
import com.yuqing.service.DishFlavorService;
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
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements DishService {
    @Autowired
    private DishFlavorService dishFlavorService;

    @Autowired
    private SetmealDishService setmealDishService;

    @Autowired
    private SetmealService setmealService;

    /**
     * 多张表操作，开启事务
     * 新增菜品,同时保存口味数据
     *
     * @param dishDto
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveWithFlavor(DishDto dishDto) {
        //保存菜品信息到菜品表
        this.save(dishDto);
        //保存完后id已经自动生成保存到dishDto中
        Long dishId = dishDto.getId();
        //菜品口味,添加dishId
        List<DishFlavor> flavors = dishDto.getFlavors();
        for (DishFlavor flavor : flavors) {
            flavor.setDishId(dishId);
        }
        log.info(flavors.get(0).getDishId().toString());
        //保存菜品口味数据到菜品口味表 dish_flavor
        dishFlavorService.saveBatch(dishDto.getFlavors());

    }

    /**
     * 获取菜品信息与对应的口味信息
     *
     * @param id
     * @return
     */
    @Override
    public DishDto getByIdWithFlavor(Long id) {
        //查询菜品基本信息，dish查询
        Dish dish = this.getById(id);
        //查询当前菜品对应的口味信息，dish_flavor查询
        LambdaQueryWrapper<DishFlavor> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DishFlavor::getDishId, dish.getId());
        List<DishFlavor> flavors = dishFlavorService.list(queryWrapper);

        //对象拷贝
        DishDto dishDto = new DishDto();
        BeanUtils.copyProperties(dish, dishDto);
        dishDto.setFlavors(flavors);

        return dishDto;
    }

    /**
     * 更新菜品以及对应口味
     *
     * @param dishDto
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateWithFlavor(DishDto dishDto) {
        //更新dish表
        this.updateById(dishDto);
        //根据dishId删dish_flavor表原来的
        LambdaQueryWrapper<DishFlavor> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DishFlavor::getDishId, dishDto.getId());
        dishFlavorService.remove(queryWrapper);
        //新增dish_flavor内容
        List<DishFlavor> flavors = dishDto.getFlavors();
        for (DishFlavor flavor : flavors) {
            flavor.setDishId(dishDto.getId());
        }
        dishFlavorService.saveBatch(flavors);

    }

    /**
     * 删除菜品，菜品对应口味表，菜品套餐表
     *
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteWithFlavorAndSetmeal(List<Long> ids) {
        LambdaQueryWrapper<Dish> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Dish::getStatus, 0).in(Dish::getId, ids);
        int count = this.count(queryWrapper);
        if (count != ids.size()) {
            throw new CustomException("含有在售菜品无法操作");
        }
        //删除菜品表
        this.remove(queryWrapper);
        //删除菜品口味表
        LambdaQueryWrapper<DishFlavor> dishFlavorLambdaQueryWrapper = new LambdaQueryWrapper<>();
        dishFlavorLambdaQueryWrapper.in(DishFlavor::getDishId, ids);
        dishFlavorService.remove(dishFlavorLambdaQueryWrapper);
        //删除套餐菜品表
        LambdaQueryWrapper<SetmealDish> setmealDishLambdaQueryWrapper = new LambdaQueryWrapper<>();
        setmealDishLambdaQueryWrapper.in(SetmealDish::getDishId, ids);
        setmealDishService.remove(setmealDishLambdaQueryWrapper);
    }

    /**
     * 更新菜品状态
     *
     * @param status
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateStatus(int status, List<Long> ids) {
        if (status != 1) {
            //查询setmeal_dish表是否关联
            LambdaQueryWrapper<SetmealDish> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.in(SetmealDish::getDishId, ids);
            List<SetmealDish> setmealDishes = setmealDishService.list(queryWrapper);
            //若有关联，获得关联的套餐ids
            if (setmealDishes.size() > 0) {
                ArrayList<Long> setmealIds = new ArrayList<>();
                for (SetmealDish setmealDish : setmealDishes) {
                    Long setmealId = setmealDish.getSetmealId();
                    setmealIds.add(setmealId);
                }
                //关联的套餐也停售
                UpdateWrapper<Setmeal> updateWrapper = new UpdateWrapper<>();
                updateWrapper.in("id", setmealIds);
                updateWrapper.set("status", status);
                setmealService.update(updateWrapper);
            }
        }
        //条件更新
        UpdateWrapper<Dish> updateWrapper = new UpdateWrapper<>();
        updateWrapper.in("id", ids);
        updateWrapper.set("status", status);
        this.update(updateWrapper);
    }

}
