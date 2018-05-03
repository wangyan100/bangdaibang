package com.yanwang.bdbang.service;

import com.yanwang.bdbang.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
