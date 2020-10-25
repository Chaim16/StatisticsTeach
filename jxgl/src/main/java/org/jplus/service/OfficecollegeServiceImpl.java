package org.jplus.service;

import org.jplus.mapper.CheckgzlMapper;
import org.jplus.pojo.basisInfo.Yxbm;
import org.jplus.pojo.checkgzl.Checkgzl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;


@Service
public class OfficecollegeServiceImpl implements OfficecollegeService{
    @Autowired
    private CheckgzlMapper checkgzlMapper;

    public String getYxmc(String gh) {
        return checkgzlMapper.getYxByGh(gh);
    }

    public Integer getYxbm(String gh) { return checkgzlMapper.getYxbmByGh(gh); }

    public List<Yxbm> getAllYxbm() { return checkgzlMapper.getAllYxbm(); }

    public List<Checkgzl> getCheckgzlInfByYxbm(Integer yxbm) {
        List<Checkgzl> checkgzlList = checkgzlMapper.getCheckgzlInfByYxbm(yxbm);
        for (Checkgzl checkgzl : checkgzlList) {
            {
                if (checkgzl.getZwmc() == null) {
                    checkgzl.setZwmc("");
                }
                if (checkgzl.getEdgzl() == null) {
                    checkgzl.setEdgzl(0.0f);
                }
                if (checkgzl.getBkstjzt() == null || checkgzl.getBkstjzt() == 0) {
                    checkgzl.setBkszgzl(0.0f);
                    checkgzl.setYjszgzl(0.0f);
                    checkgzl.setBksshzt(0);
                }
            }
        }
        return checkgzlList;
    }

    public List<Checkgzl> getCheckgzlInfByGh(String gh, Integer currentYear) {
        List<Checkgzl> checkgzlList = checkgzlMapper.getCheckgzlInfByGh(gh, currentYear);
        for (Checkgzl checkgzl:checkgzlList) {
            if (checkgzl.getZwmc() == null){
                checkgzl.setZwmc("");
            }

            if (checkgzl.getEdgzl() == null){
                checkgzl.setEdgzl(0.0f);
            }
            if (checkgzl.getBkstjzt() == null || checkgzl.getBkstjzt() == 0){
                checkgzl.setBkszgzl(0.0f);
                checkgzl.setBksshzt(0);
            }
            if (checkgzl.getYjstjzt() == null || checkgzl.getYjstjzt() == 0){
                checkgzl.setYjszgzl(0.0f);
                checkgzl.setYjsshzt(0);
            }
        }
        return checkgzlList;
    }
}
