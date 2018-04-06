package com.quinnnorris.ssm.controller;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.service.Implement.LoginServiceImpl;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.Configers;
import com.quinnnorris.ssm.util.EmailSend;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Title: LoginController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/23 下午1:43 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class LoginController {

    @Autowired
    private LoginServiceImpl loginService;

    @RequestMapping("/forget")
    public String toForpassPage() {
        return "forget";
    }

    @RequestMapping("/login")
    public String toLoginPage() {
        return "login";
    }

    @RequestMapping("/register")
    public String toSignupPage() {
        return "register";
    }

    @RequestMapping(value = "/tologin", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson registerUser(@RequestParam String phone, @RequestParam String pw, HttpSession httpSession) {
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom.setPassword(pw);
        return loginService.findUserByLogin(userCustom, httpSession);
    }

    @RequestMapping(value = "/toregister", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson registerPhonePW(@RequestParam String phone, @RequestParam String pw, HttpSession httpSession) {
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom.setPassword(pw);
        return loginService.findUserByRegister(userCustom, httpSession);
    }

    @RequestMapping(value = "/toforget", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson forgetPhonePW(@RequestParam String phone, @RequestParam String pw, HttpSession httpSession) {
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom.setPassword(pw);
        return loginService.findUserByforget(userCustom, httpSession);
    }

    @RequestMapping("/signout")
    public String signOutToLogin(HttpSession httpSession) {
        SessionUtil.initSession(httpSession);
        return "login";
    }

    @RequestMapping(value = "/yanzheng", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson yanzhengPhone(@RequestParam String phone, HttpSession httpSession) {
        BaseJson baseJson = new BaseJson();
        String ran = (int) (Math.random() * 10000) + "";
        if (ran.length() < 4)
            for (int i = 0; i < 4 - ran.length(); i++)
                ran = "0" + ran;
        baseJson.setObject(ran);

        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        //初始化ascClient需要的几个参数
        final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
        final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
        //替换成你的AK
        final String accessKeyId = "LTAIsFHjJXTp7q8J";//你的accessKeyId,参考本文档步骤2
        final String accessKeySecret = "bJVaXVAzgCOYPE3nYZ7f5ZaAhWvdC4";//你的accessKeySecret，参考本文档步骤2
        //初始化ascClient,暂时不支持多region（请勿修改）
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,
                accessKeySecret);
        try {
            DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        } catch (ClientException e) {
            e.printStackTrace();
        }
        IAcsClient acsClient = new DefaultAcsClient(profile);
        //组装请求对象
        SendSmsRequest request = new SendSmsRequest();
        //使用post提交
        request.setMethod(MethodType.POST);
        //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
        request.setPhoneNumbers(phone);
        //必填:短信签名-可在短信控制台中找到
        request.setSignName("女生节心愿墙");
        //必填:短信模板-可在短信控制台中找到
        request.setTemplateCode("SMS_126345224");
        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
        request.setTemplateParam("{\"code\":\"" + ran + "\"}");
        //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
        //request.setSmsUpExtendCode("90997");
        //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("yourOutId");
        //请求失败这里会抛ClientException异常
        SendSmsResponse sendSmsResponse = null;
        try {
            sendSmsResponse = acsClient.getAcsResponse(request);
        } catch (ClientException e) {
            e.printStackTrace();
        }
        if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) baseJson.setErrorCode("0");
        else baseJson.setErrorCode("1");
        return baseJson;
    }


}
