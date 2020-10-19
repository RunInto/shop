package com.zhonghualub.user.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
@Data
public class ShopUser {
    private String userId;

    private String userName;

    private String userPassword;

    private String userMobile;

    private Long userScore;

    private Date userRegTime;

    private Long userMoney;
}