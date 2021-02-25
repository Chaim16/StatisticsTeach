package org.jplus.service.impl;

import org.attoparser.dom.INestableNode;
import org.jplus.mapper.TjztMapper;
import org.jplus.pojo.Tjzt.Tjzt;
import org.jplus.service.TjztService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;


@Service
public class TjztServiceImpl implements TjztService {

    @Autowired
    private TjztMapper tjztMapper;

    @Override
    public Tjzt getTjzt(String gh) {
        return tjztMapper.getTjzt(gh);
    }

    @Override
    public void addTjzt(String gh, Integer bkstjzt, Integer bksshzt, Integer yjstjzt, Integer yjsshzt) {
        tjztMapper.addTjzt(gh,bkstjzt,bksshzt,yjstjzt,yjsshzt);
    }

    @Override
    public void updateBksTjzt(String gh, Timestamp date) {
        tjztMapper.updateBksTjzt(gh,date);
    }

    @Override
    public void updateYjsTjzt(String gh, Timestamp date) {
        tjztMapper.updateYjsTjzt(gh,date);
    }

    @Override
    public void insertTJB(Integer years,String gh) {
        tjztMapper.insertTJB(years,gh);
    }
}
