package ok.service.implementation;

import ok.entity.Speaker;
import ok.repository.SpeakerRepo;
import ok.service.SpeakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
@Service
public class SpeakerServiceImpl implements SpeakerService, UserDetailsService {
    @Autowired
    private SpeakerRepo speakerRepo;

    public void addOrEdit(Speaker speaker) {
        LocalDateTime localDateTime =  LocalDateTime.now();
        Instant instant = localDateTime.toInstant(ZoneOffset.UTC);
        Date date = Date.from(instant);
        speaker.setRegistrationDate(date);
        speakerRepo.save(speaker);
    }

    public void delete(int id) {
speakerRepo.delete(id);
    }

    public Speaker findOne(int id) {
        return speakerRepo.findOne(id);
    }

    public List<Speaker> findAll() {
        return speakerRepo.findAll();
    }

    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        Speaker speaker;
        try {
            speaker = speakerRepo.findByLogin(login);
        } catch (NoResultException e){
            return null;
        }
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        return new org.springframework.security.core.userdetails.User(String.valueOf(speaker.getId()),speaker.getPassword(), authorities);
    }
}
