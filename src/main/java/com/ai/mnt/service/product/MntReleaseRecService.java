package com.ai.mnt.service.product;

import java.util.List;

import com.ai.mnt.model.product.MntReleaseRec;

public interface MntReleaseRecService {
    
    /**
     * 获取全部发布记录
     * @return
     */
    public List<MntReleaseRec> findAllMntReleaseRec();
    
    /**
     * 通过id获取发布记录
     * @return
     */
    public MntReleaseRec findReleaseRecById(Integer relId);
    
    /**
     * 保存发布记录
     * @return
     */
    public void saveReleaseRec(MntReleaseRec mntReleaseRec);
    
    /**
     * 更新发布记录
     * @return
     */
    public void updateReleaseRec(MntReleaseRec mntReleaseRec);
    
    /**
     * 更新发布记录
     * @return
     */
    public void deleteReleaseRec(String relId);
    
    /**
     * 通过发布记录列表
     * @return
     */
    public List<MntReleaseRec> findReleaseRecList(MntReleaseRec mntReleaseRec);

    public List<MntReleaseRec> getStatResForBaseId(MntReleaseRec mntReleaseRec);
    
    public List<MntReleaseRec> getStatResForProdId(MntReleaseRec mntReleaseRec);

    
}
