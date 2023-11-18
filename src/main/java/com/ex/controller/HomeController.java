package com.ex.controller;

import com.ex.model.AuthRequest;
import com.ex.model.CreateCustomer;
import com.ex.model.Customer;
import com.ex.service.ApiService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class HomeController {
    private final ApiService apiService;
    private static final String SESSION_TOKEN_KEY = "token";
    public HomeController(ApiService apiService) {
        this.apiService = apiService;
    }

    //    ...............login...............
    @RequestMapping("/*")
    public String protectAllPage() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String goToLoginPage(HttpSession session) {
        if (isLoggedIn(session))
            return "redirect:/customer";
        return "login-user";
    }


    //    pages(create, read, update page)
    @GetMapping("/addCustomer")
    public String addCustomerPage(
            HttpSession session, Model model) {
        session.removeAttribute("uuid");
        if(!isLoggedIn(session))
            return  "redirect:/login";
        return "add-customer";
    }

    @GetMapping("/customer")
    public String getCustomerListPage(HttpSession session, Model model) {
        if (!isLoggedIn(session))
            return "redirect:/login";
        model.addAttribute("customerList", apiService.getCustomerList(session));
        return "customer-list";

    }

    @GetMapping("/updateCustomer")
    public String updatePage(@RequestParam String uuid,
                             @RequestParam String first_name,
                             @RequestParam String last_name,
                             @RequestParam String street,
                             @RequestParam String address,
                             @RequestParam String city,
                             @RequestParam String state,
                             @RequestParam String email,
                             @RequestParam String phone,
                             HttpSession session,
                             Model model) {
        session.setAttribute("uuid", uuid);
        Customer customer = new Customer(uuid.trim(), first_name.trim(), last_name.trim(), street.trim(),
                address.trim(), city.trim(), state.trim(), email.trim(), phone.trim());
        System.out.println("customer for update " + customer);
        model.addAttribute("customer", customer);
        return "update-customer";
    }


    //..........................customer operation..............................................................................................
    @PostMapping("/login")
    public String submitForm(@RequestParam String login_id,
                             @RequestParam String password,
                             Model model,
                             RedirectAttributes redirectAttributes,
                             HttpSession session) {

        AuthRequest user = new AuthRequest();
        user.setLogin_id(login_id);
        user.setPassword(password);

        boolean verify = apiService.verify(login_id, password);
        if (verify) {
            AuthRequest authRequest = new AuthRequest(login_id, password);
            String token = apiService.generateToken(session,authRequest);
            session.setAttribute("token", token);
            redirectAttributes.addFlashAttribute("user", user);
            return "redirect:/customer";
        } else {
            model.addAttribute("error", "Invalid Credentials");
            return "login-user";
        }
    }

    @PostMapping("/customer")
    public String addCustomer(
            @RequestParam String first_name,
            @RequestParam String last_name,
            @RequestParam String street,
            @RequestParam String address,
            @RequestParam String city,
            @RequestParam String state,
            @RequestParam String email,
            @RequestParam String phone,
            HttpSession session,
            Model model) {
        CreateCustomer customer = new CreateCustomer(first_name, last_name, street, address, city, state, email, phone);

//        System.out.println("Received CreateCustomer: " + customer);
        boolean add = apiService.add(session, customer);
        if (add) {
            model.addAttribute("msg", "add success");

        } else {
            model.addAttribute("msg", "add fail");
        }
        return "add-customer";
    }

    @PostMapping("/updateCustomer")
    public String updateCustomer(
            @RequestParam String first_name,
            @RequestParam String last_name,
            @RequestParam String street,
            @RequestParam String address,
            @RequestParam String city,
            @RequestParam String state,
            @RequestParam String email,
            @RequestParam String phone,
            HttpSession session,
            RedirectAttributes redirectAttributes

    ) {
        String uuid = (String) session.getAttribute("uuid");
//        System.out.println("uuid" + uuid);
        CreateCustomer createCustomer = new CreateCustomer(first_name, last_name, street, address, city, state, email, phone);
        System.out.println("Received CreateCustomer: " + createCustomer);
        boolean updated = apiService.update(session, uuid, createCustomer);

        if (updated) {
            session.removeAttribute("uuid");
            redirectAttributes.addFlashAttribute("msg", "update success");

            return "redirect:/customer-list";
        }
        redirectAttributes.addFlashAttribute("msg", "update fail");
        return "update-customer";
    }


    @GetMapping("/deleteCustomer")
    public String delete(HttpSession session, RedirectAttributes model, @RequestParam("uuid") String uuid) {
        boolean delete = apiService.delete(session, uuid);
        if (delete) {
            model.addFlashAttribute("msg", "delete success");
        } else {
            model.addFlashAttribute("msg", "delete fail");
        }

        return "redirect:/customer-list";
    }

    @ResponseBody
    @GetMapping("/logout")
    public RedirectView logout(HttpSession session) {
        if (isLoggedIn(session)) {
            session.removeAttribute("token");
        }
        return new RedirectView("/");
    }


    private boolean isLoggedIn(HttpSession session) {
        String token = (String) session.getAttribute("token");
        return token != null && !token.isEmpty();
    }

}

