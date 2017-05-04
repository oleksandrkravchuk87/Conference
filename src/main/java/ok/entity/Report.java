package ok.entity;



import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;

import javax.persistence.*;
import java.util.Arrays;

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




    @ManyToOne(fetch = FetchType.EAGER)
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
                ", speaker=" + speaker +
                '}';
    }
}
