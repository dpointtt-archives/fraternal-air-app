package ua.shede.fraternalair.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shede.fraternalair.entity.AUser;
import ua.shede.fraternalair.entity.Flight;
import ua.shede.fraternalair.entity.FlightTicket;
import ua.shede.fraternalair.repository.AUserRepository;
import ua.shede.fraternalair.repository.FlightTicketRepository;

import java.util.UUID;

@Service
public class FlightTicketService {

    private final FlightTicketRepository flightTicketRepository;
    private final AUserRepository aUserRepository;

    @Autowired
    public FlightTicketService(FlightTicketRepository flightTicketRepository, AUserRepository aUserRepository){
        this.flightTicketRepository = flightTicketRepository;
        this.aUserRepository = aUserRepository;
    }

    @Transactional
    public void createTicket(AUser aUser, Flight flight){
        flight.setFlightFreeSeat(flight.getFlightFreeSeat() - 1);
        String code = UUID.randomUUID().toString();
        flightTicketRepository.save(new FlightTicket(null, code, aUser, flight));
        aUser.getFlightTicketList().add(flightTicketRepository.getFlightTicketByTicketCode(code));
        aUserRepository.save(aUser);
    }

    public FlightTicket getTicketByCode(String ticketCode){
        return flightTicketRepository.getFlightTicketByTicketCode(ticketCode);
    }

}
