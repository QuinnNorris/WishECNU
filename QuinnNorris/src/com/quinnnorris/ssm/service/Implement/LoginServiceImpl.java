package com.quinnnorris.ssm.service.Implement;

import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.mapper.UserCustomMapper;
import com.quinnnorris.ssm.service.LoginService;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Title: LoginServiceImpl
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/23 下午2:08 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
@Service("LoginService")
public class LoginServiceImpl implements LoginService {

    @Autowired
    UserCustomMapper userCustomMapper;

    @Override
    public BaseJson findUserByLogin(UserCustom userCustom, HttpSession httpSession) {
        BaseJson baseJson = new BaseJson();
        UserCustom userHas = userCustomMapper.selectUserByPhone(userCustom);
        if (userHas == null) {
            baseJson.setErrorCode("1");
            return baseJson;
        }
        UserCustom userRes = userCustomMapper.selectUserByPhoneAndPW(userCustom);
        if (userRes != null) {
            baseJson.setErrorCode("0");
            baseJson.setBeanObject(userRes);
            httpSession.setAttribute("phone", userCustom.getPhone());
        } else
            baseJson.setErrorCode("2");
        return baseJson;
    }

    @Override
    public BaseJson findUserByRegister(UserCustom userCustom, HttpSession httpSession) {
        BaseJson baseJson = new BaseJson();
        UserCustom userRes = userCustomMapper.selectUserByPhone(userCustom);
        if (userRes != null) baseJson.setErrorCode("1");
        else {
            userCustomMapper.insertUserReturnId(userCustom);
            baseJson.setErrorCode("0");
            baseJson.setBeanObject(userCustom);
            httpSession.setAttribute("phone", userCustom.getPhone());
        }
        return baseJson;
    }

    public BaseJson findUserByforget(UserCustom userCustom, HttpSession httpSession) {
        BaseJson baseJson = new BaseJson();
        UserCustom userRes = userCustomMapper.selectUserByPhone(userCustom);
        if (userRes == null) baseJson.setErrorCode("1");
        else {
            userCustomMapper.updateUserPW(userCustom);
            baseJson.setErrorCode("0");
            baseJson.setBeanObject(userCustom);
            httpSession.setAttribute("phone", userCustom.getPhone());
        }
        return baseJson;
    }

}
