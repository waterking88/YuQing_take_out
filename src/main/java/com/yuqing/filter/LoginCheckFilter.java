package com.yuqing.filter;

import com.alibaba.fastjson.JSON;
import com.yuqing.common.BaseContext;
import com.yuqing.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 检查用户是否已经登录，拦截未登录的控制器请求
 *
 * @author water
 * @date 2023/10/21
 * @Description
 */
@Slf4j
@WebFilter(filterName = "LoginCheckFilter", urlPatterns = "/*")
public class LoginCheckFilter implements Filter {
    //匹配器，支持通配符
    public static final AntPathMatcher PATH_MATCHER = new AntPathMatcher();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        //获取本次请求URI
        String requestUri = request.getRequestURI();
        log.info("拦截到请求：{}", requestUri);
        //定义不拦截的请求
        String[] urls = new String[]{
                "/employee/login",
                "/employee/logout",
                "/backend/**",
                "/front/**",
                "/common/**",
                "/user/sendMsg",
                "/user/login"
        };

        //判断是否需要处理
        boolean check = check(urls, requestUri);

        //不需要处理就放行
        if (check) {
            log.info("本次请求不需要处理{}", requestUri);
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        //判断登录状态，登录则放行（管理端）
        if (request.getSession().getAttribute("employee") != null) {
            log.info("用户已登录，id为{}", request.getSession().getAttribute("employee"));
            Long empId = (Long) request.getSession().getAttribute("employee");
            BaseContext.setCurrentId(empId);
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        //判断登录状态，登录则放行(移动端)
        if (request.getSession().getAttribute("user") != null) {
            log.info("用户已登录，id为{}", request.getSession().getAttribute("user"));
            Long userId = (Long) request.getSession().getAttribute("user");
            BaseContext.setCurrentId(userId);
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        log.info("用户未登录");
        //未登录则返回登录结果,向客户端页面响应数据
        response.getWriter().write(JSON.toJSONString(R.error(("NOTLOGIN"))));

    }

    /**
     * 路径匹配，检查本次请求是否放行
     *
     * @param urls
     * @param requestUri
     * @return
     */
    public boolean check(String[] urls, String requestUri) {
        for (String url : urls) {
            boolean match = PATH_MATCHER.match(url, requestUri);
            if (match) {
                return true;
            }

        }
        return false;
    }
}
