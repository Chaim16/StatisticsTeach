package org.jplus.service.impl;

import org.jplus.mapper.TjbMapper;
import org.jplus.pojo.Tjzt.Tjb;
import org.jplus.service.TjbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TjbServiceImpl implements TjbService {

    @Autowired
    private TjbMapper tjbMapper;

    @Override
    public Tjb getTjbByGh(String gh) {
        return tjbMapper.getTjbByGh(gh);
    }

    @Override
    public List<Tjb> getAllTjb(int nd) {
        return tjbMapper.getAllTjb(nd);
    }

    @Override
    public List<Tjb> getAllTjbByYxbm(int usersYxbm, Integer nd) {
        return tjbMapper.getAllTjbByYxbm(usersYxbm, nd);
    }
}
