package org.jplus.service.impl;

import org.jplus.mapper.ZlgcMapper;
import org.jplus.pojo.zlgc.Zlgc;
import org.jplus.pojo.zlgc.ZlgcAccept;
import org.jplus.service.ZlgcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ZlgcServiceImpl implements ZlgcService {
    @Autowired
    private ZlgcMapper zlgcMapper;

    @Override
    public void addZlgcInfo(ZlgcAccept zlgcAccept) {
        zlgcMapper.addZlgcInfo(zlgcAccept);
    }

    @Override
    public void deleteZlgcInfo(Integer zlgcid) {
        zlgcMapper.deleteZlgcInfoById(zlgcid);
    }

    @Override
    public List<Zlgc> getZlgcInfo(String gh, Integer year) {
        return zlgcMapper.getZlgcInfo(gh, year);
    }

    @Override
    public void updateZlgcInfo(ZlgcAccept zlgcAccept) {
        zlgcMapper.updateZlgcInfoById(zlgcAccept);
    }

    @Override
    public Float calculateSumOfWorkLoad(String gh, Integer xqnd) {
        Float workload = 0.0f;
        if (zlgcMapper.calculateSumOfWorkLoad(gh, xqnd) != null){
            workload = zlgcMapper.calculateSumOfWorkLoad(gh, xqnd);
        }
        return workload;
    }
}
