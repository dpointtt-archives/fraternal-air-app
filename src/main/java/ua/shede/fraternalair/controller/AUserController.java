package ua.shede.fraternalair.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ua.shede.fraternalair.entity.AUser;
import ua.shede.fraternalair.service.AUserService;
import ua.shede.fraternalair.service.FlightService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
public class AUserController {

    private final AUserService aUserService;
    private final FlightService flightService;

    @Autowired
    public AUserController(AUserService aUserService,
                           FlightService flightService){
        this.aUserService = aUserService;
        this.flightService = flightService;
    }

    @PostMapping("/login")
    public String loginUser(String email,
                            String password,
                            Model model,
                            HttpServletRequest request){
        HttpSession session = request.getSession();
        if (aUserService.isUserExistByEmailAndPassword(email, password)){
            session.setAttribute("auser", aUserService.getAUserByEmailAndPassword(email, password));
            return "redirect:/flights/country=all";
        }else {
            model.addAttribute("loginfail", "FAIL");
            model.addAttribute("newflights", flightService.getLastThreeFlights());
            return "index";
        }
    }

    @PostMapping("/signup")
    public String signUpUser(AUser aUser,
                             Model model,
                             HttpServletRequest request){
        HttpSession session = request.getSession();

        if (Objects.nonNull(session.getAttribute("auser"))) return "redirect:/flights/country=all";

        if(aUserService.isUserExist(aUser.getEmail())){
            model.addAttribute("signupfail", "FAIL");
        }else {
            model.addAttribute("signupsuccess", "SUCCESS");
            aUserService.addNewUser(aUser);
        }
        model.addAttribute("newflights", flightService.getLastThreeFlights());
        return "index";
    }

    @PostMapping("/logout")
    public String logOutUser(HttpServletRequest request){
        HttpSession session = request.getSession();

        if (Objects.isNull(session.getAttribute("auser"))) return "redirect:/";

        session.removeAttribute("auser");
        return "redirect:/";
    }

    @GetMapping("/profile")
    public String profilePage(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();

        if(Objects.isNull(session.getAttribute("auser"))){
            return "redirect:/";
        }else {
            AUser aUser = (AUser) session.getAttribute("auser");
            model.addAttribute("ticketList", aUserService.getTicketList(aUser));
            return "profile";
        }
    }

}
