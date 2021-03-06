package org.jplus.service;

import org.jplus.pojo.undergraduateCompatitonAndOther.QTJXGZ;
import org.jplus.pojo.undergraduateCompatitonAndOther.ZDXSLW;
import org.jplus.pojo.check.BkssjjxInfo;
import org.jplus.pojo.check.YjssjjxInfo;
import org.jplus.pojo.masterCompartitionAndOther.YJSQTJX;
import org.jplus.pojo.masterCompartitionAndOther.ZDSSLW;

import java.sql.Timestamp;


public interface CheckService {

//    根据工号查院系编码
    public Integer getLxbmByGh(String gh);
//    <!--根据工号查院系名称-->
    public String getLxmcByGh(String gh);

    public String getYxmc(Integer yxbm);

    public BkssjjxInfo getBKSSJJXInfo(String gh);

    // 其他教学工作信息  研究生
    public YJSQTJX getYJSQTJXInfo(String gh);

    // 指导学士论文 本科生 学生论文
    public ZDXSLW getZDXSLWInfo(String gh);

    // 根据工号取出其他教学工作信息  ,本科生 QTJXGZ
    public QTJXGZ getQTJXGZInfo(String gh);

    // 指导学士论文 本科生 硕士论文 ZDSSLW
    public ZDSSLW getZDSSLWInfo(String gh);

    public YjssjjxInfo getYJSSJJXInfo(String gh);

    // <!--本科学生竞赛工作量-->
    public Float getZdxsjsGzl(String gh);

    // <!--研究生 学生竞赛工作量-->
    public Float getYjsZdxsjsGzl(String gh);

    // <!--教师竞赛工作量-->
    public Float getJsjsGzl(String gh);

    //<!--撤回提交状态 撤回审核状态-->
    public void clearTjztAndShzt(String gh);

    //<!--院系  更新审核状态为1 -->
    public void setShztByDepartments(String gh, String userName, Timestamp date);

    //<!--教务处  更新审核状态为2 -->
    public void setShztByOffice(String gh, String userName, Timestamp date);

    //<!--院系 更新审核人姓名到提交表 -->
    public void setShrgh(String gh,String shrgh);

    public void setShztByDepartmentsY(String gh, String uname, Timestamp date);

    public void setShztByOfficeY(String gh, String uname, Timestamp date);
}
