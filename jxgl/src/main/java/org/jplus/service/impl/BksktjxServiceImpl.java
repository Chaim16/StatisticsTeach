package org.jplus.service.impl;

import org.jplus.mapper.BksktjxMapper;
import org.jplus.pojo.classTeach.Bksktjx;
import org.jplus.pojo.classTeach.BksktjxAccpet;
import org.jplus.pojo.classTeach.Kclx;
import org.jplus.service.BksktjxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BksktjxServiceImpl implements BksktjxService {

    @Autowired
    private BksktjxMapper bksktjxMapper;

    @Override
    public List<Bksktjx> getBksktjxInfo(String gh, Integer nd) {
        return bksktjxMapper.getBksktjxInfo(gh, nd);
    }

    @Override
    public List<Kclx> getKtlxbm() {
        return bksktjxMapper.getKtlxbm();
    }

    @Override
    public Integer getKtlxbmBybm(Integer ktlxbm) {
        return bksktjxMapper.getKtlxbmBybm(ktlxbm);
    }

    @Override
    public void addClassInfo(BksktjxAccpet bksktjxAccpet) {
        bksktjxMapper.addClassInfo(bksktjxAccpet);
    }

    @Override
    public void deleteClassInfoBybksktjxId(Integer bksktjx) {
        bksktjxMapper.deleteClassInfoBybksktjxId(bksktjx);
    }

    @Override
    public Float getBkjxgzlSum(String gh, Integer xqnd) {
        return bksktjxMapper.getBksktjxSum(gh, xqnd);
    }

}
