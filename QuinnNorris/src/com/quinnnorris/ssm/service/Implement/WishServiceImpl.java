package com.quinnnorris.ssm.service.Implement;

import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.bean.WishCustom;
import com.quinnnorris.ssm.mapper.UserCustomMapper;
import com.quinnnorris.ssm.mapper.WishCustomMapper;
import com.quinnnorris.ssm.service.WishService;
import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

/**
 * Title: WishServiceImpl
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2018/2/15 下午3:14 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
@Service("wishService")
public class WishServiceImpl implements WishService {

    @Autowired
    WishCustomMapper wishCustomMapper;

    @Autowired
    UserCustomMapper userCustomMapper;

    public BaseJson getPageWishs(int page_now, Model model) {

        Date serTime = new Date();
        long befTime = serTime.getTime() - 86400000;
        long nowTime = serTime.getTime();
        WishCustom wishCustom = new WishCustom();
        wishCustom.setPageSize(16);
        wishCustom.setStartPos(page_now * 16);
        wishCustom.setSearchTime(befTime);

        List<WishCustom> wishCustoms = wishCustomMapper.selByTimePage(wishCustom);

        int counts = wishCustomMapper.countAllWishInWishList();
        model.addAttribute("all_page", counts / 16);
        if (wishCustoms == null) {
            BaseJson baseJ = new BaseJson();
            baseJ.setBeanObject(0);
            return baseJ;
        }
        List<Map<String, String>> list = new ArrayList<>();
        for (WishCustom custom : wishCustoms) {
            Map<String, String> map = new HashMap<>();
            map.put("wish_id", custom.getWish_id() + "");
            map.put("titles", custom.getTitles());
            map.put("nickname", custom.getNickname());
            if (custom.getSexs() == 1/*男*/) map.put("sexsclass", "label-primary");
            else map.put("sexsclass", "label-danger");
            map.put("headp", custom.getHeadp());
            int hour = (int) ((nowTime - custom.getPub_time()) / 3600000);
            int min = (int) ((nowTime - custom.getPub_time() - 3600000 * hour) / 60000);
            if (hour >= 1)
                map.put("times", hour + "时" + min + "分");
            else
                map.put("times", min + "分");
            list.add(map);
        }
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(list);
        baseJson.setBeanObject(list.size());
        return baseJson;
    }

    @Override
    public BaseJson getFinWish(int page_now, Model model) {
        WishCustom wishCustom = new WishCustom();
        wishCustom.setPageSize(16);
        wishCustom.setStartPos(page_now * 16);

        List<WishCustom> wishCustoms = wishCustomMapper.selPostByStatus(wishCustom);

        int counts = wishCustomMapper.countAllWishInWishListFin();
        model.addAttribute("all_page", counts / 16);

        if (wishCustoms == null) {
            BaseJson baseJ = new BaseJson();
            baseJ.setBeanObject(0);
            return baseJ;
        }
        List<Map<String, String>> list = new ArrayList<>();
        for (WishCustom custom : wishCustoms) {
            Map<String, String> map = new HashMap<>();
            map.put("wish_id", custom.getWish_id() + "");
            map.put("titles", custom.getTitles());
            map.put("nickname", custom.getNickname());
            if (custom.getSexs() == 1)
                map.put("statusclass", "label-primary");
            else
                map.put("statusclass", "label-danger");
            map.put("status", "已完成");
            map.put("headp", custom.getHeadp());
            list.add(map);
        }
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(list);
        baseJson.setBeanObject(list.size());
        return baseJson;
    }

    @Override
    public BaseJson getWishAll(int page_now, Model model) {
        WishCustom wishCustom = new WishCustom();
        wishCustom.setPageSize(16);
        wishCustom.setStartPos(page_now * 16);

        WishCustom wishCustom1 = new WishCustom();
        Date serTime = new Date();
        long befTime = serTime.getTime() - 86400000;
        wishCustom1.setSearchTime(befTime);
        wishCustomMapper.updateAllStatus(wishCustom1);

        List<WishCustom> wishCustoms = wishCustomMapper.selPostByStatusall(wishCustom);
        int counts = wishCustomMapper.countAllWishInWishListAll();
        model.addAttribute("all_page", counts / 16);

        if (wishCustoms == null) {
            BaseJson baseJ = new BaseJson();
            baseJ.setBeanObject(0);
            return baseJ;
        }
        List<Map<String, String>> list = new ArrayList<>();
        for (WishCustom custom : wishCustoms) {
            Map<String, String> map = new HashMap<>();
            map.put("wish_id", custom.getWish_id() + "");
            map.put("titles", custom.getTitles());
            map.put("nickname", custom.getNickname());
            if (custom.getSexs() == 1)
                map.put("statusclass", "label-primary");
            else
                map.put("statusclass", "label-danger");
            if (custom.getWish_status() == 0)
                map.put("status", "待接受");
            if (custom.getWish_status() == 1)
                map.put("status", "进行中");
            if (custom.getWish_status() == 2)
                map.put("status", "已完成");
            if (custom.getWish_status() == 3)
                map.put("status", "已过期");
            map.put("headp", custom.getHeadp());
            list.add(map);
        }
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(list);
        baseJson.setBeanObject(list.size());
        return baseJson;
    }

    public BaseJson getPageWishsGet(int page_now, String phone) {

        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom = userCustomMapper.selectUserByPhone(userCustom);
        WishCustom wishCustom = new WishCustom();
        wishCustom.setPageSize(16);
        wishCustom.setStartPos(page_now * 16);
        wishCustom.setGet_id(userCustom.getUser_id());

        List<WishCustom> wishCustoms = wishCustomMapper.selGetByPage(wishCustom);

        if (wishCustoms == null) {
            BaseJson baseJ = new BaseJson();
            baseJ.setBeanObject(0);
            return baseJ;
        }
        List<Map<String, String>> list = new ArrayList<>();
        for (WishCustom custom : wishCustoms) {
            Map<String, String> map = new HashMap<>();
            map.put("wish_id", custom.getWish_id() + "");
            map.put("titles", custom.getTitles());
            map.put("nickname", custom.getNickname());
            if (custom.getWish_status() == 1) {
                map.put("statusclass", "label-primary");
                map.put("status", "进行中");
            }
            if (custom.getWish_status() == 2) {
                map.put("statusclass", "label-danger");
                map.put("status", "已完成");
            }
            if (custom.getWish_status() == 3) {
                map.put("statusclass", "label-default");
                map.put("status", "已过期");
            }
            map.put("headp", custom.getHeadp());
            list.add(map);
        }
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(list);
        baseJson.setBeanObject(list.size());
        return baseJson;
    }

    public BaseJson getPageWishsPost(int page_now, String phone) {

        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom = userCustomMapper.selectUserByPhone(userCustom);
        WishCustom wishCustom = new WishCustom();
        wishCustom.setPageSize(16);
        wishCustom.setStartPos(page_now * 16);
        wishCustom.setPost_id(userCustom.getUser_id());

        List<WishCustom> wishCustoms = wishCustomMapper.selPostByPage(wishCustom);

        if (wishCustoms == null) {
            BaseJson baseJ = new BaseJson();
            baseJ.setBeanObject(0);
            return baseJ;
        }
        List<Map<String, String>> list = new ArrayList<>();
        for (WishCustom custom : wishCustoms) {
            Map<String, String> map = new HashMap<>();
            map.put("wish_id", custom.getWish_id() + "");
            map.put("titles", custom.getTitles());
            map.put("nickname", custom.getNickname());
            if (custom.getWish_status() == 0) {
                map.put("statusclass", "label-success");
                map.put("status", "待接受");
            }
            if (custom.getWish_status() == 1) {
                map.put("statusclass", "label-primary");
                map.put("status", "进行中");
            }
            if (custom.getWish_status() == 2) {
                map.put("statusclass", "label-danger");
                map.put("status", "已完成");
            }
            if (custom.getWish_status() == 3) {
                map.put("statusclass", "label-default");
                map.put("status", "已过期");
            }
            map.put("headp", custom.getHeadp());
            list.add(map);
        }
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(list);
        baseJson.setBeanObject(list.size());
        return baseJson;
    }

    public void cleanWishStatus(String phone) {

        Date serTime = new Date();
        long befTime = serTime.getTime() - 86400000;
        long nowTime = serTime.getTime();
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom = userCustomMapper.selectUserByPhone(userCustom);
        int id = userCustom.getUser_id();
        WishCustom wishCustom = new WishCustom();
        wishCustom.setGet_id(id);
        wishCustom.setSearchTime(befTime);
        wishCustom.setPost_id(id);
        wishCustomMapper.updateGetIdByTimeInStatus4(wishCustom);
        List<WishCustom> wishCustoms0 = wishCustomMapper.selWishNumByStatus0(wishCustom);
        List<WishCustom> wishCustoms1 = wishCustomMapper.selWishNumByStatus1(wishCustom);
        userCustom.setPosth_now(5 - wishCustoms0.size());
        userCustom.setGeth_now(5 - wishCustoms1.size());
        userCustomMapper.updateUserHeart(userCustom);

    }

    public BaseJson getHeartNumber(String phone) {
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom = userCustomMapper.selectUserByPhone(userCustom);
        Map<String, String> map = new HashMap<>();
        map.put("posth", userCustom.getPost_h() + "");
        map.put("geth", userCustom.getGet_h() + "");
        return new BaseJson(map);
    }

    public BaseJson getWishBySee(WishCustom wishCustom, String phone) {

        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom = userCustomMapper.selectUserByPhone(userCustom);
        if (userCustom.getGet_h() == 0) return new BaseJson("01");
        wishCustom = wishCustomMapper.selWishByWishId(wishCustom);
        if (wishCustom.getWish_status() != 0) return new BaseJson("00");
        if (wishCustom.getPost_id() == userCustom.getUser_id()) return new BaseJson("02");
        wishCustom.setGet_id(userCustom.getUser_id());
        wishCustomMapper.updateGetIdByWishId(wishCustom);

        wishCustom = wishCustomMapper.selWishByWishId(wishCustom);
        if (wishCustom.getGet_id() == userCustom.getUser_id()) {
            wishCustom.setGet_time(new Date().getTime());
            wishCustomMapper.updateGetTimeByWishId(wishCustom);
            userCustomMapper.updateGetHByUserid(userCustom);
            return new BaseJson("1");
        } else return new BaseJson("00");

    }

    public boolean selUserWishHasGot(String wishid) {
        WishCustom wishCustom = new WishCustom();
        wishCustom.setWish_id(Integer.parseInt(wishid));
        wishCustom.setWish_status(2);
        wishCustomMapper.deleteWishById(wishCustom);
        return true;
    }

    public BaseJson insertNewWish(WishCustom wishCustom, String phone) {
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom = userCustomMapper.selectUserByPhone(userCustom);
        int id = userCustom.getUser_id();
        if (userCustom.getPost_h() == 0) return new BaseJson("01");
        wishCustom.setPost_id(id);
        wishCustom.setWish_status(0);
        wishCustom.setCares(0);
        wishCustom.setDate_pub_time(new Date());
        wishCustom.setPub_time(new Date().getTime());
        wishCustomMapper.insertNewWishs(wishCustom);
        userCustomMapper.updateSubPostHByUserid(userCustom);
        BaseJson baseJson = new BaseJson(wishCustom);
        baseJson.setErrorCode("00");
        return baseJson;
    }

    public BaseJson selWishById(WishCustom wishCustom) {
        wishCustomMapper.addOneCareById(wishCustom);
        wishCustom = wishCustomMapper.selWishByWishId(wishCustom);
        BaseJson baseJson = new BaseJson();
        baseJson.setBeanObject(wishCustom);
        return baseJson;
    }

}
