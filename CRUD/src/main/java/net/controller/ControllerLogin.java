package net.controller;
/**
 *
 * Controller for {@link net.model.User} class
 *
 * */
import net.model.User;
import net.service.SecurityService;
import net.service.UserService;
import net.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerLogin {
    @Autowired
    private UserService userService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model){
        userValidator.validate(userForm, bindingResult);

        if(bindingResult.hasErrors()) {
            return "registration";
        }


            userService.save(userForm);
            securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());
            return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout){
        if(error != null)
            model.addAttribute("error", "Username or password incorrect");

        if(logout != null)
            model.addAttribute("message", "Logged out successfully");

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        User user = userService.findByUsername(securityService.findLoggedUsername());
        model.addAttribute("roles", user.getRoles());
        return "welcome";
    }
}
