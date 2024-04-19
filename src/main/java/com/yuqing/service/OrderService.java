package com.yuqing.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuqing.entity.Orders;

import java.util.Map;


public interface OrderService extends IService<Orders> {

    /**
     * 用户下单
     *
     * @param orders
     */
    public void submit(Orders orders);

    /**
     * 再来一单
     *
     * @param map
     */
    public void again(Map<String, String> map);
}
