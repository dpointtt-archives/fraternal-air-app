package ua.shede.fraternalair.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.shede.fraternalair.entity.AUser;
import ua.shede.fraternalair.entity.AUserRole;

@Repository
public interface AUserRoleRepository extends JpaRepository<AUserRole, Long> {

    AUserRole getAUserRoleByRole(String role);

}
