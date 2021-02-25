package org.jplus.config;

import org.jplus.pojo.Users;
import org.jplus.utils.UserContext;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

@Component
public class UserArgumentResolver implements HandlerMethodArgumentResolver {
    /**
     * 在supportsParameter中判断是否需要启用分解功能，
     * 这里判断形参类型是否为User类，也就是说当形参遇到Person类时始终会执行该分解流程resolveArgument。
     * @param methodParameter
     * @return 是否分解User类
     */
    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        Class<?> clazz = methodParameter.getParameterType();
        //处理Users类型的参数
        return clazz==Users.class;
    }

    @Override
    public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer, NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) throws Exception {
        return UserContext.getUser();
    }
}
