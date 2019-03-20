package net.service;

/**
 *
* Service class for {@link net.model.User}
 *
* */

import net.model.User;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
}
