package org.jplus.controller;

import org.jplus.dto.BkssjjxEx;
import org.jplus.interceptor.NeedLogin;
import org.jplus.pojo.Users;
import org.jplus.pojo.bks.Bkssjjx;
import org.jplus.service.BkssjjxService;
import org.jplus.service.TjztService;
import org.jplus.utils.GetYear;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

import static org.jplus.utils.GetWorkLoad.getSjjxWork;

/**
 * 本科生实践教学
 **/
@Controller
public class BkssjjxController {

    /* 本科实践教学Service */
    @Autowired
    private BkssjjxService bkssjjxService;

    /* 选取年度 */
    private Integer xqnd = GetYear.getCurrentYear();

    /* 提交状态 */
    @Autowired
    private TjztService tjztService;

    @NeedLogin
    @RequestMapping("/practiceteh") //本科生实践教学入口
    public String bkssjjx(Model model, Users user) { //User由参数解析器自动注入
        // 获取实习类型
        Optional.ofNullable(bkssjjxService.selectSxlx()).ifPresent(sxlx -> model.addAttribute("sxlxlist", sxlx));
        // 获取专业类型
        Optional.ofNullable(bkssjjxService.selectZylxbm()).ifPresent(zybm -> model.addAttribute("zylxlist", zybm));
        // 获取实践教学内容
        Optional.ofNullable(bkssjjxService.selectBkssjjx(user.getGh(), xqnd)).ifPresent(sjjx -> model.addAttribute
                ("bkssjjx", getSjjxWork(sjjx)));
        /* 获取选取年度 */
        model.addAttribute("xqnd", xqnd);
        /* 获取最近年度 */
        model.addAttribute("years", GetYear.years());
        if (xqnd != GetYear.getCurrentYear()) {
            model.addAttribute("hidden", 1);
        } else {
            model.addAttribute("hidden", tjztService.getTjzt(user.getGh()).getBkstjzt());
        }
        return "practicalteaching";
    }

    /* 保存本科生实践教学 */
    @NeedLogin
    @RequestMapping("/saveBkssjjx")
    public String insertTest(@ModelAttribute(value = "bkssjjxVo") Bkssjjx bkssjjxVo, Users users) {
        if (tjztService.getTjzt(users.getGh()).getBkstjzt() == 0) {
            bkssjjxVo.setGh(users.getGh());
            System.out.println(xqnd);
            if (bkssjjxService.selectBkssjjx(users.getGh(), xqnd) == null) {
                BkssjjxEx sjjxWork = getSjjxWork(bkssjjxVo);
                bkssjjxVo.setNd(xqnd);
                bkssjjxVo.setGzl(sjjxWork.getGzl());
                bkssjjxService.insertBkssjjx(bkssjjxVo);
            } else {
                BkssjjxEx sjjxWork = getSjjxWork(bkssjjxVo);
                bkssjjxVo.setNd(GetYear.getCurrentYear());
                bkssjjxVo.setGzl(sjjxWork.getGzl());
                bkssjjxService.updateBkssjjx(bkssjjxVo);
            }
        }
        return "redirect:/practiceteh";
    }

    @NeedLogin
    @PostMapping("/selectPracticeTeachByYear")
    public String selectPracticeTeachByYear(@ModelAttribute(value = "xqnd") Integer xqnd) {
        this.xqnd = xqnd;
        return "redirect:/practiceteh";
    }

}
