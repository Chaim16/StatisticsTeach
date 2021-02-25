package org.jplus.service.impl;

import org.jplus.mapper.JbxxMapper;
import org.jplus.pojo.basisInfo.*;
import org.jplus.service.JbxxService;
import org.jplus.service.YjsjyxmService;
import org.jplus.service.YjsktjxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class JbxxServiceImpl implements JbxxService {


    @Autowired
    private JbxxMapper jbxxMapper;

    @Autowired
    private YjsktjxService yjsktjxService;

    @Autowired
    private JxcgServiceImpl jxcgService;

    @Autowired
    private YjsjyxmService yjsjyxmService;


    @Override
    public Jbxx getJbxxInfo(String gh, Integer xqnd) {
        return jbxxMapper.getJbxxInfo(gh, xqnd);
    }

    @Override
    public List<Yxbm> getYxbmInfo() {
        return jbxxMapper.getYxbmInfo();
    }

    @Override
    public List<Zwbm> getZwbmInfo() {
        return jbxxMapper.getZwbmInfo();
    }

    @Override
    public List<Zcbm> getZcbmInfo() {
        return jbxxMapper.getZcbmInfo();
    }

    @Override
    public List<Gwlxbm> getGwlxbmInfo() {
        return jbxxMapper.getGwlxbmInfo();
    }

    @Override
    public void updateBasisInfo(JbxxAccpet jbxxAccpet) {
        jbxxMapper.updateBasisInfo(jbxxAccpet);
    }

    @Override
    public void addJbxx(String gh, Integer xqnd) {
        jbxxMapper.addJbxx(gh, xqnd);
    }

    @Override
    public Float getZgzl(String gh, Integer xqnd) {
        /*本科生总工作量*/
        Float BksZgzl = 0f;
        /*本科生*/
        /*获取课堂教学的总工作量*/
        Float bksKtjxgzl = jbxxMapper.getBksKtjxgzl(gh, xqnd);
        /*获取实践教学总共作量*/
        Float bksSjjxgzl = jbxxMapper.getBksSjjxgzl(gh, xqnd);
        /*获取质量工程总工作量*/
        Float bksZlgcgzl = jbxxMapper.getBksZlgcgzl(gh, xqnd);
        /*获取教学研究总工作量*/
        Float jxcgGzlSun = jxcgService.getJxcgGzlSun(gh, xqnd);
        Float zxxmGzlSun = jxcgService.getZxxmGzlSun(gh, xqnd);
        Float hxxmGzlSun = jxcgService.getHxxmGzlSun(gh, xqnd);
        Float jcGzlSun = jxcgService.getJcGzlSun(gh, xqnd);
        Float jxggGzlSun = jxcgService.getJxggGzlSun(gh, xqnd);
        /*获取教学知识竞赛总工作量*/
        Float zdxsgzl = jbxxMapper.getZdxsgzl(gh, xqnd);
        Float jsjsgzl = jbxxMapper.getJsjsgzl(gh, xqnd);
        Float lwgzl = jbxxMapper.getLwgzl(gh, xqnd);
        /*获取其他总工作量*/
        Float qtgzl = jbxxMapper.getQtgzl(gh, xqnd);
        BksZgzl = bksKtjxgzl+bksSjjxgzl+bksZlgcgzl+jxcgGzlSun+zxxmGzlSun+hxxmGzlSun+jcGzlSun+jxggGzlSun+zdxsgzl+jsjsgzl+lwgzl+qtgzl;


        /*研究生总工作量*/
        Float YjsZgzl = 0f;

     /*   *//*研究生课堂教学工作量*//*
        Float yjsjxgzlSum = yjsktjxService.getYjsjxgzlSum(gh);
        *//*研究生实践教学工作量*//*
        Float yjsSjjxgzl = jbxxMapper.getYjsSjjxgzl(gh);
        *//*教学基本建设与学科建设工作量*//*
        Float jsgzl = jbxxMapper.getJsgzl(gh);
        *//*教学研究项目工作量*//*
        Float yjshxxmGzlSum = yjsjyxmService.getYjshxxmGzlSum(gh);
        Float yjsjyxmGzlSum = yjsjyxmService.getYjsjyxmGzlSum(gh);
        *//*指导研究生竞赛获奖工作量*//*
        *//*研究生竞赛在本科生那边已经总了*//*
        *//*下面一个是论文，我不想改名字了*//*
        Float yjsZdgzl = jbxxMapper.getYjsZdgzl(gh);
        *//*研究生其他工作量*//*
        Float yjsQtgzl = jbxxMapper.getYjsQtgzl(gh);
        YjsZgzl = yjsjxgzlSum+yjsSjjxgzl+jsgzl+yjshxxmGzlSum+yjsjyxmGzlSum+yjsZdgzl+yjsQtgzl;
*/
        Float Zgzl = 0f;
        Zgzl = BksZgzl+YjsZgzl;
        return Zgzl;
    }
}
