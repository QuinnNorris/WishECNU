package com.quinnnorris.ssm.bean;

/**
 * Title: UserCustom
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/23 下午2:06 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
public class UserCustom extends User {

    private int posth_now;
    private int geth_now;

    public int getPosth_now() {
        return posth_now;
    }

    public void setPosth_now(int posth_now) {
        this.posth_now = posth_now;
    }

    public int getGeth_now() {
        return geth_now;
    }

    public void setGeth_now(int geth_now) {
        this.geth_now = geth_now;
    }

}
