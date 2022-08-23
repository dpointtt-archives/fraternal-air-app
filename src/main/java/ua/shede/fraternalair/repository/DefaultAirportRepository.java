package ua.shede.fraternalair.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.shede.fraternalair.entity.DefaultAirport;

@Repository
public interface DefaultAirportRepository extends JpaRepository<DefaultAirport, Long> {
}
