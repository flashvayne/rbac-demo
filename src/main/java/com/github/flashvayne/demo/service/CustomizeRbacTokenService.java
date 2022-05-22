package com.github.flashvayne.demo.service;

import com.alibaba.fastjson.JSONObject;
import com.github.flashvayne.rbac.dto.AuthUserDTO;
import com.github.flashvayne.rbac.dto.RbacTokenInfo;
import com.github.flashvayne.rbac.property.RbacProperties;
import com.github.flashvayne.rbac.service.impl.DefaultRbacTokenServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.Set;

/**
 * 自定义RbacToken服务
 * <p>
 * 可通过继承DefaultRbacTokenServiceImpl重写用户信息相关功能
 *
 * @author flashvayne
 */
@Slf4j
//自定义RbacToken服务使用BeanName"rbacTokenService"
@Service("rbacTokenService")
public class CustomizeRbacTokenService extends DefaultRbacTokenServiceImpl {
    public CustomizeRbacTokenService(RbacProperties rbacProperties) {
        super(rbacProperties);
    }

    @Override
    public boolean doGenerateToken(RbacTokenInfo rbacTokenInfo) {

        /**
         * 此处为测试自定义的RbacToken服务是否生效
         * 经验证，日志有打印此句，所以生效
         */
        log.info("自定义rbacTokenService-----------doGenerateToken调用");
        try {
            redisTemplate.opsForValue().set(rbacProperties.getRedisKeyPrefix() + rbacTokenInfo.getToken(),
                    JSONObject.toJSONString(rbacTokenInfo), Duration.ofSeconds(rbacProperties.getTokenExpireTime()));
            log.info("doGenerateToken success: {}", rbacTokenInfo);
            return true;
        } catch (Exception e) {
            log.error("doGenerateToken: ", e);
            return false;
        }
    }

}
