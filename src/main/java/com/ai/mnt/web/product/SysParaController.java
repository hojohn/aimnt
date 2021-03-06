package com.ai.mnt.web.product;

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
import com.ai.mnt.model.product.SysPara;
import com.ai.mnt.service.product.SysParaService;

/**
 * @Title: SysParaController 
 * @Description: SysParaController ControllerPackage
 * @Author: Auto Generate. HE
 * @Date: 2016-5-17
 */

@Controller
@RequestMapping("/prod")
public class SysParaController {

    @Autowired
    SysParaService sysParaService;
    
    /**
     * 系统参数表XG.SYSPARA界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/sys_para/page")
    public String showSysParaPage(Model model) {
        return "product/sys_para/sys_para_query";
    }
    
    /**
     * 获取系统参数表XG.SYSPARA列表
     * @param sysPara
     * @return Map<String, Object>
     */
    @RequestMapping("/sys_para/query")
    @ResponseBody
    public Map<String, Object> getSysParaList(SysPara sysPara) {
        List<SysPara> sysParaList = sysParaService.findSysParaList(sysPara);
        Map<String, Object> map = new HashMap<>();
        map.put("data", sysParaList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 系统参数表XG.SYSPARA新增界面跳转   增加时添加数据
     * @param  model
     * @return String
     */
    @RequestMapping("/sys_para/add_page")
    public String showSysParaAddPage(Model model) {
       
       List<EnumObject> paramSystemEnums=BaseDataCache
                .getDataList("PARA_SYSTEM");
       List<EnumObject> paramTypeEnums= BaseDataCache
               .getDataList("PARA_TYPE");
       List<EnumObject> verEnums = BaseDataCache
               .getDataList("PROD_VER");
       List<EnumObject> prodEnums = BaseDataCache
               .getDataList("PROD_INFO");
       List<EnumObject> baseIdEnums = BaseDataCache
               .getDataList("BASE_NAME_ENUM");
       
       model.addAttribute("paramSystemEnums", paramSystemEnums);
       model.addAttribute("paramTypeEnums", paramTypeEnums);
       model.addAttribute("verEnums", verEnums);
       model.addAttribute("prodEnums", prodEnums);
       model.addAttribute("baseIdEnums", baseIdEnums);
       
        return "product/sys_para/sys_para_add";
        
    }
    
    /**
     * 系统参数表XG.SYSPARA保存
     * @param sysPara
     * @return Map<String, Object>
     */
    @RequestMapping("/sys_para/add")
    @ResponseBody
    public Map<String, Object> saveSysPara(SysPara sysPara) {
        sysParaService.saveSysPara(sysPara);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 系统参数表XG.SYSPARA更新界面跳转   修改时获取数据
     * @param  model
     * @param  paraId
     * @return
     */
    @RequestMapping("/sys_para/update_page/{paraId}")
    public String showSysParaUpdatePage(Model model, @PathVariable String paraId) {
        SysPara sysPara = sysParaService.findSysParaByParaId(Integer.parseInt(paraId));
        model.addAttribute("sysPara", sysPara);
        
        List<EnumObject> paramSystemEnums=BaseDataCache
                .getDataList("PARA_SYSTEM");
       List<EnumObject> paramTypeEnums= BaseDataCache
               .getDataList("PARA_TYPE");
       List<EnumObject> verEnums = BaseDataCache
               .getDataList("PROD_VER");
       List<EnumObject> prodEnums = BaseDataCache
               .getDataList("PROD_INFO");
       List<EnumObject> baseIdEnums = BaseDataCache
               .getDataList("BASE_NAME_ENUM");
       
       model.addAttribute("paramSystemEnums", paramSystemEnums);
       model.addAttribute("paramTypeEnums", paramTypeEnums);
       model.addAttribute("verEnums", verEnums);
       model.addAttribute("prodEnums", prodEnums);
       model.addAttribute("baseIdEnums", baseIdEnums);
        
        
        return "product/sys_para/sys_para_update";
    }
    
    /**
     * 系统参数表XG.SYSPARA根据主键更新
     * @param sysPara
     * @return
     */
    @RequestMapping("/sys_para/update")
    @ResponseBody
    public Map<String, Object> updateSysPara(SysPara sysPara) {
        sysParaService.updateSysParaByParaId(sysPara);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 系统参数表XG.SYSPARA根据主键批量删除
     * @param paraIds
     * @return Map<String, Object>
     */
    @RequestMapping("/sys_para/delete/{paraIds}")
    @ResponseBody
    public Map<String, Object> deleteSysParaByParaIds(@PathVariable String paraIds) {
        sysParaService.deleteSysParaByParaIds(paraIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询系统参数表XG.SYSPARA详细信息
     * @param model
     * @return
     */
    @RequestMapping("/sys_para/{paraId}/page")
    public String querySysParaByParaId(Model model, @PathVariable String paraId) {
        SysPara sysPara = new SysPara();
        sysPara.setParaId(Integer.parseInt(paraId));
        List<SysPara> sysParaList = sysParaService.findSysParaList(sysPara);
        if(sysParaList != null && sysParaList.size() > 0) { //只会有一条数据
            model.addAttribute("sysPara", sysParaList.get(0));
        }
        return "product/sys_para/sys_para_info";
    }
}
