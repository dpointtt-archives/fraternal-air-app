package ua.shede.fraternalair.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.shede.fraternalair.entity.Airport;

@Repository
public interface AirportRepository extends JpaRepository<Airport, Long> {
}
