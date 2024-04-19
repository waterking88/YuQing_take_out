package com.yuqing.common;

/**
 * 基于ThreadLocal封装工具类，用户保存和获取当前登录用户id
 *
 * @author water
 * @date 2023/10/22
 * @Description
 */
public class BaseContext {
    private static ThreadLocal<Long> threadLocal = new ThreadLocal<>();

    public static Long getCurrentId() {
        return threadLocal.get();
    }

    public static void setCurrentId(Long id) {
        threadLocal.set(id);
    }
}
