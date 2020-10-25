package org.jplus.service;

import org.jplus.pojo.Tjzt.Tjzt;

import java.sql.Date;
import java.sql.Timestamp;


public interface TjztService {
    Tjzt getTjzt(String gh);

    void addTjzt(String gh, Integer bkstjzt,Integer bksshzt,Integer yjstjzt,Integer yjsshzt);

    void updateBksTjzt(String gh , Timestamp date);

    void updateYjsTjzt(String gh , Timestamp date);

    void insertTJB(Integer years,String gh);
}
