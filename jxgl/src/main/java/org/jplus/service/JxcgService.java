package org.jplus.service;


import org.jplus.pojo.teachingresearchInfo.Jxcg;
import org.jplus.pojo.teachingresearchInfo.Jxcgdj;

import java.util.List;


public interface JxcgService {
    List<Jxcg> getJxcgInfo(String gh, Integer xqnd);

    int addJxcg(Jxcg jxcg);

    int deleteJxcg(Integer id, Integer xqnd);

    List<Jxcgdj> getJxcgdjInfo();
}
