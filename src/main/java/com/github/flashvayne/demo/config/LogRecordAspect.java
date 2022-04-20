package com.github.flashvayne.demo.config;

import com.github.flashvayne.rbac.utils.AuthUserUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Slf4j
@Aspect
@Component
public class LogRecordAspect {

    @Pointcut(value = "@annotation(com.github.flashvayne.demo.config.LogRecord)")
    public void pointcut() {}

    @Around("pointcut() && @annotation(logRecord)")
    public Object interceptor(ProceedingJoinPoint proceedingJoinPoint, LogRecord logRecord) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder
                .getRequestAttributes())).getRequest();
        log.info("user: {} invoke uri : {}", AuthUserUtils.get().getAuthUserDTO(),request.getRequestURI());
        return proceedingJoinPoint.proceed();
    }

}
