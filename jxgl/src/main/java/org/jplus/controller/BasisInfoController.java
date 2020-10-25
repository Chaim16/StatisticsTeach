package org.jplus.controller;

import org.jplus.interceptor.NeedLogin;
import org.jplus.pojo.Tjzt.Tjzt;
import org.jplus.pojo.Users;
import org.jplus.pojo.basisInfo.JbxxAccpet;
import org.jplus.service.BksktjxService;
import org.jplus.service.JbxxService;
import org.jplus.service.TjztService;
import org.jplus.utils.GetWorkLoad;
import org.jplus.utils.GetYear;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 基本信息界面控制器
 */
@Controller
public class BasisInfoController {

    /* 选取年度 */
    private Integer xqnd = GetYear.getCurrentYear();

    /* 基本信息Service */
    @Autowired
    private JbxxService jbxxService;
    /* 提交状态Service */
    @Autowired
    private TjztService tjztService;
    /* 本科生课堂教学 */
    @Autowired
    private BksktjxService bksktjxService;

    @NeedLogin
    @RequestMapping(value = "/basicinformation")
    public String getInfo(Model model, Users users) {
        /*获取院系信息,做下拉列表*/
        model.addAttribute("yxType", jbxxService.getYxbmInfo());
        /*获取职务信息,做下拉列表*/
        model.addAttribute("zwType", jbxxService.getZwbmInfo());
        /*获取职称信息,做下拉列表*/
        model.addAttribute("zcType", jbxxService.getZcbmInfo());
        /*获取岗位信息,做下拉列表*/
        model.addAttribute("gwlxType", jbxxService.getGwlxbmInfo());
        /*获取当前年度*/
        model.addAttribute("Nd", GetYear.getCurrentYear());
        /* 获取选取年度 */
        model.addAttribute("xqnd", xqnd);
        /* 获取近期年度 */
        model.addAttribute("years", GetYear.years());
        /*获得总工作量*/
        model.addAttribute("Zgzl", jbxxService.getZgzl(users.getGh(), xqnd));
        /*获取本科生最低授课工作量*/
        model.addAttribute("bkszdgzl", bksktjxService.getBkjxgzlSum(users.getGh(), xqnd));
        /*获取用户信息*/
        model.addAttribute("user", users);
        /*获取基本信息存到model中*/
        model.addAttribute("basisInfo", jbxxService.getJbxxInfo(users.getGh(), xqnd));
        /*初始化该工号下的提交状态*/
        if (tjztService.getTjzt(users.getGh()) == null) {
            Tjzt tjzt = new Tjzt();
            tjzt.setGh(users.getGh());
            tjzt.setBkstjzt(0);
            tjzt.setBksshzt(0);
            tjzt.setYjstjzt(0);
            tjzt.setYjsshzt(0);
            tjztService.addTjzt(tjzt.getGh(),
                    tjzt.getBkstjzt(), tjzt.getBksshzt(),
                    tjzt.getYjstjzt(), tjzt.getYjsshzt());
        }
        if (xqnd != GetYear.getCurrentYear()) {
            model.addAttribute("hidden", 1);
        } else {
            model.addAttribute("hidden", tjztService.getTjzt(users.getGh()).getBkstjzt());
        }
        model.addAttribute("hiddenTips", jbxxService.getJbxxInfo(users.getGh(), xqnd));
        return "basicinformation";
    }

    /**
     * 更新基本信息
     * 接收前端的数据（存放在JbxxAccpet类中）
     */
    @NeedLogin
    @PostMapping("/updateBasisInfo")
    public String updateJbxxInfo(@ModelAttribute(value = "jbxxAccpet") JbxxAccpet jbxxAccpet, Users users) {
        /*如果提交状态表中的提交状态处于0:未提交状态,则可以进行更新操作*/
        xqnd = jbxxAccpet.getXqnd();
        if (tjztService.getTjzt(users.getGh()).getBkstjzt() == 0) {
            /*判断该用户的的jbxxInfo是否为空*/
            if (jbxxService.getJbxxInfo(users.getGh(), xqnd) == null) {
                jbxxService.addJbxx(users.getGh(), xqnd);
            }
            jbxxAccpet.setNd(xqnd);
            /*获取额定工作量*/
            jbxxAccpet.setEdgzl(GetWorkLoad.getRatedWorkload(jbxxAccpet.getZwbm(), jbxxAccpet.getZcbm(), jbxxAccpet.getGwlxbm(), jbxxAccpet.getSfxrz()));
            /*获取本科生最低授课工作量*/
            jbxxAccpet.setBkszdsk(GetWorkLoad.getTeachTime(jbxxAccpet.getZcbm(), jbxxAccpet.getGwlxbm()));
            /*更新部分基本信息*/
            jbxxService.updateBasisInfo(jbxxAccpet);
        }
        return "redirect:basicinformation";
    }

    @NeedLogin
    @PostMapping("/selectBasisInfoByYear")
    public String selectBasisInfoByYear(@ModelAttribute(value = "xqnd") Integer xqnd) {
        this.xqnd = xqnd;
        return "redirect:basicinformation";
    }

}
