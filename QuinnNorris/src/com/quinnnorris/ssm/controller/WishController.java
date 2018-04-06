package com.quinnnorris.ssm.controller;

import com.quinnnorris.ssm.bean.Wish;
import com.quinnnorris.ssm.bean.WishCustom;
import com.quinnnorris.ssm.service.Implement.WishServiceImpl;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.DateUtil;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;

/**
 * Title: WishController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2018/2/15 下午3:13 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class WishController {

    @Autowired
    private WishServiceImpl wishService;

    @RequestMapping("/wishlist")
    public String toChooseproPage(Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";

        model.addAttribute("page_now", "0");
        model.addAttribute("mid_page", 3);

        BaseJson baseJson = wishService.getPageWishs(0, model);
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "wishlist";
    }

    @RequestMapping("/wishlistlist")
    public String toSomePage(@RequestParam String to_page, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        model.addAttribute("page_now", to_page);
        if (Integer.parseInt(to_page) <= 2)
            model.addAttribute("mid_page", 3);
        else
            model.addAttribute("mid_page", Integer.parseInt(to_page)+1);
        BaseJson baseJson = wishService.getPageWishs(Integer.parseInt(to_page), model);
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "wishlist";
    }

    @RequestMapping("/wishlistfin")
    public String toChooseprofinPage(Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";

        model.addAttribute("page_now", "0");
        model.addAttribute("mid_page", 3);

        BaseJson baseJson = wishService.getFinWish(0, model);
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "wishlistfin";
    }

    @RequestMapping("/wishlistlistfin")
    public String toSomefinPage(@RequestParam String to_page, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        model.addAttribute("page_now", to_page);
        if (Integer.parseInt(to_page) <= 2)
            model.addAttribute("mid_page", 3);
        else
            model.addAttribute("mid_page", Integer.parseInt(to_page)+1);
        BaseJson baseJson = wishService.getFinWish(Integer.parseInt(to_page), model);
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "wishlistfin";
    }

    @RequestMapping("/seewish")
    public String toSeeawishPage(@RequestParam String wishid, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        WishCustom wishCustom = new WishCustom();
        wishCustom.setWish_id(Integer.parseInt(wishid));
        BaseJson baseJson = wishService.selWishById(wishCustom);
        wishCustom = (WishCustom) baseJson.getBeanObject();
        model.addAttribute("seetitle", wishCustom.getTitles());
        model.addAttribute("seeheadp", wishCustom.getHeadp());
        model.addAttribute("seenickname", wishCustom.getNickname());
        model.addAttribute("seeinners", wishCustom.getInners());
        model.addAttribute("wishid", wishid);
        if (wishCustom.getWish_status() == 0) model.addAttribute("seestatus", "待接受");
        if (wishCustom.getWish_status() == 3) model.addAttribute("seestatus", "已过期");
        if (wishCustom.getWish_status() == 1) model.addAttribute("seestatus", "进行中");
        if (wishCustom.getWish_status() == 2) model.addAttribute("seestatus", "已完成");

        if (wishCustom.getSexs() == 1) {
            model.addAttribute("seesexscolor", "navy-bg");
            model.addAttribute("seesexbutton", "btn-primary");
        } else {
            model.addAttribute("seesexscolor", "red-bg");
            model.addAttribute("seesexbutton", "btn-danger");
        }
        return "seewish";
    }

    @RequestMapping("/wishlistall")
    public String toChooseproallPage(Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";

        model.addAttribute("page_now", "0");
        model.addAttribute("mid_page", 3);

        BaseJson baseJson = wishService.getWishAll(0, model);
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "wishlistall";
    }

    @RequestMapping("/wishlistlistall")
    public String toSomeallPage(@RequestParam String to_page, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        model.addAttribute("page_now", to_page);
        if (Integer.parseInt(to_page) <= 2)
            model.addAttribute("mid_page", 3);
        else
            model.addAttribute("mid_page", Integer.parseInt(to_page)+1);
        BaseJson baseJson = wishService.getWishAll(Integer.parseInt(to_page), model);
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "wishlistall";
    }

    @RequestMapping("/home")
    public String toHomePage(Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        wishService.cleanWishStatus((String) httpSession.getAttribute("phone"));
        BaseJson baseJson = wishService.getHeartNumber((String) httpSession.getAttribute("phone"));
        Map<String, String> map = (Map<String, String>) (baseJson.getObject());
        model.addAttribute("have_post", map.get("posth"));
        model.addAttribute("have_get", map.get("geth"));
        return "home";
    }

    @RequestMapping("/get")
    public String toGetWishPage(Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        wishService.cleanWishStatus((String) httpSession.getAttribute("phone"));
        model.addAttribute("page_now", "0");
        BaseJson baseJson = wishService.getPageWishsGet(0, (String) httpSession.getAttribute("phone"));
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "get";
    }

    @RequestMapping("/getlist")
    public String toGetListPage(@RequestParam String to_page, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        model.addAttribute("page_now", to_page);
        BaseJson baseJson = wishService.getPageWishsGet(Integer.parseInt(to_page), (String) httpSession.getAttribute("phone"));
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "get";
    }

    @RequestMapping("/post")
    public String toPostWishPage(Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        wishService.cleanWishStatus((String) httpSession.getAttribute("phone"));
        model.addAttribute("page_now", "0");
        BaseJson baseJson = wishService.getPageWishsPost(0, (String) httpSession.getAttribute("phone"));
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "post";
    }

    @RequestMapping("/postlist")
    public String toPostListPage(@RequestParam String to_page, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        model.addAttribute("page_now", to_page);
        BaseJson baseJson = wishService.getPageWishsPost(Integer.parseInt(to_page), (String) httpSession.getAttribute("phone"));
        model.addAttribute("wishs", baseJson.getObject());
        model.addAttribute("wishs_size", baseJson.getBeanObject());
        return "post";
    }

    @RequestMapping("/wish")
    public String toSeewishPage(@RequestParam String wishid, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        WishCustom wishCustom = new WishCustom();
        wishCustom.setWish_id(Integer.parseInt(wishid));
        BaseJson baseJson = wishService.selWishById(wishCustom);
        wishCustom = (WishCustom) baseJson.getBeanObject();
        model.addAttribute("seetitle", wishCustom.getTitles());
        model.addAttribute("seeheadp", wishCustom.getHeadp());
        model.addAttribute("seenickname", wishCustom.getNickname());
        model.addAttribute("seeinners", wishCustom.getInners());
        model.addAttribute("seecares", wishCustom.getCares());
        model.addAttribute("wishid", wishid);
        if (wishCustom.getSexs() == 1) {
            model.addAttribute("seesexscolor", "navy-bg");
            model.addAttribute("seesexsbutton", "btn-primary");
        } else {
            model.addAttribute("seesexscolor", "red-bg");
            model.addAttribute("seesexsbutton", "btn-danger");
        }
        Date serTime = new Date();
        long nowTime = serTime.getTime();
        int hour = (int) ((nowTime - wishCustom.getPub_time()) / 3600000);
        int min = (int) ((nowTime - wishCustom.getPub_time() - 3600000 * hour) / 60000);
        if (hour >= 1)
            model.addAttribute("seetime", hour + "时" + min + "分");
        else
            model.addAttribute("seetime", min + "分");
        return "wish";
    }

    @RequestMapping(value = "/comethiswish", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson toComethisPage(@RequestParam String wishid, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        WishCustom wishCustom = new WishCustom();
        wishCustom.setWish_id(Integer.parseInt(wishid));
        BaseJson baseJson = wishService.getWishBySee(wishCustom, (String) httpSession.getAttribute("phone"));
        return baseJson;
    }

    @RequestMapping("/getwish")
    public String toGetwishPage(@RequestParam String wishid, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        WishCustom wishCustom = new WishCustom();
        wishCustom.setWish_id(Integer.parseInt(wishid));
        BaseJson baseJson = wishService.selWishById(wishCustom);
        wishCustom = (WishCustom) baseJson.getBeanObject();
        model.addAttribute("seetitle", wishCustom.getTitles());
        model.addAttribute("seeheadp", wishCustom.getHeadp());
        model.addAttribute("seenickname", wishCustom.getNickname());
        model.addAttribute("seeinners", wishCustom.getInners());
        model.addAttribute("wishid", wishid);
        if (wishCustom.getConn_type() == 0) model.addAttribute("seeaddrtype", "QQ");
        if (wishCustom.getConn_type() == 1) model.addAttribute("seeaddrtype", "微信");
        if (wishCustom.getConn_type() == 2) model.addAttribute("seeaddrtype", "手机号");
        model.addAttribute("seeaddr", wishCustom.getConn());
        if (wishCustom.getWish_status() == 1) model.addAttribute("seestatus", "进行中");
        if (wishCustom.getWish_status() == 2) model.addAttribute("seestatus", "已完成");
        if (wishCustom.getWish_status() == 3) model.addAttribute("seestatus", "已过期");
        if (wishCustom.getSexs() == 1) model.addAttribute("seesexscolor", "navy-bg");
        else model.addAttribute("seesexscolor", "red-bg");
        return "getwish";
    }

    @RequestMapping("/postwish")
    public String toPostwishPage(@RequestParam String wishid, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        WishCustom wishCustom = new WishCustom();
        wishCustom.setWish_id(Integer.parseInt(wishid));
        BaseJson baseJson = wishService.selWishById(wishCustom);
        wishCustom = (WishCustom) baseJson.getBeanObject();
        model.addAttribute("seetitle", wishCustom.getTitles());
        model.addAttribute("seeheadp", wishCustom.getHeadp());
        model.addAttribute("seenickname", wishCustom.getNickname());
        model.addAttribute("seeinners", wishCustom.getInners());
        model.addAttribute("wishid", wishid);
        if (wishCustom.getWish_status() == 0) model.addAttribute("seestatus", "待接受");
        if (wishCustom.getWish_status() == 1) model.addAttribute("seestatus", "进行中");
        if (wishCustom.getWish_status() == 2) model.addAttribute("seestatus", "已完成");
        if (wishCustom.getWish_status() == 3) model.addAttribute("seestatus", "已过期");
        if (wishCustom.getSexs() == 1) {
            model.addAttribute("seesexscolor", "navy-bg");
            model.addAttribute("seesexbutton", "btn-primary");
        } else {
            model.addAttribute("seesexscolor", "red-bg");
            model.addAttribute("seesexbutton", "btn-danger");
        }
        return "postwish";
    }

    @RequestMapping(value = "/overwish", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson toOverWishPage(@RequestParam String wishid, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        wishService.selUserWishHasGot(wishid);
        return new BaseJson("1");
    }


    @RequestMapping("/create")
    public String toCreatePage(Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        return "create";
    }


    @RequestMapping(value = "/newwish", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson toChooseproPage(@RequestParam String nickname, @RequestParam String titles,
                                    @RequestParam String inners, @RequestParam String conn_type,
                                    @RequestParam String conn, @RequestParam String sexs,
                                    @RequestParam String headp, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        WishCustom wishCustom = new WishCustom();
        wishCustom.setNickname(nickname);
        wishCustom.setTitles(titles);
        wishCustom.setInners(inners);
        wishCustom.setConn_type(Integer.parseInt(conn_type));
        wishCustom.setConn(conn);
        wishCustom.setSexs(Integer.parseInt(sexs));
        wishCustom.setHeadp(headp);
        return wishService.insertNewWish(wishCustom, (String) httpSession.getAttribute("phone"));
    }

    /*@RequestMapping("*")
    public String to404() {
        return "404";
    }*/

}
