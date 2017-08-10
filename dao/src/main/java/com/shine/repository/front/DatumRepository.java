package com.shine.repository.front;

import com.shine.model.ysl.Datum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DatumRepository extends JpaRepository<Datum,String> {
    List<Datum> findByLcdm(String lcdm);
}
