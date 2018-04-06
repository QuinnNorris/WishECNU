package com.quinnnorris.ssm.service;

import com.quinnnorris.ssm.bean.WishCustom;
import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.ui.Model;

/**
 * Title: WishService
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2018/2/15 下午3:14 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
public interface WishService {


    public BaseJson getPageWishs(int page_now, Model model);

    public BaseJson insertNewWish(WishCustom wishCustom,String phone);

    public boolean selUserWishHasGot(String wishid);

    public BaseJson selWishById(WishCustom wishCustom);

    public BaseJson getWishBySee(WishCustom wishCustom, String phone);

    public void cleanWishStatus(String phone);

    public BaseJson getHeartNumber(String phone);

    public BaseJson getPageWishsGet(int page_now, String phone);

    public BaseJson getPageWishsPost(int page_now, String phone);

    BaseJson getFinWish(int i, Model model);

    BaseJson getWishAll(int i, Model model);
}
