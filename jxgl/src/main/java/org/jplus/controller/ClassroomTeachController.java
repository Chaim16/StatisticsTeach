package org.jplus.controller;

import org.apache.catalina.User;
import org.jplus.interceptor.NeedLogin;
import org.jplus.pojo.Users;
import org.jplus.pojo.classTeach.BksktjxAccpet;
import org.jplus.service.BksktjxService;
import org.jplus.service.TjztService;
import org.jplus.utils.GetWorkLoad;
import org.jplus.utils.GetYear;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
public class ClassroomTeachController {
    private String classError = null;

    /* 选取年度 */
    private Integer xqnd = GetYear.getCurrentYear();

    @Autowired
    private BksktjxService bksktjxService;
    @Autowired
    private TjztService tjztService;

    @NeedLogin
    @RequestMapping(value = "/classroomteaching")
    public String getClassTechInfo(Model model, Users users) {
        /*获取年份。存入model*/
        model.addAttribute("xqnd", xqnd);
        /* 获取最近年度 */
        model.addAttribute("years", GetYear.years());
        /*获取课堂类型，存入model*/
        model.addAttribute("ktlx", bksktjxService.getKtlxbm());
        /*获取本科生课堂教学信息，存入model*/
        model.addAttribute("bksktjx", bksktjxService.getBksktjxInfo(users.getGh(), xqnd));
        /*获取课堂教学的总工作量*/
        model.addAttribute("ktjxgzlSum", bksktjxService.getBkjxgzlSum(users.getGh(), xqnd));
        /*获取校验错误信息*/
        model.addAttribute("ClassError", classError);
        // 如果不是本年度，隐藏添加按钮
        if (xqnd != GetYear.getCurrentYear()) {
            model.addAttribute("hidden", 1);
        } else {
            model.addAttribute("hidden", tjztService.getTjzt(users.getGh()).getBkstjzt());
        }
        return "classroomteaching";
    }

    @NeedLogin
    @PostMapping("/addClassInfo")
    public String addClassInfo(@ModelAttribute(value = "bksktjxAccpet") @Validated BksktjxAccpet bksktjxAccpet, BindingResult bindingResult, Users users) {
        /*如果提交状态表的提交状态处于0：未提交状态，则可以进行添加操作*/
        if (tjztService.getTjzt(users.getGh()).getBkstjzt() == 0) {
            /*if里面代码弃用*/
            if (bindingResult.hasErrors()) {
                /*获得第一个校验错误*/
                classError = bindingResult.getFieldError().getDefaultMessage();
                if (classError.contains("NumberFormatException")) {
                    classError = "请输入正确的信息";
                }
            } else {
                /*获取工号*/
                bksktjxAccpet.setGh(users.getGh());
                /*获取教学工作量*/
                bksktjxAccpet.setJxgzl(GetWorkLoad.getClassWork(bksktjxAccpet.getJhxs(), bksktjxAccpet.getSfsy(), bksktjxService.getKtlxbmBybm(bksktjxAccpet.getKtlxbm()), bksktjxAccpet.getSkrs()));
                /*存入年份*/
                bksktjxAccpet.setNd(xqnd);
                /*添加课堂信息*/
                bksktjxService.addClassInfo(bksktjxAccpet);
                /*将错误信息清空*/
                classError = null;
            }
        }
        return "redirect:classroomteaching";
    }

    @NeedLogin
    @RequestMapping(value = "/deleteClassInfo", method = RequestMethod.GET)
    public String delete(@ModelAttribute(value = "id") Integer id, Users users) {
        /*如果提交状态表的提交状态处于0：未提交状态，则可以进行删除操作*/
        // 并且是本年度
        if (xqnd == GetYear.getCurrentYear() && tjztService.getTjzt(users.getGh()).getBkstjzt() == 0) {
            /*删除课堂信息*/
            bksktjxService.deleteClassInfoBybksktjxId(id);
        }
        return "redirect:classroomteaching";
    }

    /**
     * 根据选取的年度查询课堂教学
     *
     * @param xqnd
     * @param user
     * @return
     */
    @NeedLogin
    @PostMapping(value = "/selectClassRoomTeachByYear")
    public String selectClassRoomTeachByYear(@ModelAttribute(value = "xqnd") Integer xqnd, User user) {
        this.xqnd = xqnd;
        return "redirect:classroomteaching";
    }
}
