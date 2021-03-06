package org.jplus.pojo;

public class Users {
    //工号
    private String gh;
    //院系编码
    private Integer yxbm;
    //用户名
    private String uname;
    //密码
    private String upassword;
    //角色
    private Integer actor;

    @Override
    public String toString() {
        return "Users{" +
                "gh='" + gh + '\'' +
                ", yxbm=" + yxbm +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                ", actor=" + actor +
                '}';
    }

    public String getGh() {
        return gh;
    }

    public void setGh(String gh) {
        this.gh = gh;
    }

    public int getYxbm() {
        return yxbm;
    }

    public void setYxbm(int yxbm) {
        this.yxbm = yxbm;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public int getActor() {
        return actor;
    }

    public void setActor(int actor) {
        this.actor = actor;
    }
}
