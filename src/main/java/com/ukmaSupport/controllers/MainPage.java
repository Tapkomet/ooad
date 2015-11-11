package com.ukmaSupport.controllers;

import com.ukmaSupport.services.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class MainPage {

    @Autowired
    private UserService userDao;

    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "Welcome!");
        return "mainPage/mainPage";
    }

    @RequestMapping({"/login"})
    public String showLoginForm() {
        return "mainPage/loginPage";
    }


    @RequestMapping({"/login_error"})
    public String showLoginError() {
        return "mainPage/failedLogin";
    }

    @RequestMapping({"/succesfullRegistration"})
    public String authorizationSuccesfull() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();
        session.setAttribute("id", userDao.getByEmail(auth.getName()).getId());
        return "redirect:/userhome";
    }
}