package ua.shede.fraternalair.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.shede.fraternalair.entity.AUser;

@Repository
public interface AUserRepository extends JpaRepository<AUser, Long> {

    boolean existsAUserByEmail(String email);
    boolean existsAUserByEmailAndPassword(String email, String password);

    AUser getAUserByEmailAndPassword(String email, String password);

}
