package ok.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by OKK on 20.09.2016.
 */
@Entity
public class Speaker {
@Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @Column (length = 10)
    private String title;
    @NotEmpty
    @Column (length = 20, nullable = false)
    private String firstName;
    @NotEmpty
    @Column (length = 20, nullable = false)
    private String secondName;
    @NotEmpty
    @Column (length = 20, nullable = false, unique = true)
    private String email;
    @NotEmpty
    @Column (length = 20, nullable = false)
    private String phone;
    @NotEmpty
    @Column (length = 1000, nullable = false)
    private String password;
    @Transient
    private String passwordConfirm;
    @Column
    @Temporal(TemporalType.DATE)
    private Date registrationDate;

    @OneToMany (fetch = FetchType.EAGER)
    private List<Report> reportList;

    public Speaker() {
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

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return this.passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public Date getRegistrationDate() {
        return this.registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public List<Report> getReportList() {
        return this.reportList;
    }

    public void setReportList(List<Report> reportList) {
        this.reportList = reportList;
    }
}
