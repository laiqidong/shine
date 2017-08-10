package com.shine.dao;


import com.shine.model.ysl.Bank;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BankDao {
    List<Bank> getBankList(Bank bank);

}
