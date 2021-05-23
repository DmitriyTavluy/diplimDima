package otchetnost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import otchetnost.model.Role;
import otchetnost.model.User;
import otchetnost.repository.UserRepository;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegisterController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registrationUserInfo")
    public String registrationUserInfo() {
        return "registrationUserInfo";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addInfoAboutUser(User user, Map<String, Object> model) {

        User UserFromDB = userRepository.findByUsername(user.getUsername());

        if (UserFromDB != null) {
            model.put("message", "User with number or email already exist!" + user.getUsername());
            return "registrationUserInfo";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.SPECIALIST));
        userRepository.save(user);
        return "redirect:/login";
    }
}
