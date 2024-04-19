package com.yuqing.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuqing.dto.DishDto;
import com.yuqing.entity.Dish;

import java.util.List;

/**
 * @author water
 * @date 2023/10/23
 * @Description
 */
public interface DishService extends IService<Dish> {

    /**
     * 新增菜品，同时要插入菜品对应口味，需要操作两表dish、dish_flavor表
     *
     * @param dishDto
     */
    public void saveWithFlavor(DishDto dishDto);

    /**
     * 根据id查询菜品信息和对应的口味信息
     *
     * @param id
     * @return
     */
    public DishDto getByIdWithFlavor(Long id);

    /**
     * 更新菜品同时更新口味
     *
     * @param dishDto
     */
    public void updateWithFlavor(DishDto dishDto);


    public void deleteWithFlavorAndSetmeal(List<Long> ids);

    public void updateStatus(int status, List<Long> ids);
}
