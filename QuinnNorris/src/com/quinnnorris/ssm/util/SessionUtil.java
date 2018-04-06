package com.quinnnorris.ssm.util;

import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Title: SessionUtil
 * Description: 关于session中信息操作
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/9/28 下午8:38 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
public class SessionUtil {

    /**
     * 初始化session，将session中数据清空
     *
     * @param httpSession
     */
    public static void initSession(HttpSession httpSession) {
        Enumeration<String> attributeNames = httpSession.getAttributeNames();
        while (attributeNames.hasMoreElements())
            httpSession.removeAttribute(attributeNames.nextElement());
    }

    /**
     * 向session中填充信息
     *
     * @param httpSession 浏览器中的session
     * @param phone       被填充的phone信息
     * @param usertype    被填充的usertype信息
     */
    public static void setSessionPhone(HttpSession httpSession, String phone, int usertype, String headp, String username) {
        httpSession.setAttribute("phone", phone);
        httpSession.setAttribute("headp", headp);
        httpSession.setAttribute("usertype", usertype);
        httpSession.setAttribute("username", username);
    }

    /**
     * 如果session中传入参数的属性中有空值或不存在则返回true，否则返回false
     *
     * @param httpSession 浏览器中session
     * @param strings     传入的所有需要判断的参数
     * @return 返回判断结果
     */
    public static boolean sessionHasNull(HttpSession httpSession, String... strings) {
        String[] strs = new String[strings.length];
        for (int i = 0; i < strings.length; i++)
            strs[i] = (String) httpSession.getAttribute(strings[i]);
        return SessionUtil.paramHasNull(strs);
    }

    /**
     * 如果参数中有空值或不存在则返回true，否则返回false
     *
     * @param strings 传入参数列表
     * @return 返回判断结果
     */
    public static boolean paramHasNull(Object... strings) {
        boolean hasNull = false;
        for (Object str : strings)
            if (str == null || str.equals(""))
                hasNull = true;
        return hasNull;
    }

    public static Map<String, String> getAllSession(HttpSession httpSession) {
        Map<String, String> map = new HashMap<>();
        Enumeration<String> attributeNames = httpSession.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String attr = attributeNames.nextElement();
            map.put(attr, (String) httpSession.getAttribute(attr));
        }
        return map;
    }

}
