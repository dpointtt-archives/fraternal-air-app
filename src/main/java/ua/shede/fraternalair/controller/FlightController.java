package ua.shede.fraternalair.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ua.shede.fraternalair.bl.PdfGenerator;
import ua.shede.fraternalair.entity.AUser;
import ua.shede.fraternalair.entity.FlightTicket;
import ua.shede.fraternalair.service.FlightService;
import ua.shede.fraternalair.service.FlightTicketService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;

@Controller
public class FlightController {

    private final FlightService flightService;
    private final FlightTicketService flightTicketService;

    @Autowired
    public FlightController(FlightService flightService, FlightTicketService flightTicketService){
        this.flightService = flightService;
        this.flightTicketService = flightTicketService;
    }

    @GetMapping("/flights/country={countryName}")
    public String getFlightsPage(@PathVariable("countryName") String countryName,
                                 Model model,
                                 HttpServletRequest request){
        HttpSession session = request.getSession();
        if (Objects.nonNull(session.getAttribute("auser"))){
            if(flightService.isCountry(countryName)){
                if (flightService.getCountryFlights(countryName).isEmpty()){
                    model.addAttribute("findNull", "FAIL");
                    model.addAttribute("flightList", flightService.getAllFlights());
                }else {
                    model.addAttribute("flightList", flightService.getCountryFlights(countryName));
                }
            }else {
                if (!Objects.equals(countryName, "all")) model.addAttribute("findNull", "FAIL");
                model.addAttribute("flightList", flightService.getAllFlights());
            }
            model.addAttribute("countryList", flightService.getAllCountries());
            return "flights";
        }else {
            return "redirect:/";
        }
    }

    @GetMapping("/flights/{flightCode}")
    public String getInfoPage(@PathVariable("flightCode") String flightCode,
                              Model model,
                              HttpServletRequest request){
        HttpSession session = request.getSession();
        if (Objects.nonNull(session.getAttribute("auser"))){
            if (Objects.nonNull(flightService.getFlightByCode(flightCode))) model.addAttribute("flightInfo", flightService.getFlightByCode(flightCode));
            return "flightinfo";
        }else {
            return "redirect:/";
        }
    }

    @PostMapping("/flights/findByCountry")
    public String getCountryFlightPage(String country, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (Objects.nonNull(session.getAttribute("auser"))){
            System.out.println(country);
            return "redirect:/flights/country=" + country;
        }else {
            return "redirect:/";
        }
    }

    @PostMapping("/flights/{flightCode}/buy")
    public String buyTicket(@PathVariable("flightCode") String flightCode, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(Objects.nonNull(session.getAttribute("auser"))){
            if (Objects.isNull(flightService.getFlightByCode(flightCode))) return "error";
            AUser aUser = (AUser) session.getAttribute("auser");
            flightTicketService.createTicket(aUser, flightService.getFlightByCode(flightCode));
            System.out.println(aUser.getFlightTicketList());
            return "successticket";
        }else {
            return "redirect:/";
        }
    }

    @PostMapping("/profile/{ticketCode}/download")
    public ResponseEntity downloadTicket(@PathVariable("ticketCode") String ticketCode, HttpServletRequest request){
        FlightTicket ticket = flightTicketService.getTicketByCode(ticketCode);
        PdfGenerator.generatePdf(ticket);

        Path path = Paths.get(PdfGenerator.getBasePath() + ticketCode + ".pdf");

        Resource resource = null;

        try {
            resource = new UrlResource(path.toUri());
        }catch (MalformedURLException e){
            e.printStackTrace();
        }
        assert resource != null;
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType("application/pdf"))
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);

    }

}
