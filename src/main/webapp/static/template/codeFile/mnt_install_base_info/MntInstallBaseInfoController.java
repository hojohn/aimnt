package com.ai.mnt.web.inst;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.inst.MntInstallBaseInfo;
import com.ai.mnt.service.inst.MntInstallBaseInfoService;

/**
 * @Title: MntInstallBaseInfoController 
 * @Description: MntInstallBaseInfoController ControllerPackage
 * @Author: Auto Generate 
 * @Date: 2016-5-11
 */

@Controller
@RequestMapping("/inst")
public class MntInstallBaseInfoController {

    @Autowired
    MntInstallBaseInfoService mntInstallBaseInfoService;
    
    /**
     * 安装点信息界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/base/page")
    public String showMntInstallBaseInfoPage(Model model) {
        return "/inst/base/base_info";
    }
    
    /**
     * 获取安装点信息列表
     * @param mntInstallBaseInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/base/query")
    @ResponseBody
    public Map<String, Object> getMntInstallBaseInfoList(MntInstallBaseInfo mntInstallBaseInfo) {
        List<MntInstallBaseInfo> mntInstallBaseInfoList = mntInstallBaseInfoService.findmntInstallBaseInfoList(MntInstallBaseInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntInstallBaseInfoList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点信息新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/base/add_page")
    public String showMntInstallBaseInfoAddPage(Model model) {
        return "/inst/base/base_add";
    }
    
    /**
     * 安装点信息保存
     * @param mntInstallBaseInfo
     * @return Map<String, Object>
     */
    @RequestMapping("/base/add")
    @ResponseBody
    public Map<String, Object> saveMntInstallBaseInfo(MntInstallBaseInfo mntInstallBaseInfo) {
        mntInstallBaseInfoService.saveMntInstallBaseInfo(mntInstallBaseInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点信息更新界面跳转
     * @param  model
     * @param  baseId
     * @return
     */
    @RequestMapping("/base/update_page/{baseId}")
    public String showMntInstallBaseInfoUpdatePage(Model model, @PathVariable String baseId) {
        MntInstallBaseInfo mntInstallBaseInfo = mntInstallBaseInfoService.findMntInstallBaseInfoBybaseId(Integer.parseInt(baseId));
        model.addAttribute("mntInstallBaseInfo", mntInstallBaseInfo);
        return "/inst/base/base_update";
    }
    
    /**
     * 安装点信息根据主键更新
     * @param mntInstallBaseInfo
     * @return
     */
    @RequestMapping("/base/update")
    @ResponseBody
    public Map<String, Object> updateMntInstallBaseInfo(MntInstallBaseInfo mntInstallBaseInfo) {
        mntInstallBaseInfoService.updateMntInstallBaseInfoByBaseId(mntInstallBaseInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 安装点信息根据主键批量删除
     * @param baseIds
     * @return Map<String, Object>
     */
    @RequestMapping("/base/delete/{baseIds}")
    @ResponseBody
    public Map<String, Object> deleteMntInstallBaseInfoBybaseIds(@PathVariable String baseIds) {
        mntInstallBaseInfoService.deleteMntInstallBaseInfoByBaseIds(baseIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
}
