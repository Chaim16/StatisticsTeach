package org.jplus.service;

import org.jplus.pojo.bks.Bkssjjx;
import org.jplus.pojo.bks.Sxlx;
import org.jplus.pojo.bks.Zylxbm;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 本科生实践教学
 * */
@Service
public interface BkssjjxService {

    /* 添加*/
    int insertBkssjjx(Bkssjjx bkssjjx);

    /* 查询本科生实践教学 */
    Bkssjjx selectBkssjjx(String gh, Integer xqnd);

    /* 查询实习类型*/
    List<Sxlx> selectSxlx();

    /* 查询专业类型编码 */
    List<Zylxbm> selectZylxbm();

    /* 更新本科生实践教学 */
    void updateBkssjjx(Bkssjjx bkssjjxVo);

}
