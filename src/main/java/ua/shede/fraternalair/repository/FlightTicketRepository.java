package ua.shede.fraternalair.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.shede.fraternalair.entity.FlightTicket;

@Repository
public interface FlightTicketRepository extends JpaRepository<FlightTicket, Long> {

    FlightTicket getFlightTicketByTicketCode(String ticketCode);

}
