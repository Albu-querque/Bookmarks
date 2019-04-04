package net.controller;

import net.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/us")
public class ControllerUsers {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/usersList")
    public String usersList(Model model) {
        model.addAttribute("users", userService.listUsers());
        return "list_users";
    }

    @RequestMapping(value = "/usersList/remove_user/{id}")
    public String removeUser(@PathVariable("id") int id) {
        userService.deleteUser(id);
        return "redirect:/us/usersList";
    }
}
