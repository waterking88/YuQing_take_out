package com.yuqing.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuqing.entity.ShoppingCart;


public interface ShoppingCartService extends IService<ShoppingCart> {
    public void clean();
}
