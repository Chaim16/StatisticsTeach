package org.jplus.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.jplus.pojo.Tjzt.Tjb;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public interface TjbMapper {

    Tjb getTjbByGh(String gh);

    List<Tjb> getAllTjb(int nd);

    List<Tjb> getAllTjbByYxbm(int usersYxbm, Integer nd);

}
