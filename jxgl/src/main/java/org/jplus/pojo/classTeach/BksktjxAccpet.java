package org.jplus.pojo.classTeach;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
public class BksktjxAccpet {
    /* 选取年度 */
    private Integer xqnd;
    /*本科生教学课堂id*/
    private Integer bksktjx;
    /*教师工号*/
    private String gh;
    /*学年*/
    private Integer nd;
    /*学期*/
    private Integer xq;

    public Integer getXqnd() {
        return xqnd;
    }

    public void setXqnd(Integer xqnd) {
        this.xqnd = xqnd;
    }

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

    public Integer getKtlxbm() {
        return ktlxbm;
    }

    public void setKtlxbm(Integer ktlxbm) {
        this.ktlxbm = ktlxbm;
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

    /*课堂名称*/
    @NotBlank(message = "课程名称不能为空")
    private String kcmc;
    /*课堂类型*/
    private Integer ktlxbm;
    /*授课班级*/
    @NotBlank(message = "授课班级不能为空")
    private String skbj;
    /*是否双语*/
    private Integer sfsy;
    /*计划学时*/
    @NotNull(message = "计划学时不能为空")
    @Max(value = 1000,message = "请输入合适的计划学时")
    private Integer jhxs;
    /*上课人数*/
    @NotNull(message = "上课人数不能为空")
    @Max(value = 1000,message = "请输入合适的授课人数")
    private Integer skrs;
    /*课堂工作量*/
    private Float jxgzl;
}
