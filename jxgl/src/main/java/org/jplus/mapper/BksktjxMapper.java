package org.jplus.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.jplus.pojo.classTeach.Bksktjx;
import org.jplus.pojo.classTeach.BksktjxAccpet;
import org.jplus.pojo.classTeach.Kclx;

import java.util.List;

@Mapper
public interface BksktjxMapper {

    List<Bksktjx> getBksktjxInfo(String gh, Integer nd);

    List<Kclx> getKtlxbm();

    Integer getKtlxbmBybm(Integer ktlxbm);

    void addClassInfo(BksktjxAccpet bksktjxAccpet);

    void deleteClassInfoBybksktjxId(Integer bksktjx);

    Float getBksktjxSum(String gh, Integer xqnd);

}
