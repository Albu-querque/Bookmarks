package net.service;

/**
 *
* Service class for {@link net.model.User}
 *
* */

import net.model.User;

import java.util.List;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
    List<User> listUsers();
    void deleteUser(int id);
}
