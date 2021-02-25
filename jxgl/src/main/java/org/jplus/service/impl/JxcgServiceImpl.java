package org.jplus.service.impl;

import org.apache.ibatis.annotations.Mapper;
import org.jplus.mapper.JxcgMapper;
import org.jplus.pojo.teachingresearchInfo.*;
import org.jplus.service.JxcgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class JxcgServiceImpl implements JxcgService {

    @Autowired
   private JxcgMapper jxcgMapper;

    public List<Jxcg> getJxcgInfo(String gh, Integer xqnd) {
        return jxcgMapper.getJxcg(gh, xqnd);
    }

    public int addJxcg(Jxcg jxcg) { return jxcgMapper.addJxcg(jxcg); }

    public int deleteJxcg(Integer id, Integer xqnd) {
        return jxcgMapper.deleteJxcg(id, xqnd);
    }

    public List<Jxcgdj> getJxcgdjInfo() {return jxcgMapper.getJxcgdjInfo(); }

    public int getGdgzl(Integer id) {return jxcgMapper.getGdgzl(id);}

    public float getJxcgGzlSun(String gh, Integer xqnd){return jxcgMapper.getJxcgGzlSun(gh, xqnd);}




    public List<Zxxm> getZxxm(String gh, Integer xqnd){return jxcgMapper.getZxxm(gh, xqnd);}

    public int addZxxm(Zxxm zxxm){return jxcgMapper.addZxxm(zxxm);}

    public int deleteZxxm(Integer id, Integer xqnd){return jxcgMapper.deleteZxxm(id, xqnd);}

    public List<Zxxmdj> getZxxmdjInfo(){return jxcgMapper.getZxxmdjInfo();}

    public int getZxxmgzl(Integer id){return jxcgMapper.getZxxmgzl(id);}

    public  float getZxxmGzlSun(String gh, Integer xqnd){return jxcgMapper.getZxxmGzlSun(gh, xqnd);}



    public List<Hxxm> getHxxm(String gh, Integer xqnd){return jxcgMapper.getHxxm(gh, xqnd);}

    public int addHxxm(Hxxm hxxm){return jxcgMapper.addHxxm(hxxm);}

    public int deleteHxxm(Integer id, Integer xqnd){return jxcgMapper.deleteHxxm(id);}

    public float getHxxmGzlSun(String gh, Integer xqnd){return jxcgMapper.getHxxmGzlSun(gh, xqnd);}



    public List<Jc> getJc(String gh, Integer xqnd){return jxcgMapper.getJc(gh, xqnd);}

    public int addJc(Jc jc){return jxcgMapper.addJc(jc);}

    public int deleteJc(Integer id, Integer xqnd){return jxcgMapper.deleteJc(id, xqnd);}

    public List<Jcjb> getJcjbInfo(){return jxcgMapper.getJcjbInfo();}

    public int getJcGdgzl(Integer id){return jxcgMapper.getJcGdgzl(id);}

     public float getJcGzlSun(String gh, Integer xqnd){return jxcgMapper.getJcGzlSun(gh, xqnd);}


    public List<Jxgg> getJxgg(String gh){return jxcgMapper.getJxgg(gh);}

    public int addJxgg(Jxgg jxgg){return jxcgMapper.addJxgg(jxgg);}

    public int deleteJxgg(Integer id, Integer xqnd){return jxcgMapper.deleteJxgg(id, xqnd);}

    public List<Lxjb> getLxjbInfo(){return jxcgMapper.getLxjbInfo();}

    public int getJxgggzl(Integer id){return jxcgMapper.getLxjbGdgzl(id);}

    public float getJxggGzlSun(String gh, Integer xqnd){return jxcgMapper.getJxggGzlSun(gh, xqnd);}
}
