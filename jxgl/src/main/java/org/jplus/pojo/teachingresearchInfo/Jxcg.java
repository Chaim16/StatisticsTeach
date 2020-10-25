package org.jplus.pojo.teachingresearchInfo;

public class Jxcg {
// 教学成果ID
    private Integer jxcgid;

//工号
    private String gh;

//年度
    private Integer nd;

    public Integer getJxcgid() {
        return jxcgid;
    }

    public void setJxcgid(Integer jxcgid) {
        this.jxcgid = jxcgid;
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

    public String getCgmc() {
        return cgmc;
    }

    public void setCgmc(String cgmc) {
        this.cgmc = cgmc;
    }

    public Integer getCgdjbm() {
        return cgdjbm;
    }

    public void setCgdjbm(Integer cgdjbm) {
        this.cgdjbm = cgdjbm;
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

    //成果名称
    private String cgmc;


//成果等级编码
    private Integer cgdjbm;


//项目排名
    private Integer xmpm;


//项目总人数
    private Integer zrs;

//教学成果工作量
    private Float gzl;
}
