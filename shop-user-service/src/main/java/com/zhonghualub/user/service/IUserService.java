package com.zhonghualub.user.service;


import com.zhonghualub.user.entity.ShopUser;

public interface IUserService {
    /**
     * 根据mobile查询用户
     */
    ShopUser findByMobile(String mobile);

}
