package ok.service;

import ok.entity.Speaker;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
public interface SpeakerService {
    void addOrEdit (Speaker speaker);

    void delete (int id);
    Speaker findOne (int id);
    List<Speaker> findAll();
}
