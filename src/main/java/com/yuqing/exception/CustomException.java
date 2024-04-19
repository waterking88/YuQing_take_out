package com.yuqing.exception;

/**
 * 业务异常类
 *
 * @author water
 * @date 2023/10/23
 * @Description
 */
public class CustomException extends RuntimeException {
    public CustomException(String message) {
        super(message);
    }
}
