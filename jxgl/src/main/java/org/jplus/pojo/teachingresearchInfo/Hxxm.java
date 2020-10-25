package org.jplus.pojo.teachingresearchInfo;

public class Hxxm {
//横向项目id
    private Integer hxxmid;

//工号
    private String gh;

//年度
    private Integer nd;

//横向项目名称
    private String xmmc;

//到账经费
    private Float dzjf;

    public Integer getHxxmid() {
        return hxxmid;
    }

    public void setHxxmid(Integer hxxmid) {
        this.hxxmid = hxxmid;
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

    public String getXmmc() {
        return xmmc;
    }

    public void setXmmc(String xmmc) {
        this.xmmc = xmmc;
    }

    public Float getDzjf() {
        return dzjf;
    }

    public void setDzjf(Float dzjf) {
        this.dzjf = dzjf;
    }

    public Integer getXmpm() {
        return xmpm;
    }

    public void setXmpm(Integer xmpm) {
        this.xmpm = xmpm;
    }

    public Integer getZrs() {
        return zrs;
    }

    public void setZrs(Integer zrs) {
        this.zrs = zrs;
    }

    public Float getGzl() {
        return gzl;
    }

    public void setGzl(Float gzl) {
        this.gzl = gzl;
    }

    //项目排名
    private Integer xmpm;

//项目总人数
    private Integer zrs;

//横向工作量
    private Float gzl;
}
