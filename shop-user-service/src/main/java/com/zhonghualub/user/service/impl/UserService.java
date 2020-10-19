package com.zhonghualub.user.service.impl;

import com.zhonghualub.user.entity.ShopUser;
import com.zhonghualub.user.repository.ShopUserMapper;
import com.zhonghualub.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: ys
 * desc:
 * date: 2020/10/19
 */
@Service
public class UserService implements IUserService {

    @Autowired
    private ShopUserMapper shopUserMapper;

    @Override
    public ShopUser findByMobile(String username) {
        ShopUser shopUser = shopUserMapper.selectByUserName(username);
        return shopUser;
    }
}
