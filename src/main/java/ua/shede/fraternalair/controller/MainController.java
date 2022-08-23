package ua.shede.fraternalair.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.shede.fraternalair.service.FlightService;

@Controller
public class MainController {

    private final FlightService flightService;

    @Autowired
    public MainController(FlightService flightService){
        this.flightService = flightService;
    }

    @GetMapping("/")
    public String homePage(Model model){
        model.addAttribute("newflights", flightService.getLastThreeFlights());
        return "index";
    }

}
