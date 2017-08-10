
package com.shine.repository.front;

import com.shine.model.message.Sms;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface SmsRepository extends JpaRepository<Sms, Integer> {
   Sms findByMobileAndEffcetiveTimeGreaterThan(String mobile, Date date);
}
