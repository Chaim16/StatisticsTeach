package org.jplus.service;

import org.jplus.pojo.Tjzt.Tjb;

import java.util.List;

/**
 * 统计表
 * */
public interface TjbService {
    // MH 添加
    Tjb getTjbByGh(String gh);

    List<Tjb> getAllTjb(int nd);

    List<Tjb> getAllTjbByYxbm(int usersYxbm, Integer currentYear);
}
