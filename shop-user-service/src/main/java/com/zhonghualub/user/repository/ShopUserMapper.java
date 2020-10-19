package com.zhonghualub.user.repository;

import com.zhonghualub.user.entity.ShopUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author: ys
 * desc:
 * date: 2020/10/19
 */
@Mapper
public interface ShopUserMapper {
    ShopUser selectByUserName(@Param("username") String username);
}
