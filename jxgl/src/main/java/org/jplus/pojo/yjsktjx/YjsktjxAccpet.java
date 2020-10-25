package org.jplus.pojo.yjsktjx;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class YjsktjxAccpet {
    /*研究生课堂教学自增id*/
    private Integer yjsktjx;
    /*工号*/
    private String gh;
    /*年度*/
    private Integer nd;
    /*学期*/
    private Integer xq;
    /*课程名称*/
    @NotBlank(message = "课程名称不能为空")
    private String kcmc;
    /*课程类型编码*/
    private Integer kclx;

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

    public Integer getKclx() {
        return kclx;
    }

    public void setKclx(Integer kclx) {
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

    /*授课对象*/
    @NotBlank(message = "授课对象不能为空")
    private String skdx;
    /*计划学时*/
    @NotNull(message = "计划学时不能为空")
    @Max(value = 1000, message = "请输入合适的计划学时")
    private Integer jhxs;
    /*上课人数*/
    @NotNull(message = "上课人数不能为空")
    @Max(value = 1000, message = "请输入合适的授课人数")
    private Integer skrs;
    /*研究生课堂教学工作量*/
    private Float gzl;
}
