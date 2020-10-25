package org.jplus.pojo.basisInfo;

/*用来接收前台数据*/
public class JbxxAccpet {
    /*基本信息id*/
    private Integer jbxxid;
    /*工号*/
    private String gh;
    /*年度*/
    private Integer nd;
    /* 选取年度 */
    private Integer xqnd;
    /*院系编码*/
    private Integer yxbm;

    public Integer getXqnd() {
        return xqnd;
    }

    public void setXqnd(Integer xqnd) {
        this.xqnd = xqnd;
    }

    /*职务编码*/
    private Integer zwbm;
    /*职称编码*/
    private Integer zcbm;
    /*岗位类型编码*/
    private Integer gwlxbm;
    /*是否新入职*/
    private Integer sfxrz;
    /*额定工作量*/
    private Float edgzl;

    /*本科生最低授课*/
    private Float bkszdsk;

    public Integer getJbxxid() {
        return jbxxid;
    }

    public void setJbxxid(Integer jbxxid) {
        this.jbxxid = jbxxid;
    }

    public String getGh() {
        return gh;
    }

    public void setGh(String gh) {
        this.gh = gh;
    }

    public Integer getNd() {
        return nd;
    }

    public void setNd(Integer nd) {
        this.nd = nd;
    }

    public Integer getYxbm() {
        return yxbm;
    }

    public void setYxbm(Integer yxbm) {
        this.yxbm = yxbm;
    }

    public Integer getZwbm() {
        return zwbm;
    }

    public void setZwbm(Integer zwbm) {
        this.zwbm = zwbm;
    }

    public Integer getZcbm() {
        return zcbm;
    }

    public void setZcbm(Integer zcbm) {
        this.zcbm = zcbm;
    }

    public Integer getGwlxbm() {
        return gwlxbm;
    }

    public void setGwlxbm(Integer gwlxbm) {
        this.gwlxbm = gwlxbm;
    }

    public Integer getSfxrz() {
        return sfxrz;
    }

    public void setSfxrz(Integer sfxrz) {
        this.sfxrz = sfxrz;
    }

    public Float getEdgzl() {
        return edgzl;
    }

    public void setEdgzl(Float edgzl) {
        this.edgzl = edgzl;
    }

    public Float getBkszdsk() {
        return bkszdsk;
    }

    public void setBkszdsk(Float bkszdsk) {
        this.bkszdsk = bkszdsk;
    }
}
