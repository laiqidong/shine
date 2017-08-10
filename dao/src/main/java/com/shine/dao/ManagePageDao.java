package com.shine.dao;


import com.shine.model.manage.RoleEntity;
import com.shine.model.message.Information;
import com.shine.model.system.DataBaseJobs;
import com.shine.model.system.SysConfig;
import com.shine.model.ysl.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * Created by luoxuan on 2017/3/3.
 * Description:
 */
@Repository
public interface ManagePageDao {

    int deleteBatch(@Param("table") String table, @Param("ids") String ids);

    List<DataBaseJobs> getDatabaseJobList(DataBaseJobs t);

    int updateBySql(@Param("sql") String sql);

    int deleteBySql(@Param("sql") String sql);

    List<HashMap> queryBySql(@Param("sql") String sql);

    List getSysConfigList(SysConfig t);

    List getRoleList(RoleEntity t);

    List getWorkGuideList(WorkGuide t);

    List getQuestionAnswerList(QuestionAnswer t);

    List getDocumentDownloadList(DocumentDownload t);

    List getDownloadTypeList(DownloadType t);

    List getPubUserList(PubUser t);

    List getKfsList();

    List getUserLoginLogList();

    List getHelpList(Help t);

    List getInformationList(Information t);

    List getInfoTypeList(InfoType t);

    List getDictList(Dict t);
}
