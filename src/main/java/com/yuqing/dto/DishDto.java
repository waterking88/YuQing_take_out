package com.yuqing.dto;

import com.yuqing.entity.Dish;
import com.yuqing.entity.DishFlavor;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author waterking
 */
@Data
public class DishDto extends Dish {

    private List<DishFlavor> flavors = new ArrayList<>();

    private String categoryName;    //用于满足分页查询请求的响应

    private Integer copies;
}
