package ua.shede.fraternalair.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.shede.fraternalair.entity.Plane;

@Repository
public interface PlaneRepository extends JpaRepository<Plane, Long> {
}
