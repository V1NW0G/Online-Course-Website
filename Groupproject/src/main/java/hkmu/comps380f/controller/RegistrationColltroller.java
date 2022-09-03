package hkmu.comps380f.controller;

import hkmu.comps380f.dao.TicketUserRepository;
import hkmu.comps380f.model.TicketUser;
import java.io.IOException;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/registration")
public class RegistrationColltroller {

    @Resource
    TicketUserRepository ticketUserRepo;

    public static class Form {

        private String username;
        private String password;
        private String[] roles;
        private String fullname;
        private int phone;
        private String address;

        // ... getters and setters for each of the properties
        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }

        public String getFullname() {
            return fullname;
        }

        public void setFullname(String fullname) {
            this.fullname = fullname;
        }

        public int getPhone() {
            return phone;
        }

        public void setPhone(int phone) {
            this.phone = phone;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        
    }

    @GetMapping("")
    public ModelAndView create() {
        return new ModelAndView("registration", "ticketUser", new Form());
    }

    @PostMapping("")
    public View create(Form form) throws IOException {
        TicketUser user = new TicketUser(form.getUsername(),
                form.getPassword(), form.getRoles(),form.getFullname(),form.getPhone(),form.getAddress());
        ticketUserRepo.save(user);
        return new RedirectView("registration", true);
    }
    
      


}
