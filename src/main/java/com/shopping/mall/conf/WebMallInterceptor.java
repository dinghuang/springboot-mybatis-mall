package com.shopping.mall.conf;

import com.shopping.mall.domain.UserMain;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
@WebFilter(filterName = "mallFilter")
public class WebMallInterceptor implements HandlerInterceptor {

    private Logger logger = LoggerFactory.getLogger(WebMallInterceptor.class);
    private static final String CURRENT_USER = "currentUser";

    //在请求处理之前进行调用（Controller方法调用之前
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        logger.info("拦截器启用");
        HttpSession session = httpServletRequest.getSession();
        if (session.getAttribute(CURRENT_USER) == null || "".equals(session.getAttribute(CURRENT_USER))) {
            return false;
        } else {
            UserMain userMain = (UserMain) session.getAttribute(CURRENT_USER);
            return userMain.getRole() == 1;
        }
    }

    //请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        logger.info("postHandle被调用");
    }

    //在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行（主要是用于进行资源清理工作）
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        logger.info("afterCompletion被调用");
    }
}
