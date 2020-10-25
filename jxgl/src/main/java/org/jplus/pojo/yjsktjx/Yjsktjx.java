package org.jplus.pojo.yjsktjx;

public class Yjsktjx {
    /*研究生课堂教学自增id*/
    private Integer yjsktjx;
    /*工号*/
    private String gh;
    /*年度*/
    private Integer nd;
    /*学期*/
    private Integer xq;
    /*课程名称*/
    private String kcmc;
    /*课程类型编码*/
    private Yjskclx kclx;
    /*授课对象*/
    private String skdx;

    public Integer getYjsktjx() {
        return yjsktjx;
    }

    public void setYjsktjx(Integer yjsktjx) {
        this.yjsktjx = yjsktjx;
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

    public Yjskclx getKclx() {
        return kclx;
    }

    public void setKclx(Yjskclx kclx) {
        this.kclx = kclx;
    }

    public String getSkdx() {
        return skdx;
    }

    public void setSkdx(String skdx) {
        this.skdx = skdx;
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

    public Float getGzl() {
        return gzl;
    }

    public void setGzl(Float gzl) {
        this.gzl = gzl;
    }

    /*计划学时*/
    private Integer jhxs;
    /*上课人数*/
    private Integer skrs;
    /*研究生课堂教学工作量*/
    private Float gzl;
}
