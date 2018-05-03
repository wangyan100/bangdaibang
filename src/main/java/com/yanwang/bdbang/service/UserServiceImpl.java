package com.yanwang.bdbang.service;

import com.yanwang.bdbang.model.Role;
import com.yanwang.bdbang.model.User;
import com.yanwang.bdbang.repository.RoleRepository;
import com.yanwang.bdbang.repository.UserRepository;
import com.yanwang.bdbang.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        //user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Role adminrole = roleRepository.findByName("ROLE_ADMIN");
        Role userrole = roleRepository.findByName("ROLE_USER");
        if (user.getUsername().equalsIgnoreCase(Util.getAdminName())) // user.setRoles(new HashSet<>(roleRepository.findAll()));
        {
            HashSet<Role> roles = new HashSet<Role>();
            roles.add(adminrole);
            user.setRoles(roles);
        } else {
            HashSet<Role> roles = new HashSet<Role>();
            roles.add(userrole);
            user.setRoles(roles);
        }
        userRepository.save(user);

    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
