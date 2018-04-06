package com.quinnnorris.ssm.service;

import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.util.BaseJson;

import javax.servlet.http.HttpSession;

/**
 * Title: LoginService
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/23 下午2:07 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
public interface LoginService {

    public BaseJson findUserByLogin(UserCustom userCustom, HttpSession httpSession);

    public BaseJson findUserByRegister(UserCustom userCustom, HttpSession httpSession);

    public BaseJson findUserByforget(UserCustom userCustom, HttpSession httpSession);
}
