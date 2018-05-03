package com.yanwang.bdbang.repository;

import com.yanwang.bdbang.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long>{
    
    Role findByName(String name);
}
