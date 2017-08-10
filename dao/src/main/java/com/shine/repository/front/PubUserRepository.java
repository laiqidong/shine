package com.shine.repository.front;

import com.shine.model.ysl.PubUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by luoxuan on 2017/4/12.
 * Description:
 */

@Repository
public interface PubUserRepository extends JpaRepository<PubUser,Integer> {
//    @Query(value = "SELECT * FROM PUB_USER t WHERE  t.account=?1 and t.password=?2" ,nativeQuery=true)
//    PubUser selectUser(@Param("username") String username, @Param("password") String password);

   //@Query(value = "SELECT * FROM PUB_USER t WHERE  t.account=?1 and t.password=?2 and t.type=?3" ,nativeQuery=true)
    PubUser findByAccountAndPasswordAndType(String account, String password, Integer type);

   // @Query(value = "SELECT * FROM PUB_USER t WHERE  t.account=?1" ,nativeQuery=true)
    PubUser findByAccountAndStatusNotIn(String account, Integer status);
    PubUser findByAccountAndStatus(String account, Integer status);

    PubUser findByIdCard(String idCard);

    PubUser findByCompanyPhone(String companyPhone);

    PubUser findByToken(String token);
}
