package org.jplus.controller;

import org.jplus.interceptor.NeedLogin;
import org.jplus.pojo.Users;
import org.jplus.pojo.undergraduateCompatitonAndOther.ZDXSJS;
import org.jplus.pojo.masterCompartitionAndOther.ZDSSLW;
import org.jplus.pojo.queryVo.ZdxsjsVo;
import org.jplus.service.TjztService;
import org.jplus.service.ZDSSLWService;
import org.jplus.service.ZDXSJSService;
import org.jplus.utils.DateUtils;
import org.jplus.utils.GetYear;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
public class GraduateawardController {

    /* 选取年度 */
    private Integer xqnd = GetYear.getCurrentYear();

    @Autowired
    private TjztService tjztService;

    @Autowired
    private ZDXSJSService zDXSJSService;

    @Autowired
    private ZDSSLWService zDSSLWService;

    @NeedLogin
    @RequestMapping("/masterKnow")
    public String hello(Model model, Users users) {
        ZDSSLW zDSSLW = zDSSLWService.findZDSSLWByGhAndYear(users.getGh(), xqnd);
        // 获取年度指导学生竞赛
        List<ZdxsjsVo> list = zDXSJSService.getStudentCompetitionList2(users.getGh(), xqnd);
        for(int i = 0; i < list.size(); i++) {
            // 获取竞赛级别编码
            int jbbm = list.get(i).getJsjbbm();
            if(jbbm == 1) {
                list.get(i).setJsjbmc("国家级");
            }else if(jbbm == 2) {
                list.get(i).setJsjbmc("省级");
            }else if(jbbm == 3){
                list.get(i).setJsjbmc("校级");
            }
            // 获取竞赛类别编码
            int lbbm = list.get(i).getJslbbm();
            if(lbbm == 1) {
                list.get(i).setJslbmc("A类师范生教学技能竞赛");
            }else if(lbbm == 2) {
                list.get(i).setJslbmc("B类师范生教学技能竞赛");
            }else if(lbbm == 3) {
                list.get(i).setJslbmc("A类其他竞赛");
            }else if(lbbm == 4) {
                list.get(i).setJslbmc("B类其他竞赛");
            }
        }
        model.addAttribute("allStudentCompetitionList", list);
        model.addAttribute("zDSSLW", zDSSLW);
        if(xqnd != GetYear.getCurrentYear()){
            model.addAttribute("hidden", 1);
        }else {
            model.addAttribute("hidden",tjztService.getTjzt(users.getGh()).getYjstjzt());
        }
        return "graduateaward";
    }

    @NeedLogin
    @RequestMapping("/addMasterCompetition")
    @ResponseBody
    public void addMasterStudentContest(String contestName, Integer competition,  Integer contestLevel, Integer studentNum, Users users) {
        ZDXSJS zDXSJS = new ZDXSJS();
        // 这里的工号可以从session中获取
        String gh = users.getGh();
        zDXSJS.setGh(gh);
        zDXSJS.setNd(DateUtils.getCurrentYear());
        zDXSJS.setJsmc(contestName);
        zDXSJS.setJslbbm(competition);
        zDXSJS.setJsjbbm(contestLevel);
        zDXSJS.setZdxsrs(studentNum);
        zDXSJS.setJsxscc(2);
        float gzl = zDXSJSService.getGzl(competition, contestLevel);
        gzl = gzl * studentNum;
        zDXSJS.setGzl(gzl);
        // 添加到数据库
        if (tjztService.getTjzt(users.getGh()).getYjstjzt() == 0) {
            // 未提交，可以添加
            zDXSJSService.addZDXSJS(zDXSJS);
        }
    }

    @NeedLogin
    @RequestMapping("/saveMasterCount")
    @ResponseBody
    public void save(Integer slwNum, Integer xlwNum, Users users) {
        ZDSSLW zDSSLW = new ZDSSLW();
        String gh = users.getGh();
        zDSSLW.setGh(gh);
        zDSSLW.setNd(DateUtils.getCurrentYear());
        zDSSLW.setSylwrs(slwNum);
        zDSSLW.setXylwrs(xlwNum);
        float gzl = slwNum * 50 + xlwNum * 10;
        zDSSLW.setGzl(gzl);
        // 判断数据库中是否有记录
        int count = zDSSLWService.isOnlyForOneYear(users.getGh(), DateUtils.getCurrentYear());
        if (tjztService.getTjzt(users.getGh()).getYjstjzt() == 0) {
            // 未提交，可以修改
            if(count == 0) {
                // 添加
                zDSSLWService.addZDSSLW(zDSSLW);
            }else {
                // 更新
                zDSSLWService.updateZDSSLW(zDSSLW);
            }
        }
    }

    /* 获取论文工作量 */
    @NeedLogin
    @RequestMapping("/getMasterLwGzl")
    @ResponseBody
    public Float getLwGzl(Users users) {
        return zDSSLWService.getAllMasterLwGzl(users.getGh(), xqnd);
    }

    /* 获取指导学生工作量 */
    @NeedLogin
    @RequestMapping("/getMasterStudentCompetitionGzl")
    @ResponseBody
    public Float getMasterStudentCompetitionGzl(Users users) {
        return zDXSJSService.getAllGzl2(users.getGh(), xqnd);
    }

    @NeedLogin
    @RequestMapping("/getMasterAllGzl")
    @ResponseBody
    public Float getAllGzl(Users users) {
        Float gul2 = zDXSJSService.getAllGzl2(users.getGh(), xqnd);
        Float lwgzl = zDSSLWService.getAllMasterLwGzl(users.getGh(), xqnd);
        if(lwgzl != null && gul2 != null) {
            return gul2+lwgzl;
        }else if(lwgzl != null){
            return lwgzl;
        }else if(gul2 != null) {
            return gul2;
        }else {
            return 0f;
        }
    }

    /**
     * 删除研究生竞赛
     */
    @NeedLogin
    @RequestMapping(value = "/deleteGraduate")
    public String deleteGraduate(@ModelAttribute(value = "id") Integer id, Users users) {
        if (tjztService.getTjzt(users.getGh()).getYjstjzt() == 0) {
            // 未提交，可以删除
            zDXSJSService.remove(id);
        }
        return "redirect:masterKnow";
    }

    @NeedLogin
    @PostMapping("/selectGraduteAwardByYear")
    public String selectGraduteAwardByYear(@ModelAttribute(value = "xqnd") Integer xqnd){
        this.xqnd = xqnd;
        return "redirect:masterKnow";
    }
}
