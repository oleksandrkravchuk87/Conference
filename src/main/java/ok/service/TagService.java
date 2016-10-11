package ok.service;

import ok.entity.Tag;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
public interface TagService {
    void addOrEdit (Tag tag);
    void delete (int id);
    Tag findOne (int id);
    List<Tag> findAll();
}
