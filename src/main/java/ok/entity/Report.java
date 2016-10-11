package ok.entity;



import org.hibernate.search.annotations.Store;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Indexed;
import javax.persistence.*;
import org.hibernate.search.annotations.Index;
import java.util.Arrays;
import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */

@Entity
@Indexed
public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @Column (length = 100, nullable = false)
    @Field(index = Index.YES, analyze=Analyze.YES, store=Store.NO)
    private String title;

    @Column (length = 2000, nullable = false)
   @Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
    private String annotation;

    @Column(length=100, nullable=false)
    private String type;
    @Column
    @Lob @Basic(fetch = FetchType.LAZY)
    private byte[] presentation = new byte[1];
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tag_report", joinColumns = @JoinColumn(name = "id_report"), inverseJoinColumns = @JoinColumn(name = "id_tag"))
    private List<Tag> tagList;
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "author_report", joinColumns = @JoinColumn(name = "id_report"), inverseJoinColumns = @JoinColumn(name = "id_author"))
    private List<Author> authorList;

    @ManyToOne(fetch = FetchType.LAZY)
    private Speaker speaker;

    public Report() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAnnotation() {
        return this.annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

    public byte[] getPresentation() {
        return this.presentation;
    }

    public void setPresentation(byte[] presentation) {
        this.presentation = presentation;
    }

    public List<Tag> getTagList() {
        return this.tagList;
    }

    public void setTagList(List<Tag> tagList) {
        this.tagList = tagList;
    }

    public List<Author> getAuthorList() {
        return this.authorList;
    }

    public void setAuthorList(List<Author> authorList) {
        this.authorList = authorList;
    }

    public Speaker getSpeaker() {
        return this.speaker;
    }

    public void setSpeaker(Speaker speaker) {
        this.speaker = speaker;
    }


    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Report{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", annotation='" + annotation + '\'' +
                ", type='" + type + '\'' +
                ", presentation=" + Arrays.toString(presentation) +
                ", tagList=" + tagList +
                ", authorList=" + authorList +
                ", speaker=" + speaker +
                '}';
    }
}
