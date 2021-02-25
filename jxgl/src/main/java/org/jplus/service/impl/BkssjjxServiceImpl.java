package org.jplus.service.impl;


import org.jplus.mapper.BkssjjxMapper;
import org.jplus.pojo.bks.Bkssjjx;
import org.jplus.pojo.bks.Sxlx;
import org.jplus.pojo.bks.Zylxbm;
import org.jplus.service.BkssjjxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BkssjjxServiceImpl implements BkssjjxService {

    @Autowired
    private BkssjjxMapper bkssjjxMapper;

    @Override
    public int insertBkssjjx(Bkssjjx bkssjjx) {
        return  bkssjjxMapper.insertBkssjjx(bkssjjx);
    }

    @Override
    public Bkssjjx selectBkssjjx(String gh, Integer xqnd) {
        return bkssjjxMapper.selectBkssjjx(gh, xqnd);
    }

    @Override
    public List<Sxlx> selectSxlx() {
        return bkssjjxMapper.selectSxlx();
    }

    @Override
    public List<Zylxbm> selectZylxbm() {
        return bkssjjxMapper.selectZylxbm();
    }

    @Override
    public void updateBkssjjx(Bkssjjx bkssjjxVo) {
        bkssjjxMapper.updateBksjjx(bkssjjxVo);
    }


}
