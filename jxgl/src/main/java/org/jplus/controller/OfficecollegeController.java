package org.jplus.controller;

import org.jplus.interceptor.NeedLogin;
import org.jplus.pojo.Users;
import org.jplus.service.CheckService;
import org.jplus.service.OfficecollegeService;
import org.jplus.utils.GetYear;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class OfficecollegeController {

   @Autowired
   OfficecollegeService officecollegeService;

   @Autowired
    CheckService checkService;

   //审核本院本科生工作量
    @NeedLogin
    @RequestMapping("/officecollege")
    public String officecollege(Users user, Model model){
        model.addAttribute("yxmc",officecollegeService.getYxmc(user.getGh()));
        model.addAttribute("Checkgzls",officecollegeService.getCheckgzlInfByGh(user.getGh(), GetYear.getCurrentYear()));
        return "officecollege";
    }
/*
    //审核本院研究生工作量
    @NeedLogin
    @RequestMapping("/officecollegeYY")
    public String officecollegeYY(Users user, Model model){
        model.addAttribute("yxmc",officecollegeService.getYxmc(user.getGh()));
        model.addAttribute("Checkgzls",officecollegeService.getCheckgzlInfByGh(user.getGh()));
        return "officecollegeY";
    }
*/

    //审核各院本科生工作量本院信息显示
    @NeedLogin
    @RequestMapping("/departmentalaudit")
    public String departmentalaudit(Model model){
        model.addAttribute("yxbms",officecollegeService.getAllYxbm());
        return "departmentalaudit";
    }
/*

    //审核各院研究生工作量本院信息显示
    @NeedLogin
    @RequestMapping("/departmentalauditYY")
    public String departmentalauditY(Model model){
        model.addAttribute("yxbms",officecollegeService.getAllYxbm());
        return "departmentalauditY";
    }
*/

    //审核各院本科生工作量其他院信息选择显示
    @NeedLogin
    @RequestMapping("/departmentalaudit2")
    public String departmentalaudit2(@RequestParam(required = false) String gh,
                                     @RequestParam(required = false)  Integer tempYxbm,
                                     Model model, Integer yxbm){
        //用于回显数据
        if (gh != null){
            model.addAttribute("theyxbm",officecollegeService.getYxbm(gh));
        }else {
            model.addAttribute("theyxbm",yxbm);
        }
        model.addAttribute("yxbms",officecollegeService.getAllYxbm());
        if (tempYxbm != null){
            model.addAttribute("Checkgzls",officecollegeService.getCheckgzlInfByYxbm(tempYxbm));
        }else {
            model.addAttribute("Checkgzls",officecollegeService.getCheckgzlInfByYxbm(yxbm));
        }
        return "departmentalaudit";
    }

    //审核各院本科生工作量其他院信息选择显示
    @NeedLogin
    @RequestMapping("/departmentalaudit3")
    public String departmentalaudit3(@RequestParam(required = false) String gh,
                                     @RequestParam(required = false)  Integer tempYxbm,
                                     Model model, Integer yxbm){
        //用于回显数据
        if (gh != null){
            model.addAttribute("theyxbm",officecollegeService.getYxbm(gh));
        }else {
            model.addAttribute("theyxbm",yxbm);
        }
        model.addAttribute("yxbms",officecollegeService.getAllYxbm());
        if (tempYxbm != null){
            model.addAttribute("Checkgzls",officecollegeService.getCheckgzlInfByYxbm(tempYxbm));
        }else {
            model.addAttribute("Checkgzls",officecollegeService.getCheckgzlInfByYxbm(yxbm));
        }
        return "departmentalauditY";
    }
}
