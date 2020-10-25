package org.jplus.service;

import org.jplus.pojo.basisInfo.*;

import java.util.List;

/**
 * 基本信息Service
 *
 * */
public interface JbxxService {
    /* 根据工号获取用户基本信息 */
    Jbxx getJbxxInfo(String gh, Integer xqnd);

    /* 获取院系编码 */
    List<Yxbm> getYxbmInfo();

    /* 获取职务编码 */
    List<Zwbm> getZwbmInfo();

    /* 获取职称编码 */
    List<Zcbm> getZcbmInfo();

    /* 获取岗位类型编码 */
    List<Gwlxbm> getGwlxbmInfo();

    /* 更新基本信息 */
    void updateBasisInfo(JbxxAccpet jbxxAccpet);

    /* 增加基本信息 */
    void addJbxx(String gh, Integer xqnd);

    /* 总工作量 */
    Float getZgzl(String gh, Integer xqnd);

}
