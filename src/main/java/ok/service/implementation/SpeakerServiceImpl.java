package ok.service.implementation;

import jdk.nashorn.internal.objects.NativeArray;
import ok.entity.Report;
import ok.entity.Speaker;
import ok.entity.SpeakerShort;
import ok.repository.SpeakerRepo;
import ok.service.SpeakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

    public void addOrEdit(int id, String title, String  firstName, String  secondName, String  phone) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();


        Speaker speaker = speakerRepo.findOne(id);
        speaker.setTitle(title);
        speaker.setFirstName(firstName);
        speaker.setSecondName(secondName);
        speaker.setPhone(phone);
        /*speaker.setPassword(bCryptPasswordEncoder.encode(password));*/
        speakerRepo.saveAndFlush(speaker);
    }




    public void delete(int id) {
speakerRepo.delete(id);
    }

    public Speaker findOne(int id) {
        return speakerRepo.findOne(id);
    }
    public List<Speaker> findAll() {return speakerRepo.findAll();}

    public int participantsNumber() {
        return speakerRepo.participantsNumber();
    }

    public List<SpeakerShort> allSpeakers() {

        List<Speaker> speakers = speakerRepo.allSpeakers();
        List<SpeakerShort> speakerShorts = new ArrayList<SpeakerShort>();

        for (Speaker s: speakers) {
            SpeakerShort ss = new SpeakerShort(s);
            String temp = "";
            for (Report r: s.getReportList()) {
                temp += (r.getTitle()+";"+"<br>");
            }
            ss.setReports(temp);
            speakerShorts.add(ss);
        }
        return speakerShorts;
    }

    public List<SpeakerShort> speakers(int page, int proPage) {

        List<Speaker> speakers = speakerRepo.speakers(new PageRequest(page, proPage));
        List<SpeakerShort> speakerShorts = new ArrayList<SpeakerShort>();



        for (Speaker s: speakers) {
            SpeakerShort ss = new SpeakerShort(s);
            String temp = "";
            List<Report> reports = s.getReportList();
            int last = reports.size();
            for (int i =0; i<last; i++) {
                if (i == last-1){
                temp += ("- " + reports.get(i).getTitle()+".");
                }
                else {
                    temp += ("- " + reports.get(i).getTitle()+";"+"<br>");
                }
            }
            ss.setReports(temp);
            speakerShorts.add(ss);
        }
        return speakerShorts;
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
