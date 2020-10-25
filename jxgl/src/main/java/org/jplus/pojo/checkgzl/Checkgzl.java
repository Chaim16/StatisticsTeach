package org.jplus.pojo.checkgzl;

public class Checkgzl {
    //工号
    private String gh;

    //姓名
    private String uname;

    //职务
    private String zwmc;

    //额定工作量
    private Float edgzl;

    public String getGh() {
        return gh;
    }

    public void setGh(String gh) {
        this.gh = gh;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getZwmc() {
        return zwmc;
    }

    public void setZwmc(String zwmc) {
        this.zwmc = zwmc;
    }

    public Float getEdgzl() {
        return edgzl;
    }

    public void setEdgzl(Float edgzl) {
        this.edgzl = edgzl;
    }

    public Float getBkszgzl() {
        return bkszgzl;
    }

    public void setBkszgzl(Float bkszgzl) {
        this.bkszgzl = bkszgzl;
    }

    public Float getYjszgzl() {
        return yjszgzl;
    }

    public void setYjszgzl(Float yjszgzl) {
        this.yjszgzl = yjszgzl;
    }

    public Integer getBksshzt() {
        return bksshzt;
    }

    public void setBksshzt(Integer bksshzt) {
        this.bksshzt = bksshzt;
    }

    public Integer getBkstjzt() {
        return bkstjzt;
    }

    public void setBkstjzt(Integer bkstjzt) {
        this.bkstjzt = bkstjzt;
    }

    public Integer getYjsshzt() {
        return yjsshzt;
    }

    public void setYjsshzt(Integer yjsshzt) {
        this.yjsshzt = yjsshzt;
    }

    public Integer getYjstjzt() {
        return yjstjzt;
    }

    public void setYjstjzt(Integer yjstjzt) {
        this.yjstjzt = yjstjzt;
    }

    //本科生教学工作量
    private Float bkszgzl;

    //研究生教学工作量
    private Float yjszgzl;

    //本科生审核状态
    private Integer bksshzt;

    //本科生提交状态
    private Integer bkstjzt;

    //研究生审核状态
    private Integer yjsshzt;

    //研究生提交状态
    private Integer yjstjzt;
}
