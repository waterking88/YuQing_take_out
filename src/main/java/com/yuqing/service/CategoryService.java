package com.yuqing.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuqing.entity.Category;

/**
 * @author water
 * @date 2023/10/22
 * @Description
 */
public interface CategoryService extends IService<Category> {
    /**
     * 根据id删除分类，删除之前进行判断是否有关联菜品或者套餐
     *
     * @param id
     */
    void remove(Long id);
}
