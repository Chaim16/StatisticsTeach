package org.jplus.pojo.jbjsyxkjs;

public class JBJSYXKJSAccept {
    //主键
    private Integer xkjsid;
    //工号
    private String gh;
    //年度
    private Integer nd;
    //是否撰写培养方案
    private Integer sfzxpyfa;
    //课堂大纲门数
    private Integer  kddgms;
    //实验大纲门数
    private Integer sydgms;
    //工作量
    private Float gzl;

    public Integer getXkjsid() {
        return xkjsid;
    }

    public void setXkjsid(Integer xkjsid) {
        this.xkjsid = xkjsid;
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

    public Integer getSfzxpyfa() {
        return sfzxpyfa;
    }

    public void setSfzxpyfa(Integer sfzxpyfa) {
        this.sfzxpyfa = sfzxpyfa;
    }

    public Integer getKddgms() {
        return kddgms;
    }

    public void setKddgms(Integer kddgms) {
        this.kddgms = kddgms;
    }

    public Integer getSydgms() {
        return sydgms;
    }

    public void setSydgms(Integer sydgms) {
        this.sydgms = sydgms;
    }

    public Float getGzl() {
        return gzl;
    }

    public void setGzl(Float gzl) {
        this.gzl = gzl;
    }

}
