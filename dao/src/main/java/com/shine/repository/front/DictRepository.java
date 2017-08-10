package com.shine.repository.front;

import com.shine.model.ysl.Dict;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DictRepository extends JpaRepository<Dict,Long> {
    Dict findAllByNameAndCode(String name, String code);

    Dict findAllByNameAndValue(String name, String value);

    Dict findByName(String name);

    List<Dict> findByStatus(Integer status);

    List<Dict> findAllByName(String name);
}
