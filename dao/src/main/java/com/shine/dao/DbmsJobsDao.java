package com.shine.dao;

import com.shine.model.system.DataBaseJobs;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * Created by luoxuan on 2017/2/28.
 * Description:
 */
@Repository
public interface DbmsJobsDao {
    List<HashMap> queryBySql(@Param("sql") String sql);

    int saveJob(DataBaseJobs t);

    int removeJob(@Param("job") Integer job);

    DataBaseJobs findByJob(@Param("job") Integer job);

}
