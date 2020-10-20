package com.zhonghualub.user.controller;


import com.zhonghualub.common.entity.Result;
import com.zhonghualub.common.entity.ResultCode;
import com.zhonghualub.common.utils.JwtUtils;
import com.zhonghualub.user.entity.ShopUser;
import com.zhonghualub.user.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @author: ys
 * desc:
 * date: 2020/10/19
 */
@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private JwtUtils jwtUtils;

    /**
     * 用户登录
     *  1.通过service根据mobile查询用户
     *  2.比较password
     *  3.生成jwt信息
     *
     */
    @RequestMapping(value="/login",method = RequestMethod.POST)
    public Result login(@RequestBody Map<String,String> loginMap) {
        String username = loginMap.get("username");
        String password = loginMap.get("password");
        ShopUser user = userService.findByMobile(username);
        //登录失败
        if(user == null || !user.getUserPassword().equals(password)) {
            return new Result(ResultCode.MOBILEORPASSWORDERROR);
        }else {
            //登录成功
            //api权限字符串
//            StringBuilder sb = new StringBuilder();
            //获取到所有的可访问API权限
            /*for (Role role : user.getRoles()) {
                for (Permission perm : role.getPermissions()) {
                    if(perm.getType() == PermissionConstants.PERMISSION_API) {
                        sb.append(perm.getCode()).append(",");
                    }
                }
            }*/
            Map<String,Object> map = new HashMap<>();
//            map.put("apis",sb.toString());//可访问的api权限字符串
            String token = jwtUtils.createJwt(user.getUserId(), user.getUserName(), map);
            return new Result(ResultCode.SUCCESS,token);
        }
    }

    @GetMapping("/info")
    public Result detail() {
        log.info("user detail");
        return new Result(ResultCode.SUCCESS, "success");
    }
}
