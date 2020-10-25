package org.jplus.mapper;

import org.apache.ibatis.annotations.*;
import org.jplus.pojo.teachingresearchInfo.*;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public interface JxcgMapper {
// ---------------------------教学成果-------------------------
//获取教学成果信息
    @Select("select * from jxcg where gh = #{gh} and nd = #{xqnd}")
     List<Jxcg> getJxcg(String gh, Integer xqnd);

//添加教学成果信息
    @Insert("insert into jxcg values(null,#{gh},#{nd},#{cgmc},#{cgdjbm},#{xmpm},#{zrs},#{gzl})")
      int addJxcg(Jxcg jxcg);

//删除教学成果信息
    @Delete("delete from jxcg where jxcgid=#{id} and nd = #{xqnd}")
     int deleteJxcg(Integer id, Integer xqnd);

//查询成果等级信息
    @Select("select * from jxcgdj")
    List<Jxcgdj> getJxcgdjInfo();

//根据等级编码查工作量
    @Select("select gdgzl from jxcgdj where cgdjbm = #{id}")
    int getGdgzl(Integer id);

//获取工作量总和
    @Select("select coalesce(sum(gzl),0) jxcggzlsum from jxcg where gh = (#{gh}) and nd = (#{xqnd})")
    float getJxcgGzlSun(String gh, Integer xqnd);

//------------------------------纵向项目------------------------------------
//获取纵向教研项目信息
    @Select("select * from zxxm where gh = #{gh} and nd = #{xqnd}")
    List<Zxxm> getZxxm(String gh, Integer xqnd);

    //添加纵向项目信息
    @Insert("insert into zxxm values(null,#{gh},#{nd},#{xmmc},#{xmdjbm},#{xmpm},#{zrs},#{gzl})")
    int addZxxm(Zxxm zxxm);

    //删除纵向项目信息
    @Delete("delete from zxxm where zxxmid=#{id} and nd = #{xqnd}")
    int deleteZxxm(Integer id, Integer xqnd);

    //查询纵向项目等级信息
    @Select("select * from zxxmdj")
    List<Zxxmdj> getZxxmdjInfo();

    //根据等级编码查工作量
    @Select("select gdgzl from zxxmdj where xmdjbm = #{id}")
    int getZxxmgzl(Integer id);

    //获取工作量总和
    @Select("select coalesce(sum(gzl),0) zxxmgzlsum from zxxm where gh = (#{gh}) and nd = (#{xqnd})")
    float getZxxmGzlSun(String gh, Integer xqnd);

//---------------------------------横向项目------------------------------------------
//获取横向项目信息
    @Select("select * from hxxm where gh = #{gh} and nd = #{xqnd}")
    List<Hxxm> getHxxm(String gh, Integer xqnd);

    //添加横向项目信息
    @Insert("insert into hxxm values(null,#{gh},#{nd},#{xmmc},#{dzjf},#{xmpm},#{zrs},#{gzl})")
    int addHxxm(Hxxm hxxm);


    //删除横向项目信息
    @Delete("delete from hxxm where hxxmid=#{id}")
    int deleteHxxm(Integer id);

    //获取工作量总和
    @Select("select coalesce(sum(gzl),0) hxgzlsum from hxxm where gh = (#{gh}) and nd = (#{xqnd})")
    float getHxxmGzlSun(String gh, Integer xqnd);

//-------------------------------------教材-------------------------------------------
//获取教材信息
    @Select("select * from jc where gh = #{gh} and nd = #{xqnd}")
    List<Jc> getJc(String gh, Integer xqnd);

    //添加教材信息
    @Insert("insert into jc values(null,#{gh},#{nd},#{jcmc},#{jcjbbm},#{xmpm},#{zrs},#{gzl})")
    int addJc(Jc jc);

    //删除教材信息
    @Delete("delete from jc where jcid=#{id} and nd = #{xqnd}")
    int deleteJc(Integer id, Integer xqnd);

    //查询教材级别信息
    @Select("select * from jcjb")
    List<Jcjb> getJcjbInfo();

    //根据等级编码查工作量
    @Select("select gdgzl from jcjb where jcjbbm = #{id}")
    int getJcGdgzl(Integer id);

    //获取工作量总和
    @Select("select coalesce(sum(gzl),0) jcgzlsum from jc where gh = (#{gh}) and nd = (#{xqnd})")
    float getJcGzlSun(String gh, Integer xqnd);

// ---------------------------------------教学改革--------------------------------------------
//获取教学改革信息
    @Select("select * from jxgg where gh = #{gh}")
    List<Jxgg> getJxgg(String gh);

    //添加教学改革信息
    @Insert("insert into jxgg values(null,#{gh},#{nd},#{xmmc},#{lxjbbm},#{xmpm},#{zrs},#{gzl})")
    int addJxgg(Jxgg jxgg);

    //删除教学改革信息
    @Delete("delete from jxgg where jxggid=#{id} and nd = #{xqnd}")
    int deleteJxgg(Integer id, Integer xqnd);

    //查询立项级别信息
    @Select("select * from lxjb")
    List<Lxjb> getLxjbInfo();

    //根据等级编码查工作量
    @Select("select gdgzl from lxjb where lxjbbm = #{id}")
    int getLxjbGdgzl(Integer id);

    //获取工作量总和
    @Select("select coalesce(sum(gzl),0) jxgggzlsum from jxgg where gh = (#{gh}) and nd = (#{xqnd})")
    float getJxggGzlSun(String gh, Integer xqnd);
}
