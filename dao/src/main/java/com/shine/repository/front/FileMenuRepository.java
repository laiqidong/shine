package com.shine.repository.front;

import com.shine.model.ysl.FileMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FileMenuRepository extends JpaRepository<FileMenu, Long> {

}
