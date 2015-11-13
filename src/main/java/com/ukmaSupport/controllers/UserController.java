package com.ukmaSupport.controllers;

import com.ukmaSupport.models.*;
import com.ukmaSupport.services.interfaces.AuditoriumService;
import com.ukmaSupport.services.interfaces.OrderService;
import com.ukmaSupport.services.interfaces.UserService;
import com.ukmaSupport.services.interfaces.WorkplaceService;
import com.ukmaSupport.utils.OrderValidator;
import com.ukmaSupport.utils.PasswordChangeValidator;
import com.ukmaSupport.utils.PasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class UserController {

    private final static String DONE = "done";
    private final static String UNDONE = "Undone";

    @Autowired
    private OrderService orderService;

    @Autowired
    private AuditoriumService auditoriumService;

    @Autowired
    private WorkplaceService workplaceService;

    @Autowired
    private UserService userService;

    @Autowired
    @Qualifier("passChangeValidator")
    private PasswordChangeValidator passwordValidator;

    @Autowired
    @Qualifier("orderValidator")
    private OrderValidator validator;


    @RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Workplace> getCharNum(@RequestParam("text") String text) {
        List<Workplace> workplaces = workplaceService.getByAuditoryName(text);
        return workplaces;
    }

    @RequestMapping(value = "/createOrder", method = RequestMethod.GET)
    public String createOrder(ModelMap model) {
        Order order = new Order();
        List<Auditorium> auditoriums = auditoriumService.getAll();
        model.addAttribute("newOrder", order);
        model.addAttribute("auditoriums", auditoriums);
        return "userPage/createOrderPage";
    }

    @RequestMapping(value = "/createOrder", method = RequestMethod.POST)
    public String createOrderPost(@ModelAttribute("newOrder") Order order, @RequestParam("workplace_access_num") int workplaceNum, ModelMap model, BindingResult result) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();
        //order.setWorkspaceNumber(workplaceNum);
        order.setUserId((Integer) session.getAttribute("id"));
        order.setStatus(UNDONE);
        order.setCreatedAt(new Timestamp(new java.util.Date().getTime()));
        order.setAssistantId(order.getUserId());
        //validator.validate(order,result);

        order.setWorkplace_id(workplaceService.getByNumber(Integer.parseInt(order.getWorkplace_access_num())).getId());
        orderService.createOrUpdate(order);
        return "redirect:/userhome";
    }

    @RequestMapping(value = "/userhome", method = RequestMethod.GET)
    public String listUsersOrder(ModelMap model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();
        int userid = (Integer) session.getAttribute("id");

        System.out.println(userid);
        List<Order> orders = orderService.getByUserId(userid);
        model.addAttribute("userOrder", orders);
        return "userPage/userHomePage";
    }

    @RequestMapping(value = "/unComplited", method = RequestMethod.GET)
    public @ResponseBody List<Order> uncompletedOrder() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();
        int userId = (Integer) session.getAttribute("id");

        System.out.println(userId);
        List<Order> orders = orderService.getByUserIdStatus(userId, UNDONE);
        return orders;
    }

    @RequestMapping(value = "/allUserOrders", method = RequestMethod.GET)
    public @ResponseBody List<Order> getOrders() {

        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();

        int userId = (Integer) session.getAttribute("id");
        System.out.println(userId);
        List<Order> orders = orderService.getByUserId(userId);
        return orders;
    }

    @RequestMapping(value = "/allComplited", method = RequestMethod.GET)
    public @ResponseBody List<Order> getCompleted() {

        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();

        int userId = (Integer) session.getAttribute("id");
        System.out.println(userId);
        List<Order> orders = orderService.getByUserIdStatus(userId, DONE);
        return orders;
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public String editProfile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        User user = userService.getByEmail(name);
        EditForm editForm = new EditForm();
        editForm.setFirstName(user.getFirstName());
        editForm.setLastName(user.getLastName());
        editForm.setEmail(user.getEmail());
        model.addAttribute("passChangeForm", editForm);
        return "userPage/editProfile";
    }


    @RequestMapping(value = "/editProfile", method = RequestMethod.POST)
    public String profileEdited(@ModelAttribute("passChangeForm") EditForm editForm, BindingResult result) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        User user = userService.getByEmail(name);
        passwordValidator.validate(editForm, result);
        if (result.hasErrors())
            return "userPage/editProfile";
        String pass = PasswordEncryptor.encode(editForm.getPassword());
        user.setPassword(pass);
        userService.saveOrUpdate(user);
        return "userPage/passwordChangeSuccess";
    }
}
