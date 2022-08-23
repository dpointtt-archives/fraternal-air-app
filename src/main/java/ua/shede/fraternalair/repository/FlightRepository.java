package ua.shede.fraternalair.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import ua.shede.fraternalair.entity.Country;
import ua.shede.fraternalair.entity.Flight;

import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Long> {

    @Query("SELECT f from Flight f order by f.id desc")
    List<Flight> getAllFlights();

    Flight getFlightByFlightCode(String flightCode);

    List<Flight> getFlightsByCountry(Country country);

}
