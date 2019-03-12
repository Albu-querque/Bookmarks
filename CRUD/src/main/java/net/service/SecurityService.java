package net.service;

/*
*
* Service for Security
*
* */

public interface SecurityService {
    String findLoggedUsername();
    void autoLogin(String username, String password);
}
