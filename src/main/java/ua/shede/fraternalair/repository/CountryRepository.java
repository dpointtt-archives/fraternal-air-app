package ua.shede.fraternalair.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.shede.fraternalair.entity.Country;

import java.util.List;

@Repository
public interface CountryRepository extends JpaRepository<Country, Long> {

    boolean existsByCountryName(String countryName);
    Country getCountryByCountryName(String countryName);

}
