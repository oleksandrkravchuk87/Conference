package ok.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
@Entity
public class Tag {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String kayWord;
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tag_report", joinColumns = @JoinColumn(name = "id_tag"), inverseJoinColumns = @JoinColumn(name = "id_report"))
    private List<Report> reportList;

    public Tag() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKayWord() {
        return this.kayWord;
    }

    public void setKayWord(String kayWord) {
        this.kayWord = kayWord;
    }

    public List<Report> getReportList() {
        return this.reportList;
    }

    public void setReportList(List<Report> reportList) {
        this.reportList = reportList;
    }
}
