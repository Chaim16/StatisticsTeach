package org.jplus.pojo.zlgc;

public class ZlgcAccept {
    /* 选取年度 */
    private Integer xqnd;
    //质量工程ID	zlgcid 系统自增
    private Integer zlgcid;
    //工号	gh char(8)
    private String gh;
    //年度	nd int
    private Integer nd;
    //项目类型编码	lxbm int
    private Integer xmlxbm;
    //项目名称	xmmc varchar(50)
    private String xmmc;
    //级别	jb int    1 国家级 2 省级
    private Integer jb;
    //项目排名	xmpm int
    private Integer xmpm;
    //项目总人数	zsr int
    private Integer zrs;
    //质量工程工作量	gzl float
    private Float gzl;

    public Integer getXqnd() {
        return xqnd;
    }

    public void setXqnd(Integer xqnd) {
        this.xqnd = xqnd;
    }

    public Integer getZlgcid() {
        return zlgcid;
    }

    public void setZlgcid(Integer zlgcid) {
        this.zlgcid = zlgcid;
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

    public Integer getXmlxbm() {
        return xmlxbm;
    }

    public void setXmlxbm(Integer xmlxbm) {
        this.xmlxbm = xmlxbm;
    }

    public String getXmmc() {
        return xmmc;
    }

    public void setXmmc(String xmmc) {
        this.xmmc = xmmc;
    }

    public Integer getJb() {
        return jb;
    }

    public void setJb(Integer jb) {
        this.jb = jb;
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

}
