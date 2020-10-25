package org.jplus.pojo.classTeach;

public class Bksktjx {

    /*本科生教学课堂id*/
    private Integer bksktjx;
    /*教师工号*/
    private String gh;
    /*学年*/
    private Integer nd;
    /*学期*/
    private Integer xq;
    /*课堂名称*/
    private String kcmc;

    public Integer getBksktjx() {
        return bksktjx;
    }

    public void setBksktjx(Integer bksktjx) {
        this.bksktjx = bksktjx;
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

    public Integer getXq() {
        return xq;
    }

    public void setXq(Integer xq) {
        this.xq = xq;
    }

    public String getKcmc() {
        return kcmc;
    }

    public void setKcmc(String kcmc) {
        this.kcmc = kcmc;
    }

    public Kclx getKclx() {
        return kclx;
    }

    public void setKclx(Kclx kclx) {
        this.kclx = kclx;
    }

    public String getSkbj() {
        return skbj;
    }

    public void setSkbj(String skbj) {
        this.skbj = skbj;
    }

    public Integer getSfsy() {
        return sfsy;
    }

    public void setSfsy(Integer sfsy) {
        this.sfsy = sfsy;
    }

    public Integer getJhxs() {
        return jhxs;
    }

    public void setJhxs(Integer jhxs) {
        this.jhxs = jhxs;
    }

    public Integer getSkrs() {
        return skrs;
    }

    public void setSkrs(Integer skrs) {
        this.skrs = skrs;
    }

    public Float getJxgzl() {
        return jxgzl;
    }

    public void setJxgzl(Float jxgzl) {
        this.jxgzl = jxgzl;
    }

    /*课堂类型*/
    private Kclx kclx;
    /*授课搬家*/
    private String skbj;
    /*是否双语*/
    private Integer sfsy;
    /*计划学时*/
    private Integer jhxs;
    /*上课人数*/
    private Integer skrs;
    /*课堂工作量*/
    private Float jxgzl;
}
