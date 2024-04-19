package com.yuqing.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuqing.dto.SetmealDto;
import com.yuqing.entity.Setmeal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author water
 * @date 2023/10/23
 * @Description
 */
public interface SetmealService extends IService<Setmeal> {
    /**
     * 新增套餐保存套餐与菜品关系
     *
     * @param setmealDto
     */
    public void saveWithDish(SetmealDto setmealDto);

    /**
     * 删除套餐同时删除套餐菜关系
     */
    public void removeWithDish(List<Long> ids);

    public SetmealDto getByIdWithDish(Long id);

    public void updateWithDish(SetmealDto setmealDto);

    public void changeStatus(@PathVariable int status, @RequestParam List<Long> ids);
}
