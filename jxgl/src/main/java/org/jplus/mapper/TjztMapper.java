package org.jplus.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.jplus.pojo.Tjzt.Tjzt;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.sql.Timestamp;


@Component
public interface TjztMapper {

    Tjzt getTjzt(@Param("gh") String gh);

    void addTjzt(@Param("gh") String gh, @Param("bkstjzt") Integer bkstjzt,@Param("bksshzt")Integer bksshzt,@Param("yjstjzt") Integer yjstjzt,@Param("yjsshzt")Integer yjsshzt);

    void updateBksTjzt(@Param("gh") String gh, @Param("bkstjsj") Timestamp tjsj);

    void updateYjsTjzt(@Param("gh") String gh, @Param("yjstjsj") Timestamp tjsj);

    void insertTJB(@Param("years") Integer years,@Param("gh")String gh);
}
