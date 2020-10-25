package org.jplus.dto;

import lombok.Getter;
import lombok.Setter;
import org.jplus.pojo.bks.Bkssjjx;


@Getter@Setter
public class BkssjjxEx extends Bkssjjx{

    /*
    * 对Bkssjjx的扩展封装，用于返回给页面
    *
    * */
    private float zdsxgzl;
    private float wgsjgzl;
    private float zdlwgzl;

    public float getZdsxgzl() {
        return zdsxgzl;
    }

    public void setZdsxgzl(float zdsxgzl) {
        this.zdsxgzl = zdsxgzl;
    }

    public float getWgsjgzl() {
        return wgsjgzl;
    }

    public void setWgsjgzl(float wgsjgzl) {
        this.wgsjgzl = wgsjgzl;
    }

    public float getZdlwgzl() {
        return zdlwgzl;
    }

    public void setZdlwgzl(float zdlwgzl) {
        this.zdlwgzl = zdlwgzl;
    }
}
