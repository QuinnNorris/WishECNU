package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.WishCustom;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Title: WishCustomMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2018/2/15 下午3:28 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
@Repository("wishCustomMapper")
public interface WishCustomMapper {

    public WishCustom selWishByIdStatus(WishCustom wishCustom);

    public void insertNewWishs(WishCustom wishCustom);

    public void deleteWishById(WishCustom wishCustom);

    public WishCustom selWishById(WishCustom wishCustom);

    public WishCustom selWishByGetIdAndStatus(WishCustom wishCustom);

    public void addOneCareById(WishCustom wishCustom);

    public void updateGetIdByWishId(WishCustom wishCustom);

    public WishCustom selWishByWishId(WishCustom wishCustom);

    public List<WishCustom> Time(WishCustom wishCustom);

    public List<WishCustom> Cares(WishCustom wishCustom);

    public List<WishCustom> selByTimePage(WishCustom wishCustom);

    public void updateGetIdByTimeInStatus4(WishCustom wishCustom);

    public void updatePostIdByTimeInStatus0(WishCustom wishCustom);

    public void updatePostIdByTimeInStatus1(WishCustom wishCustom);

    public List<WishCustom> selWishNumByStatus0(WishCustom wishCustom);

    public List<WishCustom> selWishNumByStatus1(WishCustom wishCustom);

    public List<WishCustom> selGetByPage(WishCustom wishCustom);

    public List<WishCustom> selPostByPage(WishCustom wishCustom);

    public void updateGetTimeByWishId(WishCustom wishCustom);

    int countAllWishInWishList();

    List<WishCustom> selPostByStatus(WishCustom wishCustom);

    List<WishCustom> selPostByStatusall(WishCustom wishCustom);

    void updateAllStatus(WishCustom wishCustom);

    int countAllWishInWishListFin();

    int countAllWishInWishListAll();
}
