package org.jplus.mapper;

import org.jplus.pojo.basisInfo.*;

import java.util.List;


public interface JbxxMapper {
    Jbxx getJbxxInfo(String gh, Integer xqnd);

    List<Yxbm> getYxbmInfo();

    List<Zwbm> getZwbmInfo();

    List<Zcbm> getZcbmInfo();

    List<Gwlxbm> getGwlxbmInfo();

    void updateBasisInfo(JbxxAccpet jbxxAccpet);

    void addJbxx(String gh, Integer xqnd);


    Float getBksKtjxgzl(String gh, Integer xqnd);

    Float getBksSjjxgzl(String gh, Integer xqnd);

    Float getBksZlgcgzl(String gh, Integer xqnd);

    Float getZdxsgzl(String gh, Integer xqnd);

    Float getJsjsgzl(String gh, Integer xqnd);

    Float getLwgzl(String gh, Integer xqnd);

    Float getQtgzl(String gh, Integer xqnd);

    Float getYjsSjjxgzl(String gh);

    Float getJsgzl(String gh);

    Float getYjsZdgzl(String gh);

    Float getYjsQtgzl(String gh);
}
