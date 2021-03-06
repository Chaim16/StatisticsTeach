package org.jplus.controller;

import org.jplus.dto.LoginVo;
import org.jplus.interceptor.NeedLogin;
import org.jplus.pojo.Users;
import org.jplus.pojo.queryVo.UserVo;
import org.jplus.service.UserService;
import org.jplus.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@Controller
public class UserController {

    private static final int OFFICE_TEACHER_NUM = 22;
    private static final String OFFICE_NAME = "教务处";
    private static final String OFFICE_TEACHER_NAME = "教务处审核人";
    private static final String USER_TYPE_NAME = "普通教师";
    private static final String YXSH_TEACHER = "院系本科生审核人";
    private static final String YXSHY_TEACHER = "院系研究生审核人";
    private static final String OFFICE_YJS_NAME = "研究生处";
    private static final String OFFICE_YXSHY_TEACHER = "研究生处审核人";

    @Autowired
    private UserService userService;

    @RequestMapping("/do_login")
    public String login(HttpServletResponse response, HttpServletRequest request, @Validated @ModelAttribute(value =
            "loginVo")
            LoginVo loginVo, BindingResult bindingResult, Model model) throws IOException {
        if (bindingResult.hasErrors()){
            model.addAttribute("error","账号或密码不能为空！！！");
            return "Login";
        }
        Users user=userService.login(loginVo,request,response);
        if (user==null){
            model.addAttribute("error","账号密码错误");
            return "Login";
        }
        if(user.getActor()==5){
            return "redirect:officeUserY";
        }
        if (user.getActor()==4){
            return "redirect:officecollegeYY";
        }
        if (user.getActor()==3){
            return "redirect:officeUser";
        }
        if (user.getActor()==2){
            return "redirect:user";
        }
        return "redirect:basicinformation";
    }

    /**
     * 修改本院用户密码
     * */
    @RequestMapping("/updatepassword")
    @NeedLogin
    public String updatePassword(Users user,String oldPassword,String newPassword,Model model,HttpServletRequest request){
        System.out.println(oldPassword+":"+newPassword);
        boolean isOK = userService.updatePassword(user.getGh(), oldPassword, newPassword,request);
        if (!isOK){
            model.addAttribute("error","旧密码不正确！！！");
            return "redirect:basicinformation";
        }
        return "redirect:/";
    }

    @RequestMapping("/updatepassword2")
    @NeedLogin
    public String updatePassword2(Users user,String oldPassword,String newPassword,Model model,HttpServletRequest request){
        System.out.println(oldPassword+":"+newPassword);
        boolean isOK = userService.updatePassword(user.getGh(), oldPassword, newPassword,request);
        if (!isOK){
            model.addAttribute("error","旧密码不正确！！！");
            return "redirect:user";
        }
        return "redirect:/";
    }

    @RequestMapping("/updatepassword3")
    @NeedLogin
    public String updatePassword3(Users user,String oldPassword,String newPassword,Model model,HttpServletRequest request){
        System.out.println(oldPassword+":"+newPassword);
        boolean isOK = userService.updatePassword(user.getGh(), oldPassword, newPassword,request);
        if (!isOK){
            model.addAttribute("error","旧密码不正确！！！");
            return "redirect:officeUser";
        }
        return "redirect:/";
    }

    /**
     * 进入教务处用户首页
     * */
    @RequestMapping("/officeUser")
    @NeedLogin
    public String hello1(Model model, Users users) {
        List<UserVo> officeUserList = userService.getAllOfficeUsers(users.getActor());
        for(int i = 0; i < officeUserList.size(); i++) {
            if(officeUserList.get(i).getActor() == 3) {
                officeUserList.get(i).setYsname(OFFICE_NAME);
                officeUserList.get(i).setActerName(OFFICE_TEACHER_NAME);
            }
            if(officeUserList.get(i).getActor() == 2) {
                // 找到该用户的院系编码
                Integer yxbm = userService.findYxmcByActor(officeUserList.get(i).getGh());
                // 根据该用户的院系编码找到
                String yxmc = userService.findYxmcByYxbm(yxbm);

                officeUserList.get(i).setYsname(yxmc);
                officeUserList.get(i).setActerName(YXSH_TEACHER);
            }
        }
        model.addAttribute("officeUserList", officeUserList);
        return "departmentmaintenance";
    }
    /**
     * 进入本院用户首页
     * */
    @RequestMapping("/user")
    @NeedLogin
    public String hello(Model model, Users users) {
        List<UserVo> userList = userService.getAllUsers(users.getYxbm());
        // 根据用户的院系编号编码查找其院系名称
        String yxmc = userService.findYxmcByYxbm(users.getYxbm());
        for(int i = 0; i < userList.size(); i++) {
            if (userList.get(i).getActor()==1){
                userList.get(i).setActerName(USER_TYPE_NAME);
            }
            if (userList.get(i).getActor()==2){
                userList.get(i).setActerName(YXSH_TEACHER);
            }if (userList.get(i).getActor()==4){
                userList.get(i).setActerName(YXSHY_TEACHER);
            }
            if(yxmc != null) {
                userList.get(i).setYsname(yxmc);
            }
        }
        model.addAttribute("userList", userList);
        return "officemaintenance";
    }

    /**
     * 添加本院用户
     * */
    @RequestMapping("/addUser")
    @ResponseBody
    @NeedLogin
    public String addUser(Users users, String gh, String name, int type) {
        Users user = new Users();
        user.setYxbm(users.getYxbm());
        user.setGh(gh);
        user.setUname(name);
        user.setActor(type);
        user.setUpassword(MD5Util.md5("hs123456"));
        // 判断主键工号是否重复
        int flag = userService.checkGhIsRepeat(gh);
        if(flag == 0) {
            // 没有重复，可以添加
            userService.addUser(user);
        }else {
            return "该工号重复，请重新添加";
        }
        return "添加成功";
    }
    /**
     * 添加教务处教师用户
     * */
    @RequestMapping("/addOfficeUser")
    @ResponseBody
    @NeedLogin
    public String addOfficeUser(Integer department, String gh, String name, int type) {
        Users user = new Users();
        user.setYxbm(department);
        user.setYxbm(department);
        user.setGh(gh);
        user.setUname(name);
        user.setActor(type);
        user.setUpassword(MD5Util.md5("hs123456"));
        // 判断主键工号是否重复
        int flag = userService.checkGhIsRepeat(gh);
        if(flag == 0) {
            // 没有重复，可以添加
            userService.addOfficeUser(user);
        }else {
            return "该工号重复，请重新添加";
        }
        return "添加成功";
    }

    /**
     * 删除本院用户
     */
    @NeedLogin
    @RequestMapping(value = "/deleteUser")
    public String delete(@ModelAttribute(value = "gh") String gh) {
        userService.deleteUser(gh);
        return "redirect:user";
    }


    /**
     * 删除教务处用户
     */
    @NeedLogin
    @RequestMapping(value = "/deleteOfficeUser")
    public String deleteOfficeUser(@ModelAttribute(value = "gh") String gh) {
        userService.deleteUser(gh);
        return "redirect:officeUserY";
    }

}
