package ok.service.implementation;

import ok.entity.Tag;
import ok.repository.TagRepo;
import ok.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
@Service
public class TagServiceImpl implements TagService{
@Autowired
    private TagRepo tagRepo;

    public void addOrEdit(Tag tag) {
        tagRepo.save(tag);
    }

    public void delete(int id) {
tagRepo.delete(id);
    }

    public Tag findOne(int id) {
        return tagRepo.findOne(id);
    }

    public List<Tag> findAll() {
        return tagRepo.findAll();
    }
}
