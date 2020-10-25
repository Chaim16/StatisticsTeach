package org.jplus.pojo.basisInfo;

import org.jplus.pojo.Users;


/*教师的基本信息*/
public class Jbxx {
    /*教师基本信息id*/
    private Integer jbxxid;
    /*工号*/
    private Users users;
    /*院系*/
    private Yxbm yxbm;
    /*职务*/
    private Zwbm zwbm;
    /*职称*/
    private Zcbm zcbm;
    /*岗位类型*/
    private Gwlxbm gwlxbm;
    /*是否新入职,0,1表示*/
    private Integer sfxrz;
    /*教师额定工作量*/
    private Float edgzl;
    /*本科生最低授课*/
    private Float bkszdsk;

    public Integer getJbxxid() {
        return jbxxid;
    }

    public void setJbxxid(Integer jbxxid) {
        this.jbxxid = jbxxid;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Yxbm getYxbm() {
        return yxbm;
    }

    public void setYxbm(Yxbm yxbm) {
        this.yxbm = yxbm;
    }

    public Zwbm getZwbm() {
        return zwbm;
    }

    public void setZwbm(Zwbm zwbm) {
        this.zwbm = zwbm;
    }

    public Zcbm getZcbm() {
        return zcbm;
    }

    public void setZcbm(Zcbm zcbm) {
        this.zcbm = zcbm;
    }

    public Gwlxbm getGwlxbm() {
        return gwlxbm;
    }

    public void setGwlxbm(Gwlxbm gwlxbm) {
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
