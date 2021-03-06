package org.jplus.controller;

import org.jplus.interceptor.NeedLogin;
import org.jplus.pojo.Users;
import org.jplus.pojo.teachingresearchInfo.*;
import org.jplus.service.impl.JxcgServiceImpl;
import org.jplus.service.TjztService;
import org.jplus.utils.GetWorkLoad;
import org.jplus.utils.GetYear;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TeachingResearchController {

    /* 选取年度 */
    private Integer xqnd = GetYear.getCurrentYear();

    /* 教学成果 */
    @Autowired
    JxcgServiceImpl jxcgService;

    /* 提交状态 */
    @Autowired
    TjztService tjztService;

    //数据显示
    @NeedLogin
    @RequestMapping("/teachingresearch")
    public String getInfo(Model model, Users users) {
        // 教学成果
        model.addAttribute("Jxcgs", jxcgService.getJxcgInfo(users.getGh(), xqnd));
        // 教学成果等级
        model.addAttribute("Jxcgdjs", jxcgService.getJxcgdjInfo());

        // 纵向项目
        model.addAttribute("Zxxms", jxcgService.getZxxm(users.getGh(), xqnd));
        model.addAttribute("Zxxmdjs", jxcgService.getZxxmdjInfo());

        // 横向项目
        model.addAttribute("Hxxms", jxcgService.getHxxm(users.getGh(), xqnd));

        // 教材
        model.addAttribute("Jcs", jxcgService.getJc(users.getGh(), xqnd));
        // 教材级别
        model.addAttribute("Jcjbs", jxcgService.getJcjbInfo());

        // 教学改革
        model.addAttribute("Jxggs", jxcgService.getJxgg(users.getGh()));
        // 立项级别
        model.addAttribute("Lxjbs", jxcgService.getLxjbInfo());

        model.addAttribute("year", GetYear.getCurrentYear());
        model.addAttribute("gh", users.getGh());

        // 选取年度
        model.addAttribute("xqnd", xqnd);
        // 近些年度
        model.addAttribute("years", GetYear.years());

        model.addAttribute("jxcgGzl", jxcgService.getJxcgGzlSun(users.getGh(), xqnd));
        model.addAttribute("zxxmGzl", jxcgService.getZxxmGzlSun(users.getGh(), xqnd));
        //横向项目总分不超过200
        model.addAttribute("hxxmGzl", jxcgService.getHxxmGzlSun(users.getGh(), xqnd) > 200.0f ? 200.0f : jxcgService.getHxxmGzlSun(users.getGh(), xqnd));
        model.addAttribute("jcGzl", jxcgService.getJcGzlSun(users.getGh(), xqnd));
        model.addAttribute("jxggGzl", jxcgService.getJxggGzlSun(users.getGh(), xqnd));
        if(xqnd != GetYear.getCurrentYear()){
            model.addAttribute("hidden",1);
        }else {
            model.addAttribute("hidden", tjztService.getTjzt(users.getGh()).getBkstjzt());
        }
        return "teachingresearch";
    }

    //删除教学成果某一列
    @NeedLogin
    @RequestMapping("/delJxcg")
    public String delJxcg(Integer id, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            jxcgService.deleteJxcg(id, GetYear.getCurrentYear());
        }
        return "redirect:/teachingresearch";
    }

    //添加教学成果某一列
    @NeedLogin
    @PostMapping("/addJxcg")

    public String addJxcg(@ModelAttribute(value = "jxcg") Jxcg jxcg, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            //获取工号
            jxcg.setGh(user.getGh());
            //获取工作量
            jxcg.setGzl(GetWorkLoad.calculateWeight(jxcg.getXmpm(), jxcg.getZrs()) * jxcgService.getGdgzl(jxcg.getCgdjbm()));
            //存入年份
            jxcg.setNd(GetYear.getCurrentYear());
            //添加信息
            jxcgService.addJxcg(jxcg);
        }
        return "redirect:/teachingresearch";
    }

    //删除纵向教研项目的某一列
    @NeedLogin
    @RequestMapping("/delZxxm")
    public String delZxxm(Integer id, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            jxcgService.deleteZxxm(id, GetYear.getCurrentYear());
        }
        return "redirect:/teachingresearch";
    }

    //添加纵向教研项目的某一列
    @NeedLogin
    @PostMapping("/addZxxm")
    public String addZxxm(@ModelAttribute(value = "zxxm") Zxxm zxxm, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            //获取工号
            zxxm.setGh(user.getGh());
            //获取工作量
            zxxm.setGzl(GetWorkLoad.calculateWeight(zxxm.getXmpm(), zxxm.getZrs()) * jxcgService.getZxxmgzl(zxxm.getXmdjbm()));
            //存入年份
            zxxm.setNd(GetYear.getCurrentYear());
            //添加信息
            jxcgService.addZxxm(zxxm);
        }
        return "redirect:/teachingresearch";
    }


    //删除横向教研项目的某一列
    @NeedLogin
    @RequestMapping("/delHxxm")
    public String delHxxm(Integer id, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            jxcgService.deleteHxxm(id, GetYear.getCurrentYear());
        }
        return "redirect:/teachingresearch";
    }

    //添加横向教研项目的某一列
    @NeedLogin
    @PostMapping("/addHxxm")
    public String addHxxm(@ModelAttribute(value = "hxxm") Hxxm hxxm, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            //获取工号
            hxxm.setGh(user.getGh());
            //获取工作量
            hxxm.setGzl(GetWorkLoad.calculateWeight(hxxm.getXmpm(), hxxm.getZrs()) * (int) Math.ceil(hxxm.getDzjf()) * 20);
            //存入年份
            hxxm.setNd(GetYear.getCurrentYear());
            //添加信息
            jxcgService.addHxxm(hxxm);
        }
        return "redirect:/teachingresearch";
    }

    //删除教材某一列
    @NeedLogin
    @RequestMapping("/delJc")
    public String delJc(Integer id, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            jxcgService.deleteJc(id, GetYear.getCurrentYear());
        }
        return "redirect:/teachingresearch";
    }

    //添加教材的某一列
    @NeedLogin
    @PostMapping("/addJc")
    public String addJc(@ModelAttribute(value = "jc") Jc jc, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            //获取工号
            jc.setGh(user.getGh());
            //获取工作量
            jc.setGzl(GetWorkLoad.calculateWeight(jc.getXmpm(), jc.getZrs()) * jxcgService.getJcGdgzl(jc.getJcjbbm()));
            //存入年份
            jc.setNd(GetYear.getCurrentYear());
            //添加信息
            jxcgService.addJc(jc);
        }
        return "redirect:/teachingresearch";
    }

    //删除教学改革某一列
    @NeedLogin
    @RequestMapping("/delJxgg")
    public String delJxgg(Integer id, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            jxcgService.deleteJxgg(id, GetYear.getCurrentYear());
        }
        return "redirect:/teachingresearch";
    }

    //添加教学改革的某一列
    @NeedLogin
    @PostMapping("/addJxgg")
    public String addJc(@ModelAttribute(value = "jxgg") Jxgg jxgg, Users user) {
        //提交状态处于0，表示未提交可以操作数据
        if (tjztService.getTjzt(user.getGh()).getBkstjzt() == 0) {
            //获取工号
            jxgg.setGh(user.getGh());
            //获取工作量
            jxgg.setGzl(GetWorkLoad.calculateWeight(jxgg.getXmpm(), jxgg.getZrs()) * jxcgService.getJxgggzl(jxgg.getLxjbbm()));
            //存入年份
            jxgg.setNd(GetYear.getCurrentYear());
            //添加信息
            jxcgService.addJxgg(jxgg);
        }
        return "redirect:/teachingresearch";
    }

    @NeedLogin
    @PostMapping("/selectTeachingResearchByYear")
    public String selectTeachingResearchByYear(@ModelAttribute(value = "xqnd") Integer xqnd){
        this.xqnd = xqnd;
        return "redirect:/teachingresearch";
    }

}
