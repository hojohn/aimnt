package com.ai.mnt.model.product;

import java.util.Date;

/**
 * @Title: MntProdProc 
 * @Description: MntProdProc Model
 * @Author: Auto Generate 
 * @Date: 2016-4-28
 */
public class MntProdProc {

    /**进程编号*/
    private Integer procId;

    /**进程英文名称*/
    private String procNameEn;

    /**进程中文名称*/
    private String procNameCn;

    /**进程描述*/
    private String procDesc;

    /**删除标识，1删除，0未删除*/
    private String deleteFlag;

    /**创建人*/
    private String creator;

    /**创建时间*/
    private Date createDate;

    /**修改人*/
    private String modifier;

    /**修改时间*/
    private Date modifyDate;


    public Integer getProcId() {
        return procId;
    }

    public void setProcId(Integer procId) {
        this.procId = procId;
    }

    public String getProcNameEn() {
        return procNameEn;
    }

    public void setProcNameEn(String procNameEn) {
        this.procNameEn = procNameEn;
    }

    public String getProcNameCn() {
        return procNameCn;
    }

    public void setProcNameCn(String procNameCn) {
        this.procNameCn = procNameCn;
    }

    public String getProcDesc() {
        return procDesc;
    }

    public void setProcDesc(String procDesc) {
        this.procDesc = procDesc;
    }

    public String getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getModifier() {
        return modifier;
    }

    public void setModifier(String modifier) {
        this.modifier = modifier;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }


}