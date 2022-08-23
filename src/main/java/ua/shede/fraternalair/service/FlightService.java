package ua.shede.fraternalair.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.shede.fraternalair.entity.Country;
import ua.shede.fraternalair.entity.Flight;
import ua.shede.fraternalair.repository.CountryRepository;
import ua.shede.fraternalair.repository.FlightRepository;

import java.util.List;

@Service
public class FlightService {

    private final FlightRepository flightRepository;
    private final CountryRepository countryRepository;

    @Autowired
    public FlightService(FlightRepository flightRepository,
                         CountryRepository countryRepository){
        this.flightRepository = flightRepository;
        this.countryRepository = countryRepository;
    }

    public List<Flight> getLastThreeFlights(){
        List<Flight> allFlights = flightRepository.getAllFlights();
        return allFlights.subList(Math.max(allFlights.size() - 3, 0), allFlights.size());
    }

    public List<Flight> getAllFlights(){
        return flightRepository.getAllFlights();
    }

    public Flight getFlightByCode(String code){
        return flightRepository.getFlightByFlightCode(code);
    }

    public boolean isCountry(String countryName){
        return countryRepository.existsByCountryName(countryName);
    }

    public List<Flight> getCountryFlights(String countryName){
        return flightRepository.getFlightsByCountry(countryRepository.getCountryByCountryName(countryName));
    }

    public List<Country> getAllCountries(){
        return countryRepository.findAll();
    }

}
