package com.github.flashvayne.demo.controller;

import com.github.flashvayne.Page;
import com.github.flashvayne.demo.config.LogRecord;
import com.github.flashvayne.demo.dto.LoginDTO;
import com.github.flashvayne.demo.dto.ResponseModel;
import com.github.flashvayne.demo.service.DemoService;
import com.github.flashvayne.rbac.aspect.RbacAuthorization;
import com.github.flashvayne.rbac.dto.AuthUserDTO;
import com.github.flashvayne.rbac.dto.RbacTokenInfo;
import com.github.flashvayne.rbac.service.RbacAuthUserService;
import com.github.flashvayne.rbac.service.RbacTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * DemoController
 *
 * @author flashvayne
 */
@RestController
public class DemoController {

    @Autowired
    private RbacAuthUserService rbacAuthUserService;

    @Autowired
    private RbacTokenService rbacTokenService;

    @Autowired
    private DemoService demoService;

    @PostMapping("/login")
    public ResponseModel login(@RequestBody @Valid LoginDTO loginDTO) {
        if (!rbacAuthUserService.authentication(loginDTO.getUserId(), loginDTO.getPassword())) {
            return ResponseModel.fail(401, "用户名或密码错误", null);
        }
        AuthUserDTO authUserInfo = rbacAuthUserService.getAuthUserInfo(loginDTO.getUserId());
        RbacTokenInfo rbacTokenInfo = rbacTokenService.generateTokenInfo(authUserInfo);
        if (rbacTokenService.doGenerateToken(rbacTokenInfo)) {
            return ResponseModel.success("登录成功", rbacTokenInfo);
        } else {
            return ResponseModel.fail(500, "请求失败", null);
        }
    }

    /**
     * 此接口需要鉴权 加注解@RbacAuthorization
     * 如未正确在header中传
     * --header 'authorization: 4a35900b426a416ab75d35fbef54c4c25ab0cfda6b8746409c27d2b84b53b4b1'
     * 则会返回Http 401 Unauthorized.
     */
    @LogRecord
    @RbacAuthorization
    @GetMapping("/student/list")
    public ResponseModel studentList(@RequestParam Integer pageNum, @RequestParam Integer pageSize,
                                     String name, Integer age) {
        Page.start(pageNum, pageSize);
        return ResponseModel.success(demoService.listStudent(name, age));
    }

    /**
     * 此接口需要鉴权 加注解@RbacAuthorization
     * 本例中rbac_role_resource表为班主任角色只配置了"/student/list"，并没有"/teacher/list"
     * 所以使用 “班主任” 的token访问此接口会报Http 403 Forbidden
     */
    @LogRecord
    @RbacAuthorization
    @GetMapping("/teacher/list")
    public ResponseModel teacherList(@RequestParam Integer pageNum, @RequestParam Integer pageSize,
                                     String name, Integer age) {
        Page.start(pageNum, pageSize);
        return ResponseModel.success(demoService.listTeacher(name, age));
    }

}
