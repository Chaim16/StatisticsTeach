package org.jplus.pojo.yjssjjx;

import lombok.Data;


@Data
public class Yjssxlxbm {
    /*研究生实习类型编码*/
    private Integer yjssxlxbm;
    /*研究生实习类型名称*/
    private String yjssxlxmc;

    public Integer getYjssxlxbm() {
        return yjssxlxbm;
    }

    public void setYjssxlxbm(Integer yjssxlxbm) {
        this.yjssxlxbm = yjssxlxbm;
    }

    public String getYjssxlxmc() {
        return yjssxlxmc;
    }

    public void setYjssxlxmc(String yjssxlxmc) {
        this.yjssxlxmc = yjssxlxmc;
    }
}
