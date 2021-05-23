package otchetnost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import otchetnost.model.User;
import otchetnost.repository.CreateUserRepository;

import java.util.List;

@Service
public class CreateUserService {
    @Autowired
    private CreateUserRepository createUserRepository;
    @Transactional
    public Iterable<User> loadAllUsers(){
        return createUserRepository.findAll();
    }

    @Transactional
    public List<User> loadUserByLogin(String login){
        return createUserRepository.findByUsername(login);
    }

    @Transactional
    public User saveUsers(User users){
        return createUserRepository.save(users);
    }

    @Transactional
    public void deleteUser(User user){
        createUserRepository.delete(user);
    }

    @Transactional
    public User loadUser(int id){
        return createUserRepository.findById(id);
    }
}
