package com.quinnnorris.ssm.controller;

import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Title: BaseController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/23 下午1:41 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
public class BaseController {

    /**
     * ThreadLocal确保高并发下每个请求的request，response都是独立的
     */
    private static ThreadLocal<ServletRequest> currentRequest = new ThreadLocal<ServletRequest>();
    private static ThreadLocal<ServletResponse> currentResponse = new ThreadLocal<ServletResponse>();

    /**
     * 线程安全初始化reque，respose对象
     *
     * @param request
     * @param response
     */
    @ModelAttribute
    protected void initReqAndRep(HttpServletRequest request, HttpServletResponse response) {
        currentRequest.set(request);
        currentResponse.set(response);
    }

    /**
     * 线程安全
     *
     * @return
     */
    protected HttpServletRequest getHttpRequest() {
        return (HttpServletRequest) currentRequest.get();
    }

    /**
     * 线程安全
     *
     * @return
     */
    protected HttpServletResponse getHttpResponse() {
        return (HttpServletResponse) currentResponse.get();
    }

    /**
     * 保存session数据
     *
     * @param key
     * @param value
     */
    protected void setSessionAttribute(String key, Object value) {
        getHttpRequest().getSession().setAttribute(key, value);
    }

    /**
     * 获取session数据
     *
     * @param key
     */
    protected Object getSessionAttribute(String key) {
        return getHttpRequest().getSession().getAttribute(key);
    }

}
