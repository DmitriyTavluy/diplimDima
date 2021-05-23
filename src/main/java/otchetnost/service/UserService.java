package otchetnost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import otchetnost.model.User;
import otchetnost.repository.UserRepository;

import java.util.List;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailService mailService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    @Transactional
    public Iterable<User> loadAllUsers(){
        return userRepository.findAll();
    }

    @Transactional
    public User saveUsers(User user){
        return userRepository.save(user);
    }

    @Transactional
    public void deleteUser(User user){
        userRepository.delete(user);
    }

    @Transactional
    public List<User> loadUserByActive(boolean active){
        return  userRepository.findByActive(active);
    }

    @Transactional
    public User loadUserById(int id){
        return userRepository.findById(id);
    }

    @Transactional
    public void leaveAnswer(User user){
        mailService.send(user.getMail(), "Остатки", String.format("Ваш отчет!.", user.getUsername()));
    }
}
