package ok.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
@Entity
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @Column (length = 20)
    private String title;
    @Column (length = 20, nullable = false)
    private String firstName;
    @Column (length = 20, nullable = false)
    private String secondName;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "author_report", joinColumns = @JoinColumn(name = "id_author"), inverseJoinColumns = @JoinColumn(name = "id_report"))
    private List<Report> reportList;

    public Author() {
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

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondName() {
        return this.secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public List<Report> getReportList() {
        return this.reportList;
    }

    public void setReportList(List<Report> reportList) {
        this.reportList = reportList;
    }
}
