package com.yuqing.dto;

import com.yuqing.entity.Setmeal;
import com.yuqing.entity.SetmealDish;
import lombok.Data;

import java.util.List;


@Data
public class SetmealDto extends Setmeal {

    private List<SetmealDish> setmealDishes;

    private String categoryName;
}
