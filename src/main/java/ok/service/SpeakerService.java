package ok.service;

import ok.entity.Speaker;
import ok.entity.SpeakerShort;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
public interface SpeakerService {
    void addOrEdit (Speaker speaker);
    void addOrEdit(int id, String title, String  firstName, String  secondName, String  phone);
    int participantsNumber();
    void delete (int id);
    Speaker findOne (int id);
    List<Speaker> findAll();
    List<SpeakerShort> allSpeakers();
    List<SpeakerShort> speakers(int page, int proPage);
}
