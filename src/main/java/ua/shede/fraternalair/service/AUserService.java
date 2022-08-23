package ua.shede.fraternalair.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shede.fraternalair.entity.AUser;
import ua.shede.fraternalair.entity.FlightTicket;
import ua.shede.fraternalair.repository.AUserRepository;
import ua.shede.fraternalair.repository.AUserRoleRepository;

import java.util.List;

@Service
public class AUserService {

    private final AUserRepository aUserRepository;
    private final AUserRoleRepository aUserRoleRepository;

    @Autowired
    public AUserService(AUserRepository aUserRepository,
                        AUserRoleRepository aUserRoleRepository){
        this.aUserRepository = aUserRepository;
        this.aUserRoleRepository = aUserRoleRepository;
    }

    public void addNewUser(AUser aUser){
        aUser.setAUserRole(aUserRoleRepository.getAUserRoleByRole("ROLE_USER"));
        aUserRepository.save(aUser);
    }

    public boolean isUserExist(String email){
        return aUserRepository.existsAUserByEmail(email);
    }

    public boolean isUserExistByEmailAndPassword(String email, String password){
        return aUserRepository.existsAUserByEmailAndPassword(email, password);
    }

    public AUser getAUserByEmailAndPassword(String email, String password){
        return aUserRepository.getAUserByEmailAndPassword(email, password);
    }

    @Transactional
    public List<FlightTicket> getTicketList(AUser aUser){
        return aUser.getFlightTicketList();
    }

}
