package com.quinnnorris.ssm.bean;

import java.util.Date;

/**
 * Title: WishCustom
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2018/2/14 下午10:30 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
public class WishCustom extends Wish {

    private int startPos;
    private int pageSize;
    private long searchTime;


    public int getStartPos() {
        return startPos;
    }

    public void setStartPos(int startPos) {
        this.startPos = startPos;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getSearchTime() {
        return searchTime;
    }

    public void setSearchTime(long searchTime) {
        this.searchTime = searchTime;
    }

}
